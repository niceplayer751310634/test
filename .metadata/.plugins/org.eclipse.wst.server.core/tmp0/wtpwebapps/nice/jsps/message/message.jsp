<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <title>消息列表</title>
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">
  </head>
    <body style="background: white;">
    <h2 style="text-align: center;">消息列表</h2>
    <table align="center" border="1" cellpadding="0" cellspacing="0">
    	<tr class="trTitle">
    		<th width="400px;">消息</th>
    		<th width="200px;">时间</th>
    	</tr>
		<c:forEach items="${mess}" var="mess">    	
		    <tr>
		    	<td align="center">${mess.mess }</td>
		    	<td align="center">${mess.date }</td>
		    </tr>
		</c:forEach>
    </table>
  </body>
</html>
