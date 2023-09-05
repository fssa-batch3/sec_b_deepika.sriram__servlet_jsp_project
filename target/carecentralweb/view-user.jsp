<%@page import="in.fssa.carecentral.model.User"%>
<%@page import="in.fssa.carecentral.service.UserService"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
<style>
body {
	font-family: "Arial";
}

h2 {
	text-align: center;
}

section {
	width: 40%;
	box-shadow: 0px 0px 5px rgb(203, 202, 202);
	position: absolute;
	left: 30%;
	top: 10%;
	padding: 15px;
}

.detail {
	padding: 3px;
	border-bottom: 0.5px solid black;
}

button {
	width: 100%;
	padding: 10px;
	background-color: #08ad37;
	color: white;
	border: none;
}
</style>
</head>
<body>
	<%
	User user = (User) request.getAttribute("User");
	%>
	<section>
		<h2>User details</h2>
		<div>
			<h4>Name :</h4>
		</div>
		<div class="detail">
			<%=user.fullName()%>
		</div>
		<div>
			<h4>Age :</h4>
		</div>
		<div class="detail">
			<%=user.getAge()%>
		</div>
		<div>
			<h4>Gender :</h4>
		</div>
		<div class="detail">
			<%=user.getGender().name()%>
		</div>
		<div>
			<h4>Mobile number :</h4>
		</div>
		<div class="detail">
			<%=user.getMobileNumber()%>
		</div>
		<div>
			<h4>Email :</h4>
		</div>
		<div class="detail">
			<%=user.getEmailId()%>
		</div>
		<br>
		<a href='./../users'>
			<button type="button">back</button>
		</a>
	</section>
</body>
</html>