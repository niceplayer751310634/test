<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
	<head>
	<title>My JSP 'shopdesc.jsp' starting page</title>
	
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">
	<meta http-equiv="content-type" content="text/html;charset=utf-8">
	<link rel="stylesheet" type="text/css"
		href="<c:url value='/adminjsps/admin/css/book/add.css'/>">
	<link rel="stylesheet" type="text/css"
		href="<c:url value='/jquery/jquery.datepick.css'/>">
	<script type="text/javascript"
		src="<c:url value='/jquery/jquery-1.5.1.js'/>"></script>
	<script type="text/javascript"
		src="<c:url value='/jquery/jquery.datepick.js'/>"></script>
	<script type="text/javascript"
		src="<c:url value='/jquery/jquery.datepick-zh-CN.js'/>"></script>
	<script type="text/javascript">
		$(function() {
			$("#publishtime").datepick({
				dateFormat : "yy-mm-dd"
			});
			$("#printtime").datepick({
				dateFormat : "yy-mm-dd"
			});
			$("#btn").addClass("btn1");
			$("#btn").hover(function() {
				$("#btn").removeClass("btn1");
				$("#btn").addClass("btn2");
			}, function() {
				$("#btn").removeClass("btn2");
				$("#btn").addClass("btn1");
			});
			$("#btn").click(
					function() {
						var bname = $("#bname").val();
						var currPrice = $("#currPrice").val();
						var price = $("#price").val();
						var discount = $("#discount").val();
						var author = $("#author").val();
						var press = $("#press").val();
						var pid = $("#pid").val();
						var cid = $("#cid").val();
						var image_w = $("#image_w").val();
						var image_b = $("#image_b").val();
						if (!bname || !currPrice || !price || !discount || !author
								|| !press || !pid || !cid || !image_w || !image_b) {
							alert("图名、当前价、定价、折扣、卖家、商店名、1级分类、2级分类、大图、小图都不能为空！");
							return false;
						}
						if (isNaN(currPrice) || isNaN(price) || isNaN(discount)) {
							alert("当前价、定价、折扣必须是合法小数！");
							return false;
						}
						$("#form").submit();
					});
		});
		function loadChildren() {
			var pid = $("#pid").val();
			$.ajax({async : true,cache : false,url : "/nice/admin/AdminBookServlet",data : {
					method : "ajaxFindChildren",
					pid : pid
				},
				type : "POST",
				dataType : "json",
				success : function(arr) {
					$("#cid").empty();//删除元素的子元素
					$("#cid").append($("<option>====请选择2级分类====</option>"));
					for (var i = 0; i < arr.length; i++) {
						var option = $("<option>").val(arr[i].cid).text(
								arr[i].cname);
						$("#cid").append(option);
					}
				}
			});
		}
	</script>
	</head>
	
	<body>
		<div>
			<p style="font-weight: 900; color: red;">${msg }</p>
			<form action="<c:url value='/admin/AdminAddBookServlet'/>"
				enctype="multipart/form-data" method="post" id="form">
				<div>
					<ul>
						<li>商品名： <input id="bname" type="text" name="bname"
							value="汪汪泽" style="width: 500px;" /></li>
						<li>大图： <input id="image_w" type="file" name="image_w" /></li>
						<li>小图： <input id="image_b" type="file" name="image_b" /></li>
						<li>当前价：<input id="currPrice" type="text" name="currPrice"
							value="40.7" style="width: 50px;" /></li>
						<li>定价： <input id="price" type="text" name="price"
							value="59.0" style="width: 50px;" /> 折扣：<input id="discount"
							type="text" name="discount" value="6.9" style="width: 30px;" />折
						</li>
					</ul>
					<hr style="margin-left: 50px; height: 1px; color: #dcdcdc" />
					<table>
						<tr>
							<td colspan="3">卖家： <input type="text" id="author"
								name="author" value="Nice" style="width: 150px;" />
							</td>
						</tr>
						<tr>
							<td colspan="3">商店名： <input type="text" name="press"
								id="press" value="Nice'Shop" style="width: 200px;" />
							</td>
						</tr>
						<tr>
							<td colspan="3">生产日期：<input type="text" id="publishtime"
								name="publishtime" value="2016-3-1" style="width: 100px;" /></td>
						</tr>
						<tr>
							<td width="250">版本： <input type="text" name="edition"
								id="edition" value="1" /></td>
							<td width="250">类型： <input type="text" name="pageNum"
								id="pageNum" value="你猜猜" /></td>
							<td width="250">内容： <input type="text" name="wordNum"
								id="wordNum" value="猜你妹" /></td>
						</tr>
						<tr>
							<td width="250">生产时间：<input type="text" name="printtime"
								id="printtime" value="2016-3-1" style="width: 100px;" /></td>
							<td width="250">大小： <input type="text" name="booksize"
								id="booksize" value="20" style="width: 30px;" /></td>
							<td width="250">材质： <input type="text" name="paper"
								id="paper" value="尼姆合金" style="width: 80px;" /></td>
						</tr>
						<tr>
							<td>一级分类：<select name="pid" id="pid"
								onchange="loadChildren()">
									<option value="">====请选择1级分类====</option>
									<c:forEach items="${parents }" var="parent">
										<option value="${parent.cid }">${parent.cname }</option>
									</c:forEach>
	
							</select>
							</td>
							<td>二级分类：<select name="cid" id="cid">
									<option value="">====请选择2级分类====</option>
							</select>
							</td>
							<td></td>
						</tr>
						<tr>
							<td><input type="button" id="btn" class="btn" value="新商品上架">
							</td>
							<td></td>
							<td></td>
						</tr>
					</table>
				</div>
			</form>
		</div>
	</body>
</html>
