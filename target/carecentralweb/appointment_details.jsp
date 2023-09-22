<%@page import="in.fssa.carecentral.dto.AppointmentDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Appointment Details</title>
<link rel="stylesheet" href="./style_files/header.css">
<style>
body {
	font-family: "Arial";
}

h2 {
	text-align: center;
}

main form {
	width: 40%;
	box-shadow: 0px 0px 5px rgb(203, 202, 202);
	position: absolute;
	left: 30%;
	top: 20%;
	padding: 15px;
}

input {
	padding: 3px;
	border:none;
	width:100%;
	border-bottom: 0.5px solid black;
}
div{
	padding:10px 0;
}
label{
	font-weight:bold;
}

.button{
	display:flex;
	justify-content:space-between;
}
button {
	width: 250px;
	height:30px;
	padding: 10px;
	border: none;
}
#accepted{
	background-color:#08ad37;
	color:white;
}
#accepted:hover{
	background-color:white;
	color:#08ad37;
	border:0.5px solid #08ad37;
	transition:0.3s;
}
#rejected{
	background-color:#d00404;
	color:white;
}
#rejected:hover{
	color:#d00404;
	background-color:white;
	border:0.5px solid #d00404;
	transition:0.3s;
}
</style>
</head>
<body>
	<jsp:include page="header-2.jsp"></jsp:include>
	<%AppointmentDTO appointment = (AppointmentDTO)request.getAttribute("appointment"); %>
	<main>
	<a href="<%=request.getContextPath()%>/home" style="text-decoration:none;color:black;cursor:pointer">back</a>
		<form action="statusupdate" method="POST">
			<div>
				<label>Patient name</label>
			</div>
			<div>
				<input type="text" name="name" value="<%=appointment.getPatientName()%>" readonly>
			</div>
			<div>
				<label>Age</label>
			</div>
			<div>
				<input type="text" name = "age" value = "<%=appointment.getAge()%>" readonly>
			</div>
			<div>
				<label>Gender</label>
			</div>
			<div>
				<input type="text" name = "gender" value="<%=appointment.getGender().name()%>" readonly>
			</div>
			<div>
				<label>Mobile number</label>
			</div>
			<div>
				<input type="tel" name="mobile number" value="<%=appointment.getMobileNumber()%>" readonly>
			</div>
			<div>
				<label>Reason for consultation</label>
			</div>
			<div>
				<input type = "text" name="reason for consultation" value="<%=appointment.getReasonForConsultation()%>" readonly>
			</div>
			<div>
				<label>Method of consultation</label>
			</div>
			<div>
				<input type="text" name="method of consultation" value="<%=appointment.getMethodOfConsultation().name()%>" readonly>
			</div>
			<div>
				<label>Date of consultation</label>
			</div>
			<div>
				<input type="text" name="date of consultation" value="<%=appointment.getDateOfConsultation()%>" readonly>
			</div>
			<div>
				<label>Start time of consultation</label>
			</div>
			<div>
				<input type="text" name = "start time" value="<%=appointment.getStartTime()%>" readonly>
			</div>
			<div>
				<label>End time of consultation</label>
			</div>
			<div>
				<input type="text" name = "end time" value="<%=appointment.getEndTime()%>" readonly>
				<input type="hidden" id="clickedButton" name="status" value="">
				<input type="hidden" name="appointment Id" value="<%=request.getParameter("id")%>">
				<input type="hidden" name="user id" value="<%=appointment.getUserId()%>">
				<input type="hidden" name="doctor id" value="<%=appointment.getDoctorId()%>">
			</div>
			<%String status = appointment.getStatus().name();%>
			<%if(status.equals("Booked")){%>
			<section class="button">
				<div>
					<button type="submit" name="Approved"  id = "accepted" value="Approved" onclick="setStatus(this.value)">Accept</button>
				</div>
				<div>
					<button type="submit" name="Rejected" id = "rejected" value="Cancelled_by_doctor" onclick="setStatus(this.value)">Cancel</button>
				</div>
			</section>
			<%}%>
		</form>
	</main>
	<script type="text/javascript">
		function setStatus(value){
			document.getElementById("clickedButton").value = value;
		}
		
	</script>
</body>
</html>