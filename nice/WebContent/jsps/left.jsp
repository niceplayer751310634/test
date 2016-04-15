<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <title>left</title>
    <base target="body"/>
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	
	
	<meta http-equiv="content-type" content="text/html;charset=utf-8">
	<script type="text/javascript" src="<c:url value='/jquery/jquery-1.5.1.js'/>"></script>
	<script type="text/javascript" src="<c:url value='/menu/mymenu.js'/>"></script>
	<link rel="stylesheet" href="<c:url value='/menu/mymenu.css'/>" type="text/css" media="all">
	<link rel="stylesheet" type="text/css" href="<c:url value='/jsps/css/left.css'/>">
	<script language="javascript">
	var bar = new Q6MenuBar("bar", "网上购物系统");
	$(function() {
		bar.colorStyle = 4;//指定配色样式，一共0,1,2,3,4
		bar.config.imgDir = "<c:url value='/menu/img/'/>";//小工具所需图片的路径
		bar.config.radioButton=true;//是否排斥，多个一级分类是否排斥
	<c:forEach items="${parents}" var="parent">
  		<c:forEach items="${parent.children}" var="child">
		bar.add("${parent.cname}", "${child.cname}", "/nice/BookServlet?method=findByCategory&cid=${child.cid}", "body");
  		</c:forEach>
	</c:forEach>
	
	$("#menu").html(bar.toString());
	});
	</script>
  </head>
  
<body>  
  <div id="menu"></div>
</body>
</html>
