<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <title>组合查询</title>    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0"> 
	<link rel="stylesheet" type="text/css" href="<c:url value='/jsps/css/search.css'/>">
  </head>
  <body>
  <form action="<c:url value='/BookServlet'/>" method="get">
  	<input type="hidden" name="method" value="findByCombination"/>
		<table align="center">
			<tr>
				<td>商品名：</td>
				<td><input type="text" name="bname"/></td>
			</tr>
			<tr>
				<td>卖家：</td>
				<td><input type="text" name="author"/></td>
			</tr>
			<tr>
				<td>商店名：</td>
				<td><input type="text" name="press"/></td>
			</tr>
			<tr>
				<td>&nbsp;</td>
				<td>
					<input type="submit" value="搜　　索"/>
					<input type="reset" value="重新填写"/>
				</td>
			</tr>
		</table>
	</form>
  </body>
</html>