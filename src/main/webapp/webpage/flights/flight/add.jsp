<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<% 
   String contextPath = request.getContextPath(); 
   request.setAttribute("contextPath", contextPath);
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>Flight add</title>
<link href="${contextPath}/css/style.css" rel="stylesheet" type="text/css" />
</head>

<body>

	<div class="place">
    <span>位置：</span>
    <ul class="placeul">
    <li><a href="${contextPath }/index">首页</a></li>
    <li><a href="${contextPath }/flight/index">航班列表</a></li>
    <li><a href="#">修改新增</a></li>
    </ul>
    </div>
    
    <div class="formbody">
    
    <div class="formtitle"><span>添加数据</span></div>
    
    <form action="${contextPath}/flight/add">
	    <input name="" type="hidden" class="dfinput" />
	    <ul class="forminfo">
	  	<li><label>航班号</label><input name="flightNo" type="text" class="dfinput" /></li>
	  	<li><label>出发时间</label><input name="startTime" type="text" class="dfinput" /></li>
	  	<li><label>出发机场</label><input name="startAirportId" type="text" class="dfinput" /></li>
	  	<li><label>抵达时间</label><input name="arrivalTime" type="text" class="dfinput" /></li>
	  	<li><label>目的机场</label><input name="endAirportId" type="text" class="dfinput" /></li>
	  	<li><label>飞机</label><input name="planeId" type="text" class="dfinput" /></li>
	  	<li><label>实际出发时间</label><input name="startRealTime" type="text" class="dfinput" /></li>
	  	<li><label>实际抵达时间</label><input name="arrivalRealTIme" type="text" class="dfinput" /></li>
	  	<li><label>状态</label><input name="status" type="text" class="dfinput" /></li>
	    <li><label>&nbsp;</label><input name="" type="submit" class="btn" value="确认保存"/></li>
	    </ul>
    </form>
    
    
    </div>
</body>
</html>
