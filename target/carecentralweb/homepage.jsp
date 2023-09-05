<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>home page</title>
<style>
body {
	font-family: "Arial";
}

button {
	padding: 5px;
	background-color: #08ad37;
	color: white;
	border: none;
	height: 40px;
	margin : 0 10px;
}

button:hover {
	background-color: white;
	color: #08ad37;
	border: 0.5px solid #08ad37;
	transition: 0.3s;
}
</style>
</head>
<body>
	<h1>Welcome to this page!</h1>
	<a href="<%=request.getContextPath() %>/homepage/new"><button>Create an account</button></a>
	<a href = "<%=request.getContextPath()%>/doctors"><button>View doctors</button></a>
	<a href = "<%=request.getContextPath() %>/users"><button>View users</button></a>
</body>
</html>