<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Homepage</title>
<style>
	body{
		font-family : "Arial";
	}
</style>
</head>
<body>
	<h1>Welcome to this page!</h1>
	<h3>To create an account , <a href="<%=request.getContextPath() %>/homepage/new">click here!</a></h3>
	<h3>To view doctors <a href = "<%=request.getContextPath()%>/doctors">click here!</a></h3>
</body>
</html>