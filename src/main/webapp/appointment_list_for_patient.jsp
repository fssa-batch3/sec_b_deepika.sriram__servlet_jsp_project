<%@page import="in.fssa.carecentral.dto.AppointmentDTO"%>
<%@page import="java.util.Set"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>My appointments</title>
<link rel = "stylesheet" href = "./style_files/header.css">
<link rel = "stylesheet" href = "./style_files/appointment_list_for_patient.css">
</head>
<body>
<jsp:include page="header.jsp"></jsp:include>
<main>
<%Set<AppointmentDTO> appointmentList = (Set<AppointmentDTO>) request.getAttribute("appointments"); %>
<%if(appointmentList.isEmpty()==false) {%>
<h2>My appointments</h2>
	<table>
		<tr>
			<th>Name</th>
			<th>Doctor name</th>
			<th>Reason for consultation</th>
			<th>Booked at</th>
			<th>Date</th>
			<th>Time</th>
			<th>Method of consultation</th>
			<th>Status of appointment</th>
			<th>cancel</th>
			
		</tr>
		<%for(AppointmentDTO appointment : appointmentList){ %>
		<tr>
			<td data-appointment-id="<%=appointment.getId()%>"><%=appointment.getPatientName() %></td>
			<td data-user-id = "<%=appointment.getUserId()%>"><%=appointment.getDoctorName() %></td>
			<td data-doctor-id="<%=appointment.getDoctorId()%>"><%=appointment.getReasonForConsultation() %></td>
			<td><%=appointment.getDateOfBooking()%></td>
			<td><%=appointment.getDateOfConsultation() %></td>
			<td>From <%=appointment.getStartTime() %> To <%=appointment.getEndTime() %></td>
			<td><%=appointment.getMethodOfConsultation().name() %></td>
			<%if(appointment.getStatus().name().equals("Approved")){%>
				<td bgcolor="#aefcb7" color="#08ad37"><%=appointment.getStatus().name()%></td>
			<%}else if(appointment.getStatus().name().equals("Cancelled_by_doctor")){%>
				<td bgcolor="#fc8586" color="#d00404">cancelled by doctor</td>
			<%}else if(appointment.getStatus().name().equals("Cancelled_by_patient")){%>
				<td bgcolor = "#b2b2b2" color = "ffffff" id = "cancel">cancelled by you</td>
			<%}else{%>
				<td><%=appointment.getStatus().name() %></td>
			<%} %>
			<td><button class="cancel" type="button" >cancel appointment</button></td>
		</tr>
		<%}%>
	</table>
<%}else{ %>
	<img alt="searching of appointments" src="https://iili.io/JqHFnxS.jpg" style = "width : 25% ;position:relative ;left:38%">
	<h1 style="color : #08ad37; text-align:center">No appointments booked yet !! </h1>
<%} %>
</main>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script src="<%=request.getContextPath()%>/javascript_files/cancelappointment.js"></script>
</body>
</html>