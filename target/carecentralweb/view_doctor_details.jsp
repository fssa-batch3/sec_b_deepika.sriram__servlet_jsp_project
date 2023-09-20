<%@page import="in.fssa.carecentral.dto.DoctorDTO"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Doctor details</title>
<link rel = "stylesheet" href = "../style_files/header.css">
<link rel = "stylesheet" href = "../style_files/doctor_detail.css">
</head>
<body>
	<jsp:include page="header.jsp"></jsp:include>
	<main>
		<%
		DoctorDTO doctor = (DoctorDTO) request.getAttribute("Doctor");
		%>
		<section class="doctor_detail">
			<img src="<%=doctor.getDoctorImage() %>" alt="image of <%=doctor.fullName()%>">
			<div style="margin-left: 5%;">
				<div>
					<h2><%=doctor.fullName() %></h2>
				</div>
				<div style="display: flex;">
					<div>
						<p><%=doctor.getQualifications() %></p>
						<p>
							<b><%=(int)doctor.getExperience() %></b>
							years experience overall
						</p>
						<p style="font-weight: 800"><%=doctor.getDepartment() %></p>
					</div>
					<div style="margin-left: 5%">
						<p>
							<i class="fa-solid fa-clock"></i> : 9:00 am to 8:00 pm
						</p>
						<p>
							<i class="fa-solid fa-calendar-days"></i> : Monday to Friday
						</p>
						<a
							href="<%=request.getContextPath()%>/appointment/booknew?id=<%=doctor.getId()%>"
							style="text-decoration: none">
							<button type="button" id="book">Book Appointment</button>
						</a>
						<!-- <button type="button" id="reviewButton">Add review</button> -->
					</div>
				</div>
			</div>
		</section>
	</main>
</body>
</html>