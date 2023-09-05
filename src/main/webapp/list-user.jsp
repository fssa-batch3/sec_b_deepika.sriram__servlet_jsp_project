
<%@page import="in.fssa.carecentral.model.User"%>
<%@page import="java.util.Set"%>

<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<style>
body {
	font-family: "Arial";
}
div button{
	margin-top:5px;
	color:white;
	background-color:#08ad37;
	border:none;
	border-radius:2px;
	padding:5px;
}
div button:hover{
	color:#08ad37;
	background-color:white;
	border:0.5px solid #08ad37;
	transition :0.3s;
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
}

td {
  padding: 10px;
  border-bottom: 1px solid #ddd;
  border-left:0.5px solid #ddd;
  border-right:0.5px solid #ddd;
}

</style>
<title>list of users</title>
</head>
<body>
<div>
	<a href = "<%=request.getContextPath()%>/homepage">
		<button>Back to home page</button>
	</a>
</div>
	<br>
	<table>
		<tr>
			<th>User id</th>
			<th>First Name</th>
			<th>Last Name</th>
			<th>Age</th>
			<th>Gender</th>
			<th>Mobile number</th>
			<th>Email address</th>
			<th>View</th>
			<th>Update</th>
			<th>Delete</th>
		</tr>
		<%
		Set<User> userList = (Set<User>) request.getAttribute("Users");
		%>
		<%
		for (User user : userList) {
		%>

		<tr>
			<td><%=user.getId() %></td>
			<td><%=user.getFirstName()%></td>
			<td><%=user.getLastName()%></td>
			<td><%=user.getAge()%></td>
			<td><%=user.getGender()%></td>
			<td><%=user.getMobileNumber()%></td>
			<td><%=user.getEmailId()%></td>
			<td>
				<a href="users/user?id=<%=user.getId()%>">
					<button>view</button>
				</a>
			</td>
			<td>
				<a href="users/edit?id=<%=user.getId()%>">
					<button>update</button>
				</a>
			</td>
			<td>
				<a href="users/delete?id=<%=user.getId()%>">
					<button>delete</button>
				</a>
			</td>
		</tr>
		<%
		}
		%>
	</table>
</body>
</html>