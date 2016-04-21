<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>


<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <title>注册页面</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">
	
	 <!-- CSS -->
        <link rel="stylesheet" type="text/css" href="<c:url value='/jsps/user/css/reset.css'/>">
        <link rel="stylesheet" type="text/css" href="<c:url value='/jsps/user/css/supersized.css'/>">
        <link rel="stylesheet" type="text/css" href="<c:url value='/jsps/user/css/style.css'/>">
        <%-- <link rel="stylesheet" type="text/css" href="<c:url value='/jsps/css/user/regist.css'/>"> --%>
        
      <!-- Javascript -->
	 	<script src="http://apps.bdimg.com/libs/jquery/1.6.4/jquery.min.js" type="text/javascript"></script>
		<script type="text/javascript" src="<c:url value='/jsps/user/js/supersized.3.2.7.min.js'/>"></script>
	    <script type="text/javascript" src="<c:url value='/jsps/user/js/supersized-init.js'/>"></script>
		<script type="text/javascript" src="<c:url value='/jquery/jquery-1.5.1.js'/>"></script>
		<script type="text/javascript" src="<c:url value='/jsps/js/user/regist.js'/>"></script>
  </head>
  
  <body oncontextmenu="return false">
	<div class="page-container">
	  <h1>新用户注册</h1>
	  <div>
		<form action="<c:url value='/UserServlet'/>" method="post" id="registForm">
			<input type="hidden" name="method" value="regist"/>  
		    <table >
		      <tr>
		        <td width="80px">用户名：</td>
		        <td>
		          <input class="inputClass" type="text" name="loginname" id="loginname" value="${form.loginname }"/>
		        </td>
		      </tr>
		      <tr>
		      	<td height="20"></td>
		        <td>
		          <label class="errorClass" id="loginnameError">${errors.loginname }</label>
		        </td>
		      </tr>
		      <tr>
		        <td>登录密码：</td>
		        <td>
		          <input class="inputClass" type="password" name="loginpass" id="loginpass" value="${form.loginpass }"/>
		        </td>
		      </tr>
		      <tr>
		      	<td height="20"></td>
		        <td>
		          <label class="errorClass" id="loginpassError">${errors.loginpass }</label>
		        </td>
		      </tr>
		      <tr>
		        <td>确认密码：</td>
		        <td>
		          <input class="inputClass" type="password" name="reloginpass" id="reloginpass" value="${form.reloginpass }"/>
		        </td>
		      </tr>
		      <tr>
		      	<td height="20"></td>  
		        <td>
		          <label class="errorClass" id="reloginpassError">${errors.reloginpass}</label>
		        </td>
		      </tr>
		      <tr>
		        <td>Email：</td>
		        <td>
		          <input class="inputClass" type="text" name="email" id="email" value="${form.email}"/>
		        </td>
		      </tr>
		      <tr>
		      	<td height="20"></td>  
		        <td>
		          <label class="errorClass" id="emailError">${errors.email}</label>
		        </td>
		      </tr>
		      <tr>
		        <td>验证码：</td>
		        <td>
		          <input class="inputClass" type="text" name="verifyCode" id="verifyCode" value="${form.verifyCode }"/>
		        </td>
		      </tr>
		      <tr>
		      	<td height="20"></td>  
		        <td>
		          <label class="errorClass" id="verifyCodeError">${errors.verifyCode}</label>
		        </td>
		      </tr>
		      <tr>
		        <td></td>
		        <td align="right">
		          <img id="imgVerifyCode" src="<c:url value='/VerifyCodeServlet'/>"/>
		          <a href="javascript:_hyz()">换一张</a>
		        </td>
		      </tr>
		    </table>
		    <button id="sub" type="submit">注册</button>
		</form>    
	  </div>
	</div>
  </body>
</html>
