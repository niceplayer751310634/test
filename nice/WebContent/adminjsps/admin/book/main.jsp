<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>


<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <title>book1.jsp</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">
	<link rel="stylesheet" type="text/css" href="<c:url value='/adminjsps/admin/css/book.css'/>">
  </head> 
  <body>
  	<iframe class="div1" width="190px" frameborder="0" src="<c:url value='/admin/AdminBookServlet?method=findCategoryAll'/>" name="left"></iframe>
	<iframe class="div2" width="85%" frameborder="0" src="<c:url value='/adminjsps/admin/book/body.jsp'/>" name="body"></iframe>
  </body>
</html>
	
