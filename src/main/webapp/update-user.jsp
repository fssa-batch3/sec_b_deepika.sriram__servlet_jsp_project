<%@page import="in.fssa.carecentral.model.User"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
body{
	font-family:"Arial";
}
form {
	padding: 2% 5%;
	width: 30%;
	position: relative;
	margin-top: 7%;
	left: 30%;
	box-shadow: 0px 0px 5px rgb(203, 202, 202);
}

/* section {
	display: flex;
} */

section label {
	color: #1b3c74;
}

section input {
	background-color: #ecf9ff;
	border: none;
	height: 30px;
	width:100%;
}

select {
	background-color: #ecf9ff;
	border: none;
	height: 30px;
	border-radius: 5px;
}



button {
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
	User user = (User) request.getAttribute("user");
	%>
	<main>
		<form action="update?id=<%=user.getId()%>" method="POST">
			<h2>Profile</h2>
			<section>
				<div>
					<div>
						<label>First name</label>
					</div>
					<div>
						<input type="text" required=true name="first name"
							value=<%=user.getFirstName()%>>
					</div>
				</div>
				<br>
				<div>
					<div>
						<label>Last name</label>
					</div>
					<div>
						<input type="text" required=true name="last name"
							value=<%=user.getLastName()%>>
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
							value=<%=user.getAge()%>>
					</div>
				</div>
				<br>
				<div>
					<div>
						<label>Gender</label>
					</div>
					<div>
						<input type="text" required=true name="gender"
							value=<%=user.getGender().name()%>>
					</div>
				</div>
			</section>
			<br>
			<section>
				<div>
					<div>
						<label>Mobile number</label>
					</div>
					<div>
						<input type="tel" required=true name="mobile number"
							value=<%=user.getMobileNumber()%>>
					</div>
				</div>
				<br>
				<div>
					<div>
						<label>Email address</label>
					</div>
					<div>
						<input type="email" required=true name="email"
							value=<%=user.getEmailId()%> disabled>
					</div>
				</div>

			</section>
			<br>
			<section>
				<div>
					<div>
						<label for="">Create password</label>
					</div>
					<div>
						<input type="password" required=true name="password"
							value=<%=user.getPassword()%>>
					</div>
				</div>
			</section>
			<br>
			<div>
				<a href = "<%=request.getContextPath() %>/users">
					<button type="button">Back</button>
				</a>
				<br>
				<br>
				<button type="submit">Submit</button>
			</div>
		</form>
	</main>
</body>
</html>