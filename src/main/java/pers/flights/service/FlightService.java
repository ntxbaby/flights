package pers.flights.service;
import java.util.List;

import pers.flights.util.Attribute;
import pers.flights.util.Pager;
import pers.flights.model.Flight;

public interface FlightService {

	Flight searchByPrimaryKey(Integer id);
	
	List<Flight> searchByAttributes(List<Attribute> attributes);
	
	Pager search(Pager pager);
	
	int insert(Flight flight);

	int update(Flight flight);
	
	int delete(Integer id);
	
	List<Flight> searchByKeywords(List<String> list);
}