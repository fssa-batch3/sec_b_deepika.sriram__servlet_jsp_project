<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Registration of User</title>
</head>
<body>
	<form action="create" method = "POST">
		<label for = "first name">First name</label>
		<input type = "text" required = true name = "first name">
		
		<label for = "last name">Last name</label>
		<input type = "text" required = true name = "last name">
		
		<label for = "age">Age</label>
		<input type = "number" required = true name = "age">
		
		<label for = "gender"> Gender</label>
		<input type="checkbox"  name = "gender" value = "M"> male
		<input type = "checkbox"  name = "gender" value = "F">female
		<input type = "checkbox"  name = "gender" value = "O">others
		
		<label for = "mobile number"> Mobile number</label>
		<input type = "tel" required = true name = "mobile number">
		
		<label for = "email"> Email</label>
		<input type = "email" required = true name = "email">
		
		<label for = "password"> Password</label>
		<input type = "password" required = true name = "password">
		
		
		<button type = "submit" >Submit</button>
	</form>
</body>
</html>