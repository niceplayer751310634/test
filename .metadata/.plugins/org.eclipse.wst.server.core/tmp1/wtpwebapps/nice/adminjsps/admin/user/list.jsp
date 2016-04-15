<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <title>分类列表</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">
	<link rel="stylesheet" type="text/css" href="<c:url value='/css/css.css'/>">
  </head>
  <body style="background: white;">
    <h2 style="text-align: center;">用户列表</h2>
    <table align="center" border="1" cellpadding="0" cellspacing="0">
    	<tr class="trTitle">
    		<th width="100px;">用户名</th>
    		<th width="100px;">用户密码</th>
    		<th width="200px;">用户邮箱</th>
    		<th width="100px;">操作</th>
    	</tr>
	<c:forEach items="${user}" var="user">    	
	    <tr class="trOneLevel">
	    	<td align="center">${user.loginname }</td>
	    	<td align="center">${user.loginpass }</td>
	    	<td align="center">${user.email }</td>
	    	<td align="center">
	    	  <c:if test="${user.status == 1}">
	    	  <a onclick="return confirm('您是否真要注销该用户？')" href="<c:url value='/AdminServlet?method=delete&uid=${user.uid }'/>">注销</a>
	    	  </c:if>
	    	  <c:if test="${user.status == 2}">
	    	  <a onclick="return confirm('您是否真要恢复该用户？')" href="<c:url value='/AdminServlet?method=delete1&uid=${user.uid }'/>">恢复</a>
	    	  </c:if>
	    	</td>
	    </tr>
	</c:forEach>
    </table>
  </body>
</html>
