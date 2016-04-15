<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <title>body.jsp</title>  
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	
		
  </head>
  <body>
	<h1 align="center">商品管理</h1>
	<p align="center">
	<a href="<c:url value='/admin/AdminBookServlet?method=addPre'/>" style="font-size: 20px;">添加商品</a>
	</p>
  </body>
</html>
