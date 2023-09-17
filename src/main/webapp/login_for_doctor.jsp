<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Login</title>
<link rel = "stylesheet" href = "../style_files/header.css">
<link rel = "stylesheet" href = "../style_files/login.css">
</head>
<body>
	<jsp:include page="header.jsp"></jsp:include>
	<form action="doctorlogin" method="POST">
		<div style="text-align: center">
			<div>
				<img src="https://iili.io/HgM93tj.png" alt="logo of gws"
					style="width: 50%">
			</div>
			<div>
				<h1 style="color: #1b3c74">LOGIN</h1>
			</div>
		</div>
		<br>
		<div>
			<div>
				<label>Email address</label>
			</div>
			<div>
				<input type="email" required="true" name="email"
					style="width: 100%; height: 30px" />
			</div>
		</div>
		<br>
		<div>
			<div>
				<label>Password</label>
			</div>
			<div class="password_container">
				<input type="password" required="true" name="password"
					style="width: 100%; height: 30px"
					pattern="(?=.*\d)(?=.*[a-z])(?=.*[A-Z]).{8,}" /> <!-- <a
					id="toggle-password"> <span class="eye_icon hide" id="open_eye">
						<i class="fa fa-eye" style="color: #08ad37; font-size: 20px"></i>
				</span> <span class="eye_icon" id="close_eye"> <i
						class="fa fa-eye-slash" style="color: #1b3c74; font-size: 20px"></i>
				</span>
				</a> -->
			</div>
		</div>
		<br>
		<div style="text-align: center;">
			<div>
				<button type="submit">Login</button>
			</div>
			<br>
			<%-- <div>
				<a href="<%=request.getContextPath()%>/homepage/new"> new
					member? </a>
			</div> --%>
		</div>
	</form>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.2.1/js/all.min.js" integrity="sha512-rpLlll167T5LJHwp0waJCh3ZRf7pO6IT1+LZOhAyP6phAirwchClbTZV3iqL3BMrVxIYRbzGTpli4rfxsCK6Vw==" crossorigin="anonymous" referrerpolicy="no-referrer"></script>
	
</body>
</html>