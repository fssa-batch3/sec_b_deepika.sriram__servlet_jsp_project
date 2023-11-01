<%@page import="in.fssa.carecentral.model.User"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Appointment form</title>
<link rel = "stylesheet" href = "../style_files/header.css">
<script type="text/javascript" src="https://code.jquery.com/jquery-1.7.2.min.js"></script>
<link rel = "stylesheet" href = "../style_files/appointment.css">
</head>
<body>
	<jsp:include page="header.jsp"></jsp:include>
	<main>
	<%User user = (User)request.getAttribute("logged user"); %>
		<form action = "create" method = "POST">
                <h2 class="hr-lines">Patient Information</h2>
                <section class="appointment">
                    <div>
                        <div>
                            <label>First name</label>
                        </div>
                        <div>
                            <input type="text" id="patient_first_name" style="width:350px" name = "first name" value = "<%=user.getFirstName()%>"/>
                        </div>
                    </div>
                    <div style="margin-left:5%;">
                        <div>
                            <label>Last name</label>
                        </div>
                        <div>
                            <input type="text" id="patient_last_name" style="width:350px" name = "last name" value = "<%=user.getLastName()%>"/>
                        </div>
                    </div>
                </section>
                <br>
                <section class="appointment">
                    <div>
                        <div>
                            <label for="">Age</label>
                        </div>
                        <div>
                            <input type="number" id="patient_age" name = "age" value = "<%=user.getAge()%>"/>
                        </div>
                    </div>
                    <div style="margin-left:5%;">
                        <div>
                            <label for="">Gender</label>
                        </div>
                        <div>
                            <input type = "text" name = "gender" value = "<%=user.getGender().name()%>">
                        </div>
                    </div>
                    <div style="margin-left:5%;">
                        <div>
                            <label>Mobile number</label>
                        </div>
                        <div>
                            <input type="tel" id="mobile_number" style="width:350px" name = "mobile number" value = "<%=user.getMobileNumber()%>"/>
                        </div>
                    </div>
                </section>
                <br>
                <h2 class="hr-lines">Appointment information</h2>
                <section class="appointment">
                    <div>
                        <div>
                            <label for="">Health issues</label>
                        </div>
                        <div>
                            <input type="text" id="health_issues" style="width:225px" name = "health issues"/>
                        </div>
                    </div>
                    <div style="margin-left: 3%;">
                        <div>
                            <label for="">Method of consultation</label>
                        </div>
                        <div>
                            <input type = "checkbox" name = "method of consultation"  value = "In_person">In person
                            <input type = "checkbox" name = "method of consultation"  value = "Video_consultation">Video consultation
                        </div>
                    </div>
                    
                    <div style="margin-left:3%;">
                        <div>
                            <label for="">Date of consultation</label>
                        </div>
                        <div>
                            <input type="date" id="consultDate" style="width:225px" name = "date of consultation"/>
                        </div>
                    </div>
                </section>
                <br>
                <section class="appointment">
                    
                    <div>
                        <div>
                            <label for="">Start time</label>
                        </div>
                        <div>
                            <input type="time" id="address" style="width:325px" name = "start time"/>
                        </div>
                    </div>
                    <!-- <div style="margin-left:3.5%;">
                        <div>
                            <label for="">End time</label>
                        </div>
                        <div>
                            <input type="time" id="address" style="width:325px" name = "end time"/>
                        </div>
                    </div> -->
                </section>
                <br><br>
                <section>
                <input type ="hidden" name = "doctor_id" value = "<%=request.getAttribute("doctor id")%>">
                    <!-- <span>
                        <button type="button" id="back">Back</button>
                    </span> -->
                    <span>
                        <button type="submit">Book Appointment</button>
                    </span>
                </section>
            </form>
	</main>
	<script type="text/javascript" src = "<%=request.getContextPath()%>/javascript_files/past_date_disabler.js"></script>
</body>
</html>