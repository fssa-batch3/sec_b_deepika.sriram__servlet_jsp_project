<%@page import="in.fssa.carecentral.dto.DoctorDTO"%>
<header>
	<img id="logo" src="https://iili.io/HgM93tj.png"
		alt="logo of carecentral">
	<section class="head">
		<ul>
			<li><a href="<%=request.getContextPath()%>/home">Home</a></li>
		</ul>
		<div class="dropdown" style="width:15%">
			<a href="javascript:void(0)" class="dropbtn"><img alt="" src="https://iili.io/J9zTqvI.png" id="avatar"></a>
			<div class="dropdown-content">
			<%DoctorDTO doctor = (DoctorDTO) request.getSession().getAttribute("logged doctor");%>
			<%int doctorId = doctor.getId();%>
			<%pageContext.setAttribute("doctor id",doctorId);%>
				<a href="<%=request.getContextPath()%>/profile?id=<%=doctorId%>">View Profile</a>
				<a href="<%=request.getContextPath()%>/logout">Logout</a>
			</div>
		</div>
	</section>
</header>