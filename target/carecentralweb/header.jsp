<%@page import="in.fssa.carecentral.model.User"%>
<header>
	<img id="logo" src="https://iili.io/HgM93tj.png" alt="logo of carecentral">
	<%String loggedUserEmail = (String) request.getSession().getAttribute("email");%>
	<%User loggedUser = (User) request.getSession().getAttribute("logged user");  %>
	
	<%if(loggedUser==null){ %>
	<section class="head">
		<ul>
			<li><a href="<%=request.getContextPath()%>/homepage">Home</a></li>
			<li><a href = "<%=request.getContextPath()%>/about">About</a>
			<li><a href="<%=request.getContextPath()%>/homepage/new">Sign up</a></li>
		</ul>
		<div class="dropdown" style="width: 10%">
			<a href="javascript:void(0)" class="dropbtn">Login</a>
			<div class="dropdown-content">
				<a href="<%=request.getContextPath() %>/homepage/doctorlogin">Doctor</a> <a href="<%=request.getContextPath()%>/homepage/login">Patient</a>
			</div>
		</div>
	</section>
	<%}else if(loggedUser!=null){ %>
	<%int id = loggedUser.getId();%>
	<section class="head">
		<ul>
			<li><a href="<%=request.getContextPath()%>/homepage">Home</a></li>
			<li><a href = "<%=request.getContextPath()%>/about">About</a>
			<li><a href="<%=request.getContextPath()%>/doctors/list">Doctors
					</a></li>
		</ul>
		<div class="dropdown" style="width: 10%">
			<a href="javascript:void(0)" class="dropbtn"><img alt="" src="https://iili.io/J9zTqvI.png" id="avatar"></a>
			<div class="dropdown-content">
				<a href="<%=request.getContextPath() %>/users/user?id=<%=id%>">View profile</a>
				<a href="<%=request.getContextPath()%>/myappointments">My appointments</a>
				<a href="<%=request.getContextPath()%>/logout">Logout</a>
			</div>
		</div>
	</section>
	<%} %>
</header>