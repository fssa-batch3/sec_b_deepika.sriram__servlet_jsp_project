<%@page import="in.fssa.carecentral.model.User"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
	<%User user = (User) request.getAttribute("user"); %>
	<form action = "update?id=<%=user.getId() %>" method = "POST">
		<label>First name</label>
		<input type = "text" required = true name = "first name" value = <%=user.getFirstName() %>>
		
		<label>Last name</label>
		<input type = "text" required = true name = "last name" value = <%=user.getLastName() %>>
		
		<label>Age</label>
		<input type = "number" required = true name = "age" value = <%=user.getAge() %>>
		
		<label>Gender</label>
		<input type = "text" required = true name = "gender" value = <%=user.getGender().name() %>>
		
		<label>Mobile number</label>
		<input type = "tel" required = true name = "mobile number" value = <%=user.getMobileNumber() %>>
		
		<label>Email address</label>
		<input type = "email" required = true name = "email" value = <%=user.getEmailId() %>  disabled>
		
		<label>Password</label>
		<input type = "password" required = true name = "password" value = <%=user.getPassword() %>>
		
		<button type = "submit">Submit</button>
	</form>
</body>
</html>