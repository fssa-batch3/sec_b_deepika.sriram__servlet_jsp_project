<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Registration of User</title>
    <meta name="viewport" content="width=device-width,initial-scale=1.0">
	<link rel="stylesheet" href="../style_files/header.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
	<link rel = "stylesheet" href = "../style_files/register.css">
</head>
<body>
	<jsp:include page="header.jsp"></jsp:include>
	<main>
		<form class="sgn" action="create" method="POST">
			<img src="https://iili.io/HgM93tj.png" alt="logo for carecentral"
				style="width: 30%;">

			<h2 style="font-size: 35px; color: #1b3c74">SIGN UP</h2>
			<section>
				<div>
					<div>
						<label>First name</label>
					</div>
					<div>
						<input type="text" name="first name" style="width: 290px" required />
					</div>
				</div>
				<div style="margin-left: 20px">
					<div>
						<label>Last name</label>
					</div>
					<div>
						<input type="text" name="last name" style="width: 290px" required />
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
						<input type="number" name="age" style="width: 65px" title = "age must be atleast greater than 17" min = 17 max = 100 required/>
					</div>
				</div>
				<div style="margin-left: 20px;">
					<div>
						<label>Gender</label>
					</div>
					<div>
						<input type="checkbox" name="gender" value="M"> male <input
							type="checkbox" name="gender" value="F">female <input
							type="checkbox" name="gender" value="O">others <br>
					</div>
				</div>
				<div style="margin-left: 20px">
					<div>
						<label>Mobile number</label>
					</div>
					<div>
						<input type="tel" name="mobile number" pattern="[6-9]{1}[0-9]{9}" title="mobile number should start from between 6 and 9"
							style="width: 290px" required />
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
						<input type="email" name="email" title = "email should not contain any special characters except @ and ." style="width: 600px" required>
					</div>
				</div>
			</section>
			<br>
			<section>
				<div>
					<div>
						<label for="">Create password</label>
					</div>
					<div class="password_container">
						<input type="password" required="true" id="pass_1"
							pattern="(?=.*\d)(?=.*[a-z])(?=.*[A-Z]).{8,}"
							style="width: 600px" name="password"
							title="pattern must contain atleast one uppercase , one lowercase , one numerals and a special symbols" /> 
							<a id="toggle-password-1"> 
								<span class="eye_icon-1 hide" id="open_eye-1"> 
									<i class="fa fa-eye" style="color: #1b3c74; font-size: 20px"></i>
								</span> 
								<span class="eye_icon-1" id="close_eye-1"> 
									<i class="fa fa-eye-slash" style="color: #1b3c74; font-size: 20px"></i>
								</span>
							</a>
					</div>
				</div>
			</section>
			<br>
			<section>
				<div>
					<div>
						<label>Confirm password</label>
					</div>
					<div class="password_container">
						<input type="password" id="pass_2" required="true"
							pattern="(?=.*\d)(?=.*[a-z])(?=.*[A-Z]).{8,}"
							style="width: 600px" /> <a id="toggle-password-2"> <span
							class="eye_icon-2 hide" id="open_eye-2"> <i
								class="fa fa-eye" style="color: #1b3c74; font-size: 20px"></i>
						</span> <span class="eye_icon-2" id="close_eye-2"> <i
								class="fa fa-eye-slash" style="color: #1b3c74; font-size: 20px"></i>
						</span>
						</a>
					</div>
				</div>	
			</section>
			<br>
			<button type="submit" id="register">SIGN UP</button>
		</form>
	</main>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.2.1/js/all.min.js"
        integrity="sha512-rpLlll167T5LJHwp0waJCh3ZRf7pO6IT1+LZOhAyP6phAirwchClbTZV3iqL3BMrVxIYRbzGTpli4rfxsCK6Vw=="
        crossorigin="anonymous" referrerpolicy="no-referrer"></script>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.2.1/css/all.min.css"
        integrity="sha512-MV7K8+y+gLIBoVD59lQIYicR65iaqukzvf/nwasF0nqhPay5w/9lJmVM2hMDcnK1OnMGCdVK+iQrJ7lzPJQd1w=="
        crossorigin="anonymous" referrerpolicy="no-referrer">
	     <script src = "<%=request.getContextPath()%>/javascript_files/password_for_register.js"></script>
</body>
</html>