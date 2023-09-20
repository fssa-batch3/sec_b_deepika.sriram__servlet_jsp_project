// const back = document.getElementById("back");
// back.addEventListener('click' , function(){
//   window.history.back()
// })
const urlDoctor = new URLSearchParams(window.location.search).get('doctor-name')

function bookAppointment(e) {
    e.preventDefault();
    // collecting value from appointment form
    const patient_first_name = document.getElementById("patient_first_name").value.trim();
    const patient_last_name = document.getElementById("patient_last_name").value.trim();
    const patient_age = document.getElementById("patient_age").value.trim();
    const patient_gender = document.getElementById("gender").value;
    const method_of_consultation = document.getElementById("consultation_method").value;
    // const address = document.getElementById("address").value;
    const healthIssues = document
      .getElementById("health_issues")
      .value.split(",");
    const doctorName =  urlDoctor;
    const hospital_clinic_location = ""
    const dateandtime = new Date();

    const doctorId = new URLSearchParams(window.location.search).get('doctor-id');

    const dateOfBooking = dateandtime.toLocaleDateString('en-US');
    const timeOfBooking = dateandtime.toLocaleTimeString('en-US');

    let dateconsult = document.getElementById("consultDate").value;
    const dateConsult_2 = new Date(dateconsult);
    const dateOfConsultation = dateConsult_2.toLocaleDateString('en-US');
    const patient_mobile_number =document.getElementById("mobile_number").value;
    const timeOfConsultation = "";
    
    
    const appointment_id = uuidv4();

    const status = "Waiting"

    const user_email_id = JSON.parse(localStorage.getItem('uniqueUser'));
    const Appointments = JSON.parse(localStorage.getItem("appointments")) || [];
    if(patient_age>0 && patient_age<100){
      Appointments.push({
        patient_first_name,
        patient_last_name,
        patient_age,
        patient_gender,
        method_of_consultation,
        // address,
        healthIssues,
        doctorName,
        hospital_clinic_location,
        doctorId,
        dateOfConsultation,
        timeOfConsultation,
        status,
        user_email_id,
        dateOfBooking,
        timeOfBooking,
        patient_mobile_number,
        appointment_id,
      });
      localStorage.setItem("appointments", JSON.stringify(Appointments));
  
      document.querySelector("form").reset();
      alert(
        "Appointment form submitted successfully!! ✅ \n Check in history for seeing past appointments.."
      );
      window.location.href = "../../../index.html";
    }
    else{
      alert('Invalid age')
    }
    
  };
