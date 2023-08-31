<%@page import="in.fssa.carecentral.model.User"%>
<%@page import="java.util.Set"%>
<%@page import="in.fssa.carecentral.service.UserService"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<style>
	tr,th,td{
		font-family :"Arial";
		border: 1px solid black;
		padding: 10px;
	}
</style>
<title>Registration</title>
</head>
<body>
	<a href = "users/new">Create an account</a>
	<table>
		<tr>
			<th>First Name</th>
			<th>Last Name</th>
			<th>Age</th>
			<th>Gender</th>
			<th>Mobile number</th>
			<th>Email address</th>
			<th>View details</th>
			<th>Update</th>
			<th>Delete</th>
		</tr>
			<%Set<User> userList = (Set<User>) request.getAttribute("Users"); %>
			<%for(User user : userList){%>
		
		<tr>
			<td><%=user.getFirstName() %></td>
			<td><%=user.getLastName() %></td>
			<td><%=user.getAge() %></td>
			<td><%=user.getGender() %></td>
			<td><%=user.getMobileNumber() %></td>
			<td><%=user.getEmailId() %></td>
			<td><a href = "users/user?id=<%= user.getId()%>">View details</a></td>
			<td><a href = "users/edit?id=<%=user.getId() %>">Update details</a></td>
			<td><a href = "users/delete?id=<%=user.getId() %>">Delete</a></td>
		</tr>
		<%}%>
	</table>
</body>
</html>