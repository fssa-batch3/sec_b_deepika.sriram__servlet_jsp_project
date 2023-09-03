<%@page import="in.fssa.carecentral.dto.DoctorDTO"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>update doctor</title>
<style>
form{
	padding: 2% 5%;
	width: 45%;
	position: relative;
	margin-top: 2%;
	left: 22%;
	box-shadow: 0px 0px 5px rgb(203, 202, 202);
}

section {
	display: flex;
}

section label {
	color: #1b3c74;
}

section input {
	background-color: #ecf9ff;
	border: none;
	height: 30px;
	border-radius: 5px;
}

select {
	background-color: #ecf9ff;
	border: none;
	height: 30px;
	border-radius: 5px;
}

button{
	padding: 10px 20px;
	width: 100%;
	color: white;
	font-weight: bold;
	font-size: 20px;
	background-color: #08ad37;
	border: none;
}
</style>
</head>
<body>
	<%
	DoctorDTO doctor = (DoctorDTO) request.getAttribute("doctor");
	%>
	<main>
		<form action="update?id=<%=doctor.getId()%>" method="POST">
			<section>
				<div>
					<div>
						<label>First name</label>
					</div>
					<div>
						<input type="text" required=true name="first name"
							value=<%=doctor.getFirstName()%>>
					</div>
				</div>
				<div style="margin-left: 20px">
					<div>
						<label>Last name</label>
					</div>
					<div>
						<input type="text" required=true name="last name"
							value=<%=doctor.getLastName()%>>
					</div>
				</div>
			</section>
			<br>
			<section>
				<div>
					<div>
						<label>Age</label>
					</div>
					<div>
						<input type="number" required=true name="age"
							value=<%=doctor.getAge()%>>
					</div>
				</div>
				<div style="margin-left: 20px;">
					<div>
						<label>Gender</label>
					</div>
					<div>
						<input type="text" required=true name="gender"
							value=<%=doctor.getGender().name()%>>
					</div>
				</div>
				<div style="margin-left: 20px">
					<div>
						<label>Mobile number</label>
					</div>
					<div>
						<input type="tel" required=true name="mobile number"
							value=<%=doctor.getMobileNumber()%>>
					</div>
				</div>
			</section>
			<br>
			<section>
				<div>
					<div>
						<label>Email address</label>
					</div>
					<div>
						<input type="email" required=true name="email"
							value=<%=doctor.getEmailId()%> disabled>
					</div>
				</div>
				<div>
					<div>
						<label>Password</label>
					</div>
					<div>
						<input type="password" required=true name="password"
							value=<%=doctor.getPassword()%>>
					</div>
				</div>

			</section>
			<br>
			<section>
				<div>
					<div>
						<label>Qualifications</label>
					</div>
					<div>
						<input type="text" required=true name="qualifications"
							value=<%=doctor.getQualifications()%>>
					</div>
				</div>
				<div>
					<div>
						<label>Experience</label>
					</div>
					<div>
						<input type="number" required=true name="experience"
							value=<%=(int)doctor.getExperience()%>>
					</div>
				</div>
				<div>
					<div>
						<label>Department</label>
					</div>
					<div>
						<input type="text" required=true name="department"
							value=<%=doctor.getDepartment()%>>
					</div>
				</div>
			</section>
			<br>
			<button type="submit">Submit</button>
		</form>
	</main>
</body>
</html>