<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>


<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <title>商品详细</title> 
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">
	<meta http-equiv="content-type" content="text/html;charset=utf-8">
	<link rel="stylesheet" type="text/css" href="<c:url value='/jsps/pager/pager.css'/>" />
    <script type="text/javascript" src="<c:url value='/jsps/pager/pager.js'/>"></script>
	<script src="<c:url value='/jquery/jquery-1.5.1.js'/>"></script>	
	<link rel="stylesheet" type="text/css" href="<c:url value='/jsps/css/book/desc.css'/>">
	<script src="<c:url value='/jsps/js/book/desc.js'/>"></script>
  </head>
  
  <body>
  <div class="divBookName">${book.bname }</div>
  <div>
    <img align="top" src="<c:url value='/${book.image_w }'/>" class="img_image_w"/>
    <div class="divBookDesc">
	    <ul>
	    	<li>商品编号：${book.bid }</li>
	    	<li>会员价：<span class="price_n">&yen;${book.currPrice }</span></li>
	    	<li>定价：<span class="spanPrice">&yen;${book.price }</span>　折扣：<span style="color: #c30;">${book.discount }</span>折</li>
	    </ul>
		<hr class="hr1"/>
		<table>
			<tr>
				<td colspan="3">
					卖家：${book.author }
				</td>
			</tr>
			<tr>
				<td colspan="3">
					商店名：${book.press }
				</td>
			</tr>
			<tr>
				<td colspan="3">生产时间：${book.publishtime }</td>
			</tr>
			<tr>
				<td>版本：${book.edition }</td>
				<td>类型：${book.pageNum }</td>
				<td>内容：${book.wordNum }</td>
			</tr>
			<tr>
				<td width="180">出场日期：${book.printtime }</td>
				<td>大小：${book.booksize }米</td>
				<td>材料：${book.paper }</td>
			</tr>
		</table>
		<div class="divForm">
			<form id="form1" action="<c:url value='/CartItemServlet'/>" method="post">
				<input type="hidden" name="method" value="add"/>
				<input type="hidden" name="bid" value="${book.bid }"/>
  				我要买：<input id="cnt" style="width: 40px;text-align: center;" type="text" name="quantity" value="1"/>件
  			</form>
  			<a id="btn" href="javascript:$('#form1').submit();"></a>
  		</div>
  		<div>
		评论
		
		</div>
	</div>
  </div>
  </body>
</html>
