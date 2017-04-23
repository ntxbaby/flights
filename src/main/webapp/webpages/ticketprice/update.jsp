<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<% 
   String contextPath = request.getContextPath(); 
   request.setAttribute("contextPath", contextPath);
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>TicketPrice update</title>
<link href="${contextPath}/css/style.css" rel="stylesheet" type="text/css" />
</head>

<body>

	<div class="place">
    <span>位置：</span>
    <ul class="placeul">
    <li><a href="#">首页</a></li>
    <li><a href="#">表单</a></li>
    </ul>
    </div>
    
    <div class="formbody">
    
    <div class="formtitle"><span>修改数据</span></div>
    
    <form action="${contextPath}/ticketprice/update">
	    <input name="id" type="hidden" class="dfinput" value="${ticketprice.id }"/>
	    <ul class="forminfo">
	  	<li><label>舱位类型</label><input name="classType" type="text" class="dfinput" value="${ticketprice.classType }"/></li>
	  	<li><label>舱位数量</label><input name="classAmount" type="text" class="dfinput" value="${ticketprice.classAmount }"/></li>
	  	<li><label>价格</label><input name="price" type="text" class="dfinput" value="${ticketprice.price }"/></li>
	  	<li><label>航班编号</label><input name="flightId" type="text" class="dfinput" value="${ticketprice.flightId }"/></li>
	  	<li><label>折扣类型</label><input name="discountId" type="text" class="dfinput" value="${ticketprice.discountId }"/></li>
	  	<li><label>优惠价</label><input name="dprice" type="text" class="dfinput" value="${ticketprice.dprice }"/></li>
	  	<li><label>创建时间</label><input name="createTime" type="text" class="dfinput" value="${ticketprice.createTime }"/></li>
	    <li><label>&nbsp;</label><input name="" type="submit" class="btn" value="确认保存"/>&nbsp;&nbsp;<input name="" type="button" class="btn" value="返回" onclick="javascript:history.go(-1);"/></li>
	    </ul>
	    <input name="page" type="hidden" class="dfinput" value="${pager.page }"/>
    </form>
    
    
    </div>
</body>
</html>
