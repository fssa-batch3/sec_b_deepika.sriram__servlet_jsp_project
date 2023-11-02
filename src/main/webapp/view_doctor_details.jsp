<%@page import="in.fssa.carecentral.dto.DoctorDTO"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Doctor details</title>
    <meta name="viewport" content="width=device-width,initial-scale=1.0">
<link rel = "stylesheet" href = "../style_files/header.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<link rel = "stylesheet" href = "../style_files/doctor_detail.css">
<link rel="stylesheet" href="../style_files/footer.css">
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
	<jsp:include page="footer.jsp"></jsp:include>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.2.1/js/all.min.js"
        integrity="sha512-rpLlll167T5LJHwp0waJCh3ZRf7pO6IT1+LZOhAyP6phAirwchClbTZV3iqL3BMrVxIYRbzGTpli4rfxsCK6Vw=="
        crossorigin="anonymous" referrerpolicy="no-referrer"></script>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.2.1/css/all.min.css"
        integrity="sha512-MV7K8+y+gLIBoVD59lQIYicR65iaqukzvf/nwasF0nqhPay5w/9lJmVM2hMDcnK1OnMGCdVK+iQrJ7lzPJQd1w=="
        crossorigin="anonymous" referrerpolicy="no-referrer">
</body>
</html>