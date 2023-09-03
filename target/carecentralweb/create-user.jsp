<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Registration of User</title>

</head>
<body>
	<form action="create" method = "POST">
		<label for = "first name">First name</label>
		<input type = "text" required = true name = "first name">
		<br>
		<label for = "last name">Last name</label>
		<input type = "text" required = true name = "last name">
		<br>
		<label for = "age">Age</label>
		<input type = "number" required = true name = "age">
		<br>
		<label for = "gender"> Gender</label>
		<input type="checkbox"  name = "gender" value = "M"> male
		<input type = "checkbox"  name = "gender" value = "F">female
		<input type = "checkbox"  name = "gender" value = "O">others
		<br>
		<label for = "mobile number"> Mobile number</label>
		<input type = "tel" required = true name = "mobile number">
		<br>
		<label for = "email"> Email</label>
		<input type = "email" required = true name = "email">
		<br>
		<label for = "password"> Password</label>
		<input type = "password" required = true name = "password">
		<br>
		
		<button type = "submit" >Submit</button>
	</form>
</body>
</html>