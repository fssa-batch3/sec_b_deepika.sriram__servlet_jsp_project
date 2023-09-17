$(document).ready(function(){
	$(".cancel").click(function(){
		const row = $(this).closest("tr");
		const appointmentId = row.find("td[data-appointment-id]").data("appointment-id");
		console.log(appointmentId);
		const userId = row.find("td[data-user-id]").data("user-id");
		console.log(userId);
		const doctorId = row.find("td[data-doctor-id]").data("doctor-id");
		console.log(doctorId);
		const appointmentData = {
			id:appointmentId,
			patientId :userId,
			doctorId:doctorId,
			reasonForConsultation : row[0].querySelector("td:nth-child(3)").textContent,
			dateOfConsultation : row[0].querySelector("td:nth-child(5)").textContent,
			timeOfConsultation : row[0].querySelector("td:nth-child(6)").textContent,
			methodOfConsultation : row[0].querySelector("td:nth-child(7)").textContent,
			status:"Cancelled"
			
		};
		console.log(appointmentData);
		$.ajax({
			type:"POST",
			url:"http://localhost:8080/carecentralweb/cancel",
			data:{
				appointmentId : appointmentId,
				action:"cancel appointment",
				appointment:JSON.stringify(appointmentData)
			},
			success:function(){
				alert('Appointment cancelled successfully');
				window.location.href="http://localhost:8080/carecentralweb/myappointments";
				console.log("Appointment cancelled successfully");
			},
			/*error:function(){
				alert("Can't cancel the appointment");
				window.location.href="http://localhost:8080/carecentralweb/myappointments";
				console.log("Can't cancel the appointment");
			}*/
		});
	});
});