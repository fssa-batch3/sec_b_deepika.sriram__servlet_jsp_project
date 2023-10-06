<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Registration of User</title>
<link rel="stylesheet" href="../style_files/header.css">
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
						<input type="number" name="age" style="width: 120px" min = 17 max = 100 required />
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
						<input type="tel" name="mobile number" pattern="[6-9]{1}[0-9]{9}"
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
						<input type="email" name="email" style="width: 600px" required>
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
							style="width: 290px" name="password" title = "pattern must contain atleast one uppercase , one lowercase , one numerals and a special symbols"/> <a id="toggle-password-1">
							<span class="eye_icon-1 hide" id="open_eye-1"> <i
								class="fa fa-eye" style="color: #08ad37; font-size: 20px"></i>
						</span> <span class="eye_icon-1" id="close_eye-1"> <i
								class="fa fa-eye-slash" style="color: #1b3c74; font-size: 20px"></i>
						</span>
						</a>
					</div>
				</div>
				<div style="margin-left: 20px">
					<div>
						<label>Confirm password</label>
					</div>
					<div class="password_container">
						<input type="password" id="pass_2" required="true"
							pattern="(?=.*\d)(?=.*[a-z])(?=.*[A-Z]).{8,}"
							style="width: 290px" /> <a id="toggle-password-2"> <span
							class="eye_icon-2 hide" id="open_eye-2"> <i
								class="fa fa-eye" style="color: #08ad37; font-size: 20px"></i>
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
	<!-- <script>
		const togglePassword1 = document.querySelector("#toggle-password-1");
		const openedEye1 = document.querySelector("#open_eye-1");
		const closedEye1 = document.querySelector("#close_eye-1");

		let passwordVisibility1 = false;

		// eslint-disable-next-line func-names
		togglePassword1.addEventListener("click", function() {
			if (!passwordVisibility1) {
				openedEye1.classList.remove("hide");
				closedEye1.classList.add("hide");
				create_password.type = "text";
			} else {
				openedEye1.classList.add("hide");
				closedEye1.classList.remove("hide");
				create_password.type = "password";
			}
			passwordVisibility1 = !passwordVisibility1;
		});

		const togglePassword2 = document.querySelector("#toggle-password-2");
		const openedEye2 = document.querySelector("#open_eye-2");
		const closedEye2 = document.querySelector("#close_eye-2");

		let passwordVisibility2 = false;

		// eslint-disable-next-line func-names
		togglePassword2.addEventListener("click", function() {
			if (!passwordVisibility2) {
				openedEye2.classList.remove("hide");
				closedEye2.classList.add("hide");
				confirm_password.type = "text";
			} else {
				openedEye2.classList.add("hide");
				closedEye2.classList.remove("hide");
				confirm_password.type = "password";
			}
			passwordVisibility2 = !passwordVisibility2;
		});
	</script> -->
</body>
</html>