<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<% 
   String contextPath = request.getContextPath(); 
   request.setAttribute("contextPath", contextPath);
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>Airport index</title>
<link href="${contextPath }/css/style.css" rel="stylesheet" type="text/css" />
<script type="text/javascript" src="${contextPath }/js/jquery.js"></script>

<script type="text/javascript">
$(document).ready(function(){

  $(".add").click(function(){
	  location.href = "${contextPath }/airport/intoAdd";
  });
  
  $(".update").click(function(){
	  if($("[name='id']:checked").length != 1) {
		  alert("只能选中一条记录修改！");
		  return;
	  }
	  var id = $("[name='id']:checked").val();
	  location.href = "${contextPath }/airport/intoUpdate?id="+id+"&page=${pager.page }";
  });

  $(".delete").click(function(){
	  if(confirm("确定删除多条记录？")) {
		  if($("[name='id']:checked").length == 0) return;
		  var url = "${contextPath }/airport/delete?";
		  $("[name='id']:checked").each(function() {
		  	url = url+"id="+$(this).val()+"&";			  		
		  });
		  location.href = url;
	  }
  });

});
</script>


</head>


<body>

	<div class="place">
    <span>位置：</span>
    <ul class="placeul">
    <li><a href="#">首页</a></li>
    <li><a href="#">数据表</a></li>
    <li><a href="#">基本内容</a></li>
    </ul>
    </div>
    
    <div class="rightinfo">
    
    <div class="tools">
    
    	<ul class="toolbar">
        <li class="add"><span><img src="${contextPath }/images/t01.png" /></span>添加</li>
        <li class="update"><span><img src="${contextPath }/images/t02.png" /></span>修改</li>
        <li class="delete"><span><img src="${contextPath }/images/t03.png" /></span>删除</li>
        <li><span><img src="${contextPath }/images/t04.png" /></span>统计</li>
        </ul>
        
        
        <ul class="toolbar1">
        <li><span><img src="${contextPath }/images/t05.png" /></span>显示设置</li>
        </ul>
    
    </div>
    
    
    <table class="tablelist">
    	<thead>
    	<tr>
        <th><input class="checkAll" type="checkbox" value=""/></th>
        <th>机场名称</th>
        <th>所属城市</th>
        <th>创建时间</th>
        <th>操作</th>
        </tr>
        </thead>
        <tbody>
        <c:forEach items="${pager.datas }" var="airport">
	        <tr>
	        <td><input name="id" type="checkbox" value="${airport.id }" /></td>
	        <td>${airport.airportName }</td>
	        <td>${airport.airportCity }</td>
	        <td>${airport.createTime }</td>
	        <td>
		        <a href="#" class="tablelink">查看</a>     
		        <a href="${contextPath }/airport/intoUpdate?&id=${airport.id }&page=${pager.page }" class="tablelink">修改</a>
		        <a href="${contextPath }/airport/delete?id=${airport.id }&page=${pager.page }" onclick="javascript:if(!confirm('确定删除该记录？')) return false;" class="tablelink">删除</a>
	        </td>
	        </tr> 
        </c:forEach>
        </tbody>
    </table>
    
   
    <div class="pagin">
    	<div class="message">共<i class="blue">${pager.total }</i>条记录，当前显示第&nbsp;<i class="blue">${pager.page }&nbsp;/&nbsp;${pager.pageSum }&nbsp;</i>页</div>
        <ul class="paginList" style="right: 140px">
	    	<li class="paginItem"><a href="javascript:goPage(1);">首页</a></li>
	        <li class="paginItem"><a href="javascript:goPage(${pager.pageSum });">末页</a></li>
	        <li class="paginItem current"><a href="javascript:;">跳转</a></li>
	        <li class="paginItem"><input id="page_input" type="text" class="dfinput" value="${pager.page }" style="width:30px;height: 28px"/></li>
	        <li class="paginItem"><a href="javascript:goPage('x');">GO</a></li>
	    </ul>
	    <ul class="paginList">
	        <li class="paginItem"><a href="javascript:goPage(${pager.page-1 });"><span class="pagepre"></span></a></li>
	        <li class="paginItem current"><a href="javascript:;">${pager.page }</a></li>
	        <li class="paginItem"><a href="javascript:goPage(${pager.page+1 });"><span class="pagenxt"></span></a></li>
        </ul>				
    </div>
    
    </div>
    
    <script type="text/javascript">
	$('.tablelist tbody tr:odd').addClass('odd');
	$('.checkAll').click(function(){
		if($('.checkAll').attr('checked')) {
			$("[name='id']").attr("checked",'true');//全选
		}
		else {
			$("[name='id']").removeAttr("checked");//取消全选
		}
	});
	function goPage(pageNum) {
		if(pageNum == 'x') {
			pageNum = document.getElementById('page_input').value;
		}
		if(pageNum > 0 && pageNum <= '${pager.pageSum }') {
			location.href = "${contextPath }/airport/index?page="+pageNum;
		}
	}
	</script>
</body>
</html>