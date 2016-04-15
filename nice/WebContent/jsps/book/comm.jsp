<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <title>评论列表</title>
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">
  </head>
  <body style="background: white;">
    <h2 style="text-align: center;">评论列表</h2>
    <table align="center" border="1" cellpadding="0" cellspacing="0">
    	<tr class="trTitle">
    		<th width="100%;">评论</th>
    	</tr>
	<c:forEach items="${order}" var="order">    	
	    <tr>
	    	<td width="100%" align="center">${order.comm}</td>
	    </tr>
	</c:forEach>
    </table>
  </body>
</html>
