<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Registration of User</title>
<style>
form {
	position: relative;
	margin-top: 10%;
	left: 35%;
	width: 30%;
	padding: 2% 2%;
	box-shadow: 0px 0px 5px rgb(203, 202, 202);
	font-family: "Arial";
	color: #1b3c74;
}

input[type="text"], [type="number"], [type="url"], [type="email"], [type="tel"],
	[type="password"] {
	width: 100%;
	height: 20px;
	background-color: #ecf9ff;
	border: none;
}

button {
	width: 100%;
	background-color: #08ad37;
	color: white;
	padding: 10px;
	border: none;
}
button:hover{
	background-color: white;
	color: #08ad37;
	border: 1px solid #08ad37;
	transition : 0.3s;
}

h2 {
	text-align: center;
}
</style>
</head>
<body>
	<form action="create" method="POST">
	<h2>Create account</h2>
		<div>
			<label for="first name">First name</label> <br> 
			<input
				type="text" required=true name="first name"> <br>
		</div>
		<br>
	<div></div>
		<div>
			<label for="last name">Last name</label> <br> <input type="text"
				required=true name="last name"> <br>
		</div>
		<br>
	<div></div>
		<div>
			<label for="age">Age</label> <br>
			<input type="number" required=true name="age"> <br>
		</div>
	<div></div>
	<br>
		<div>
			<label for="gender"> Gender</label> <br>
			<input type="checkbox" name="gender" value="M"> male <input
				type="checkbox" name="gender" value="F">female <input
				type="checkbox" name="gender" value="O">others <br>
		</div>
	<div></div>
	<br>
		<div>
			<label for="mobile number"> Mobile number</label> <br>
			<input type="tel" required=true name="mobile number"> <br>
		</div>
	<div></div>
	<br>
		<div>
			<label for="email"> Email</label> <br>
			<input type="email" required=true name="email"> <br>
		</div>
	<div></div>
	<br>
		<div>
			<label for="password"> Password</label> <br>
			<input type="password" required=true name="password"> <br>
		</div>
	<div></div>
	<br>
		
		<button type = "submit" >Submit</button>
	</form>
</body>
</html>