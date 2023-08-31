<%@page import="in.fssa.carecentral.model.User"%>
<%@page import="in.fssa.carecentral.service.UserService"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
	<%User user = (User) request.getAttribute("User"); %>
	<table>
		<tr>
			<th>First Name</th>
			<th>Last Name</th>
			<th>Age</th>
			<th>Gender</th>
			<th>Mobile number</th>
			<th>Email address</th>
		</tr>
		<tr>
			<td><%=user.getFirstName() %></td>
			<td><%=user.getLastName() %></td>
			<td><%=user.getAge() %></td>
			<td><%=user.getGender() %></td>
			<td><%=user.getMobileNumber() %></td>
			<td><%=user.getEmailId() %></td>
		</tr>
	</table>
</body>
</html>