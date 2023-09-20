<%@page import="in.fssa.carecentral.dto.AppointmentDTO"%>
<%@page import="java.util.Set"%>
<%@page import="in.fssa.carecentral.dto.DoctorDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Home page</title>
<style>
main {
	margin-top: 60px;
}

h2 {
	text-align: center;
}

table {
	width: 100%;
	border-collapse: collapse;
	font-family: Arial, sans-serif;
}

th {
	background-color: #f2f2f2;
	text-align: left;
	padding: 10px;
	border: 2px solid #ddd;
}

td {
	padding: 10px;
	border-bottom: 1px solid #ddd;
	border-left: 0.5px solid #ddd;
	border-right: 0.5px solid #ddd;
}
</style>
<link rel="stylesheet" href="./style_files/header.css">
</head>
<body>
	<jsp:include page="header-2.jsp"></jsp:include>
	<main>
		<%DoctorDTO doctor = (DoctorDTO) request.getAttribute("doctor"); %>
		<%Set<AppointmentDTO> appointmentList = (Set<AppointmentDTO>) request.getAttribute("appointmentList");%>
		<table>
			<tr>
				<th>Patient Name</th>
				<th>Date of consultation</th>
				<th>Status</th>
				<th>View details</th>
			</tr>
			<%for(AppointmentDTO appointment : appointmentList){%>
			<tr>
				<td><%=appointment.getPatientName()%></td>
				<td><%=appointment.getDateOfConsultation() %></td>
				<td><%=appointment.getStatus() %></td>
				<td>
					<a href="<%=request.getContextPath()%>/appointmentdetail?id=<%=appointment.getId()%>">
						<button>View</button>
					</a>
				</td>
			</tr>
			<%} %>
		</table>
		
	</main>
</body>
</html>