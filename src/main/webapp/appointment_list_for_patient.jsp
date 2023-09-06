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

<h2>My appointments</h2>
	<table>
		<tr>
			<th>Name</th>
			<th>Doctor name</th>
			<th>Reason for consultation</th>
			<th>Date</th>
			<th>Time</th>
			<th>Status of appointment</th>
			
		</tr>
		<%Set<AppointmentDTO> appointmentList = (Set<AppointmentDTO>) request.getAttribute("appointments"); %>
		<%for(AppointmentDTO appointment : appointmentList){ %>
		<tr>
			<td><%=appointment.getPatientName() %></td>
			<td><%=appointment.getDoctorName() %></td>
			<td><%=appointment.getReasonForConsultation() %></td>
			<td><%=appointment.getDateOfConsultation() %></td>
			<td>From <%=appointment.getStartTime() %> To <%=appointment.getEndTime() %></td>
			<td><%=appointment.getStatus() %></td>
		</tr>
		<%} %>
	</table>
</main>
</body>
</html>