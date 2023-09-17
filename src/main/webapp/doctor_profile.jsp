<%@page import="in.fssa.carecentral.dto.DoctorDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Profile</title>
<style>
body {
	font-family: "Arial";
}

h2 {
	text-align: center;
}

form {
	width: 35%;
	box-shadow: 0px 0px 5px rgb(203, 202, 202);
	position: absolute;
	left: 30%;
	top: 20%;
	padding: 5px 25px;
}

.detail {
	padding: 3px;
	border-bottom: 0.5px solid black;
	width:100%;
}
.profile{
	display:flex;
}

button {
	width: 100%;
	padding: 10px;
	background-color: #08ad37;
	color: white;
	border: none;
}
</style>
<link rel="stylesheet" href="./style_files/header.css">
</head>
<body>
	<jsp:include page="header-2.jsp"></jsp:include>
	 <form>
	 <%DoctorDTO doctor = (DoctorDTO) request.getAttribute("doctor");%>
	<h2>PROFILE</h2>
		<section class="profile">
			<div style="width:530px">
				<div>
					<h4>Name </h4>
				</div>
				<div class="detail" >
					<%=doctor.fullName()%>
				</div>
			</div>	
		</section>
		<section class="profile">
			<div style="width:250px">
				<div>
					<h4>Age </h4>
				</div>
				<div class="detail">
					<%=doctor.getAge()%>
				</div>
			</div>
			<div style="width:250px;margin-left:30px">
				<div>
					<h4>Gender </h4>
				</div>
				<div class="detail">
					<%=doctor.getGender().name()%>
				</div>
			</div>
		</section>
		<section class="profile">
			<div style="width:250px">
				<div>
					<h4>Mobile number </h4>
				</div>
				<div class="detail">
					<%=doctor.getMobileNumber()%>
				</div>
			</div>
			<div style="width:250px;margin-left:30px">
				<div>
					<h4>Email </h4>
				</div>
				<div class="detail">
					<%=doctor.getEmailId()%>
				</div>
			</div>
		</section>
		<section class="profile">
			<div style="width:530px">
				<div>
					<h4>Qualifications </h4>
				</div>
				<div class="detail">
					<%=doctor.getQualifications()%>
				</div>
			</div>
		</section>
		<section class="profile">
			<div style="width:250px">
				<div>
					<h4>Experience </h4>
				</div>
				<div class="detail">
					<%=(int) doctor.getExperience() + " years"%>
				</div>
			</div>
			<div style="width:250px;margin-left:30px">
				<div>
					<h4>Department </h4>
				</div>
				<div class="detail">
					<%=doctor.getDepartment()%>
				</div>
			</div>
		</section>
		<br>
		<a href ="<%=request.getContextPath()%>/home">
			<button type = "button">back</button>
		</a>
	</form>
</body>
</html>