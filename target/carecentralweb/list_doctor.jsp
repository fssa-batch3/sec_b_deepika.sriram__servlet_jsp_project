<%@page import="in.fssa.carecentral.dto.DoctorDTO"%>
<%@page import="java.util.Set"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>list of doctors</title>
<style>
	tr,th,td{
		font-family :"Arial";
		border: 1px solid black;
		padding: 10px;
	}	
</style>
</head>
<body>
	<a href = 'doctors/new'>Add doctor</a>
	<table>
		<tr>
			<th>Doctor id</th>
			<th>First Name</th>
			<th>Last Name</th>
			<th>Age</th>
			<th>Gender</th>
			<th>Mobile number</th>
			<th>Email address</th>
			<th>Qualifications</th>
			<th>Experience</th>
			<th>Department</th>
			<th>View</th>
			<th>Edit</th>
			<th>Delete</th>
		</tr>
		<%Set<DoctorDTO> doctors = (Set<DoctorDTO>) request.getAttribute("Doctors"); %>
		<%for(DoctorDTO doctor : doctors){ %>
		<tr>
			<td><%= doctor.getId()%></td>
			<td><%= doctor.getFirstName() %></td>
			<td><%= doctor.getLastName() %></td>
			<td><%= doctor.getAge() %></td>
			<td><%= doctor.getGender().name() %></td>
			<td><%= doctor.getMobileNumber() %></td>
			<td><%= doctor.getEmailId() %></td>
			<td><%= doctor.getQualifications() %></td>
			<td><%= (int)doctor.getExperience()+" years" %></td>
			<td><%= doctor.getDepartment() %></td>
			<td><a href = "doctors/view?id=<%=doctor.getId()%>">View</a></td>
			<td><a href = "doctors/edit?userid=<%=doctor.getUserId()%>&id=<%=doctor.getId()%>">Edit</a></td>
			<td><a href = "doctors/delete?id=<%=doctor.getId()%>">Delete</a></td>
		</tr>
		<%} %>
	</table>
</body>
</html>