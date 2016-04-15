<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <title>分类栏</title>
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<script type="text/javascript" src="<c:url value='/jquery/jquery-1.5.1.js'/>"></script>
	<script type="text/javascript" src="<c:url value='/menu/mymenu.js'/>"></script>
	<link rel="stylesheet" href="<c:url value='/menu/mymenu.css'/>" type="text/css" media="all">
	<link rel="stylesheet" type="text/css" href="<c:url value='/adminjsps/admin/css/book/left.css'/>">
	<script language="javascript">
	var bar = new Q6MenuBar("bar", "网上购物系统");
	$(function() {
		bar.colorStyle = 2;
		bar.config.imgDir = "<c:url value='/menu/img/'/>";
		bar.config.radioButton=true;
	<c:forEach items="${parents}" var="parent">
	  <c:forEach items="${parent.children}" var="child">
		bar.add("${parent.cname}", "${child.cname}", "/nice/admin/AdminBookServlet?method=findByCategory&cid=${child.cid}", "body");
	  </c:forEach>
	</c:forEach>
		
		$("#menu").html(bar.toString());
	});
	</script>
  </head>
  
  <body onload="load()" style="margin:0px;">
	<div id="menu"></div>
  </body>
</html>
