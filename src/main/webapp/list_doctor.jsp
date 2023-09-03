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
body {
	font-family: "Arial";
}
div{
	display:flex;
	justify-content:space-between;
}
div button{
	padding:5px;
	background-color:#08ad37;
	color:white;
	border : none;
	height:30px;
}
div button:hover{
	background-color:white;
	color:#08ad37;
	border:0.5px solid #08ad37;
	transition : 0.3s;
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
  /* border-left:0.5px solid black;
  border-right:0.5px solid black; */
}
/* 
tr:nth-child(odd) {
  background-color: #f2f2f2;
} */

td {
  padding: 10px;
  border-bottom: 1px solid #ddd;
  border-left:0.5px solid #ddd;
  border-right:0.5px solid #ddd;
}


</style>
</head>
<body>
	<div>
		<a href='doctors/new'>
			<button type="button">Add new doctor</button>
		</a> <a href="<%=request.getContextPath()%>/homepage">
			<button type="button">Back to home page</button>
		</a>
	</div>
	<br>
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
		<%
		Set<DoctorDTO> doctors = (Set<DoctorDTO>) request.getAttribute("Doctors");
		%>
		<%
		for (DoctorDTO doctor : doctors) {
		%>
		<tr>
			<td><%=doctor.getId()%></td>
			<td><%=doctor.getFirstName()%></td>
			<td><%=doctor.getLastName()%></td>
			<td><%=doctor.getAge()%></td>
			<td><%=doctor.getGender().name()%></td>
			<td><%=doctor.getMobileNumber()%></td>
			<td><%=doctor.getEmailId()%></td>
			<td><%=doctor.getQualifications()%></td>
			<td><%=(int) doctor.getExperience() + " years"%></td>
			<td><%=doctor.getDepartment()%></td>
			<td>
				<a href="doctors/view?id=<%=doctor.getId()%>">
					<button type="button">View</button>
				</a>
			</td>
			<td>
				<a href="doctors/edit?userid=<%=doctor.getUserId()%>&id=<%=doctor.getId()%>">
					<button type="button">Edit</button>
				</a>
			</td>
			<td>
				<a href="doctors/delete?id=<%=doctor.getId()%>">
					<button type="button">delete</button>
				</a>
			</td>
		</tr>
		<%
		}
		%>
	</table>
</body>
</html>