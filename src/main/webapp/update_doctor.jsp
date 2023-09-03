<%@page import="in.fssa.carecentral.dto.DoctorDTO"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>update doctor</title>
<style>
form {
	position: relative;
	/* margin-top: 5%; */
	left: 35%;
	width: 30%;
	padding: 2% 2%;
	box-shadow: 0px 0px 5px rgb(203, 202, 202);
	font-family: "Arial";
	color:#1b3c74;
}

input[type="text"], [type="number"], [type="url"], [type="email"], [type="tel"],
	[type="password"] {
	width: 100%;
	height: 20px;
	background-color: #ecf9ff;
	border:none;
}

button {
	width: 100%;
	background-color: #08ad37;
	color: white;
	padding: 10px;
	border: none;
}
h2{
	text-align:center;
}
</style>
</head>
<body>
	<%
	DoctorDTO doctor = (DoctorDTO) request.getAttribute("doctor");
	%>
	<main>
		<form action="update?id=<%=doctor.getId() %>" method="POST">
	<h2>Update doctor</h2>
		<div>
			<label for="first name">First name</label> <br> 
			<input
				type="text" required=true name="first name" value=<%=doctor.getFirstName() %>> <br>
		</div>
		<br>
	<div></div>
		<div>
			<label for="last name">Last name</label> <br> <input type="text"
				required=true name="last name" value = <%=doctor.getLastName() %>> <br>
		</div>
		<br>
	<div></div>
		<div>
			<label for="age">Age</label> <br>
			<input type="number" required=true name="age" value=<%=doctor.getAge() %>> <br>
		</div>
	<div></div>
	<br>
		<div>
			<label for="gender"> Gender</label> <br>
			<input type = "text" required = "true" name="gender" value=<%=doctor.getGender().name() %>>
		</div>
	<div></div>
	<br>
		<div>
			<label for="mobile number"> Mobile number</label> <br>
			<input type="tel" required=true name="mobile number" value=<%=doctor.getMobileNumber() %>> <br>
		</div>
	<div></div>
	<br>
		<div>
			<label for="email"> Email</label> <br>
			<input type="email" required=true name="email" value=<%=doctor.getEmailId() %> disabled> <br>
		</div>
	<div></div>
	<br>
		<div>
			<label for="password"> Password</label> <br>
			<input type="password" required=true name="password" value=<%=doctor.getPassword() %>> <br>
		</div>
	<div></div>
	<br>
		<div>
			<label for="qualifications">Qualifications</label> <br>
			<input type="text" required="true" name="qualifications" value=<%=doctor.getQualifications() %>> <br>
		</div>
	<div></div>
	<br>
		<div>
			<label for="experience">Experience</label> <br>
			<input type="number" required="true" name="experience" value=<%=doctor.getExperience() %>> <br>
		</div>
	<div></div>
	<br>
		<div>
			<label for="department">Department</label> <br>
			<input type="text" required=true name="department" value=<%=doctor.getDepartment() %>> <br>
		</div>
	<div></div>
	<br>
		<div>
			<label for="doctor image">Doctor image</label> <br>
			<input type="url" required=true name="doctor image" value=<%=doctor.getDoctorImage() %>> <br>
		</div>
	<div></div>
	<br>
		<button type="submit">Submit</button>
	</form>
	</main>
</body>
</html>