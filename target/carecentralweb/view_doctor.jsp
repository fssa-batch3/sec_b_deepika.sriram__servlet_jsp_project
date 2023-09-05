<%@page import="in.fssa.carecentral.dto.DoctorDTO"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>View doctor</title>
<style>
body {
	font-family: "Arial";
}
h2{
	text-align :center;
}
section{
	width:40%;
	box-shadow: 0px 0px 5px rgb(203, 202, 202);
	position : absolute;
	left:30%;
	top:10%;
	padding : 15px;
}
.detail {
	padding: 3px;
	border-bottom: 0.5px solid black;
}
button{
	width:100%;
	padding: 10px;
	background-color:#08ad37;
	color:white;
	border:none;
}
</style>
</head>
<body>
	<%
	DoctorDTO doctor = (DoctorDTO) request.getAttribute("Doctor");
	%>
	<section>
	<h2>Doctor details</h2>
		<div>
			<h4>Name :</h4>
		</div>
		<div class="detail">
			<%=doctor.fullName()%>
		</div>
		<div>
			<h4>Age :</h4>
		</div>
		<div class="detail">
			<%=doctor.getAge()%>
		</div>
		<div>
			<h4>Gender :</h4>
		</div>
		<div class="detail">
			<%=doctor.getGender().name()%>
		</div>
		<div>
			<h4>Mobile number :</h4>
		</div>
		<div class="detail">
			<%=doctor.getMobileNumber()%>
		</div>
		<div>
			<h4>Email :</h4>
		</div>
		<div class="detail">
			<%=doctor.getEmailId()%>
		</div>
		<div>
			<h4>Qualifications :</h4>
		</div>
		<div class="detail">
			<%=doctor.getQualifications()%>
		</div>
		<div>
			<h4>Experience :</h4>
		</div>
		<div class="detail">
			<%=(int) doctor.getExperience() + " years"%>
		</div>
		<div>
			<h4>Department :</h4>
		</div>
		<div class="detail">
			<%=doctor.getDepartment()%>
		</div>
		<br>
		<a href = './../doctors'>
			<button type = "button">back</button>
		</a>
	</section>



</body>
</html>