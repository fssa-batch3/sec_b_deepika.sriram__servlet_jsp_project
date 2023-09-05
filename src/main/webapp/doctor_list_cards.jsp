<%@page import="in.fssa.carecentral.dto.DoctorDTO"%>
<%@page import="java.util.Set"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Doctors list</title>
<link rel = "stylesheet" href = "../style_files/header.css">
<link rel = "stylesheet" href = "../style_files/doctor_list.css">
</head>
<body>
<jsp:include page="header.jsp"></jsp:include>
<main>
	<h2>Doctors list</h2>
	<section>
		<%Set<DoctorDTO> listOfDoctors = (Set)request.getAttribute("DoctorList"); %>
		<%for(DoctorDTO doctor : listOfDoctors){ %>
			<div class="card">
				<div>
					<img src="<%=doctor.getDoctorImage() %>">
				</div>
				<div>
					<h3 style="font-size: 20px"><%=doctor.fullName() %></h3>
					<p><%=doctor.getDepartment() %></p>
				</div>
				<div>
					<a
						href="<%=request.getContextPath()%>/doctors/viewdoctor?id=<%=doctor.getId()%>">
						<button type="button">View doctor</button>
					</a>
				</div>
			</div>
			<%} %>
		</section>
</main>
</body>
</html>