<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <title>管理员登录页面</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">
	<link rel="stylesheet" type="text/css" href="<c:url value='/css/login.css'/>">
	<script type="text/javascript" src="<c:url value='/jquery/jquery-1.5.1.js'/>"></script>
	<script type="text/javascript">
		function checkForm() {
			if(!$("#adminname").val()) {
				alert("管理员名称不能为空！");
				return false;
			}
			if(!$("#adminpwd").val()) {
				alert("管理员密码不能为空！");
				return false;
			}
			return true;
		}
	</script>
  </head>
  
  <body>
	<h1>管理员登录页面</h1>
  	<p>${msg}</p>
  	<div>
	<form action="<c:url value='/AdminServlet'/>" method="post" onsubmit="return checkForm()" target="_top">
		<input type="hidden" name="method" value="login"/>
		<br/>
		管理员账户：<input type="text" name="adminname" value="" id="adminname"/><br/>
		<br/>
		密　　　码：<input type="password" name="adminpwd" id="adminpwd"/><br/>
		<br/>
		<input type="submit" value="进入后台"/>
	</form>
	</div>
  </body>
</html>
