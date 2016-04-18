function _change() {
	$("#vCode").attr("src", "nice/VerifyCodeServlet?" + new Date().getTime());
}