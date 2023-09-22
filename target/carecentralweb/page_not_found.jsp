<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>404 - Page not found</title>
<style>
h1 {
	text-align: center;
	color: #06ad37;
	font-family : Arial;
	font-size : 60px;
}
img{
	position : relative;
	top : 20%;
	left : 30%;
}
</style>
</head>
<body>
	<img src = "<%=request.getContextPath()%>/images/404_error.gif">
	<h1>PAGE NOT FOUND</h1>
</body>
</html>