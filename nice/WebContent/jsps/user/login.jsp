<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head> 
    <title>登录</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0"> 
	<meta http-equiv="content-type" content="text/html;charset=utf-8">
	
	 <!-- CSS -->
        <link rel="stylesheet" href="css/reset.css">
        <link rel="stylesheet" href="css/supersized.css">
        <link rel="stylesheet" href="css/style.css">
		<%-- <link rel="stylesheet" type="text/css" href="<c:url value='/jsps/css/user/login.css'/>"> --%>
	
	 <!-- Javascript -->
	 	<script src="http://apps.bdimg.com/libs/jquery/1.6.4/jquery.min.js" type="text/javascript"></script>
		<script type="text/javascript" src="<c:url value='/jsps/user/js/supersized.3.2.7.min.js'/>"></script>
	    <script type="text/javascript" src="<c:url value='/jsps/user/js/supersized-init.js'/>"></script>
		<script type="text/javascript" src="<c:url value='/jquery/jquery-1.5.1.js'/>"></script>
		<script type="text/javascript" src="<c:url value='/jsps/js/user/login.js'/>"></script>
		<script src="<c:url value='/js/common.js'/>"></script>
		<script type="text/javascript">
			$(function() {/*Map<String(Cookie名称),Cookie(Cookie本身)>*/
				// 获取cookie中的用户名
				var loginname = window.decodeURI("${cookie.loginname.value}");
				if("${requestScope.user.loginname}") {
					loginname = "${requestScope.user.loginname}";
				}
				$("#loginname").val(loginname);
			});
		</script>
	  </head>
	
	<body oncontextmenu="return false">
		<div class="page-container">
			<h1>会员登录</h1>
			<div>
				<form target="_top" action="<c:url value='/UserServlet'/>"
					method="post" id="loginForm">
					<input type="hidden" name="method" value="login" />
					<table>
						<tr>
							<td width="55px"></td>
							<td width="270px"><label class="error" id="msg">${msg}</label></td>
						</tr>
						<tr>
							<td width="55px">用户名:</td>
							<td><input class="input" type="text" name="loginname"
								id="loginname" class="username" /></td>
						</tr>
						<tr>
							<td width="55px" height="20">&nbsp;</td>
							<td><label id="loginnameError" class="error"></label></td>
						</tr>
						<tr>
							<td width="55">密&nbsp&nbsp&nbsp码:</td>
							<td><input class="input" type="password" name="loginpass"
								id="loginpass" class="password" /></td>
						</tr>
						<tr>
							<td height="20">&nbsp;</td>
							<td><label id="loginpassError" class="error"></label></td>
						</tr>
						<tr>
							<td width="55">验证码:</td>
							<td><input type="text" name="verifyCode"
								id="verifyCode" value="${user.verifyCode }" />
							</td>
						</tr>
						<tr>
							<td height="20px">&nbsp;</td>
							<td><label id="verifyCodeError" class="error"></label></td>
						</tr>
						<tr>
							<td></td>
							<td align="right">
								<img id="vCode" src="<c:url value='/VerifyCodeServlet'/>" />
								<a id="verifyCode" href="javascript:_change()">换张图</a></td>
						</tr>
					</table>
					<button id="sub" type="submit">登录</button>
				</form>
			</div>
		</div>
	</body>
</html>
	