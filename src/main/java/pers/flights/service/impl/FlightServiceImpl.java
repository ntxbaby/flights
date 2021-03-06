package pers.flights.service.impl;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import pers.flights.mapper.FlightMapper;
import pers.flights.mapper.TicketPriceMapper;
import pers.flights.model.Flight;
import pers.flights.service.FlightService;
import pers.flights.util.Attribute;
import pers.flights.util.Pager;

@Service
public class FlightServiceImpl implements FlightService {

	@Resource
	private FlightMapper flightMapper;
	
	@Autowired
	private TicketPriceMapper ticketPriceMapper;
	
	public Flight searchByPrimaryKey(Integer id){
		return flightMapper.selectByPrimaryKey(id);
	}
	
	@Transactional
	public int insert(Flight flight) {
		flight.setCreateTime(new Date());
		return flightMapper.insert(flight);
	}
	
	@Transactional
	public int update(Flight flight) {
		return flightMapper.updateByPrimaryKey(flight);
	}
	
	@Transactional
	public int delete(Integer id){
		return flightMapper.deleteByPrimaryKey(id);
	}
	
	public Pager search(Pager pager) {
		if(pager == null){
		  pager = new Pager();
		}
		List<Flight> items = flightMapper.search(pager);
		long total = flightMapper.getTotal();
		pager.setTotal(total);
		pager.setDatas(items);	  
		return pager;
	}

	/**
	 * 模糊查询
	 * @param attributes
	 * @return
	 */
	public List<Flight> searchByKeywords(List<String> keywords) {
		return flightMapper.searchByKeywords(keywords);
	}

	/**
	 * 按属性查询
	 * @param attributes
	 * @return
	 */
	public List<Flight> searchByAttributes(List<Attribute> attributes) {
		return flightMapper.searchByAttributes(attributes);
	}
	
	/**
	 * 查询详细航班
	 * @return
	 */
	public List<Map<String, Object>> searchFlights(String startCity, String arrivalCity, Date startTime) {
		List<Map<String, Object>> flightsList = flightMapper.searchFlights(startCity, arrivalCity, startTime);
		List<Map<String, Object>> flightsList_new = new ArrayList<Map<String, Object>>();
		//查询关联(舱位)票价
		for(Map<String, Object> flight : flightsList) {
			List<Map<String, Object>> ticketPriceList = ticketPriceMapper.searchByFlightid((Integer) flight.get("flightid"));
			flight.put("ticketPrice", ticketPriceList);
			flightsList_new.add(flight);
		}
		return flightsList_new;
	}
	
	/**
	 * 按航班号查询航班
	 * @return
	 */
	public List<Map<String, Object>> searchFlightsByNo(String flightNo, Date startTime) {
		return flightMapper.searchFlightsByNo(flightNo, startTime);
	}
}