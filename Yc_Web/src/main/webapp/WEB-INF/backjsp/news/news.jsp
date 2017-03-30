<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>查看公司新闻</title>
<style type="text/css">
.news {
	width: 1000px;
	margin: 0 auto;
	border:1px dashed #cccccc;
}
</style>
</head>
<body>
	<%
		request.setCharacterEncoding("utf-8");
		String newsbody = request.getParameter("n_content");
	%>

	<div class="news">
		

	</div>
</body>
</html>