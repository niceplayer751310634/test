<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <title>top</title>    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">
	<meta http-equiv="content-type" content="text/html;charset=utf-8">
	<link rel="stylesheet" type="text/css" href="<c:url value='/jsps/css/top.css'/>">
  </head>
  
  <body>
	<h1>网上购物系统</h1>
	<div>
	<c:choose>
		<c:when test="${empty sessionScope.sessionUser }">
		  <a href="<c:url value='/jsps/user/login.jsp'/>" target="_parent">会员登录</a> |&nbsp; 
		  <a href="<c:url value='/jsps/user/regist.jsp'/>" target="_parent">注册会员</a>	
		</c:when>
		<c:otherwise>
		      会员：${sessionScope.sessionUser.loginname }&nbsp;&nbsp;|&nbsp;&nbsp;
		  <a href="<c:url value='/CartItemServlet?method=myCart'/>" target="body">我的购物车</a>&nbsp;&nbsp;|&nbsp;&nbsp;
		  <a href="<c:url value='/OrderServlet?method=myOrders'/>" target="body">我的订单</a>&nbsp;&nbsp;|&nbsp;&nbsp;
		  <a href="<c:url value='/MessageServlet?method=findmy'/>" target="body">我的消息</a>&nbsp;&nbsp;|&nbsp;&nbsp;
		  <a href="<c:url value='/jsps/user/pwd.jsp'/>" target="body">修改密码</a>&nbsp;&nbsp;|&nbsp;&nbsp;
		  <a href="<c:url value='/UserServlet?method=quit'/>" target="_parent">退出</a>&nbsp;&nbsp;|&nbsp;&nbsp;	
		</c:otherwise>
	</c:choose>
	</div>
  </body>
</html>
