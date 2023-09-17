// const p_f_name = document.getElementById("patient_first_name");
// const p_l_name = document.getElementById("patient_last_name");
// const p_age = document.getElementById("patient_age");
// const p_gender = document.getElementById("gender");


const consult_method = document.getElementById("consultation_method");

// const p_address = document.getElementById("address");
const p_healthIssues = document.getElementById("health_issues");

const p_d_name = document.getElementById("doctor_name");


const p_d_c = document.getElementById("consultDate");
// const p_mobile = document.getElementById("mobile_number");



const patientstatus = document.getElementById('status');
const today = new Date();

const reasonField = document.getElementById('reasonPart');
const reason = document.getElementById('rejected_reason');



const appointmentId = new URLSearchParams(window.location.search).get(
  "appointment-id"
);
const appointmentList = JSON.parse(localStorage.getItem("appointments"));
const appointmentData = appointmentList.find(
  (detail) => detail.appointment_id === appointmentId
);
console.log(appointmentData)

if (appointmentData) {
  // p_f_name.value = appointmentData.patient_first_name;
  // p_l_name.value = appointmentData.patient_last_name;
  // p_age.value = appointmentData.patient_age;

  // p_gender.value = appointmentData.patient_gender;

  consult_method.value = appointmentData.method_of_consultation;

  // p_address.value = appointmentData.address;
  p_healthIssues.value = appointmentData.healthIssues;
  p_d_name.value = appointmentData.doctorName;

  
  p_d_c.value = appointmentData.dateOfConsultation;
  // p_mobile.value = appointmentData.patient_mobile_number;
  patientstatus.value = appointmentData.status;
  reason.value = appointmentData.reason;
  



  const consultDate = new Date(appointmentData.dateOfConsultation);
  const dateDiff = consultDate-today;
  
  const date_difference = Math.floor(dateDiff/(1000*60*60*24));
  console.log(date_difference)

  if(appointmentData.status.toLowerCase() == "accepted"){
    if(date_difference<0){
      appointmentData.status = "consulted"
      localStorage.setItem('appointments' , JSON.stringify(appointmentList))
    }
    else if(date_difference === 0){
      appointmentData.status = "waiting"
      localStorage.setItem('appointments' , JSON.stringify(appointmentList))
    }
    else{
      appointmentData.status = "accepted";
      localStorage.setItem('appointments' , JSON.stringify(appointmentList))
    }
  }
  if(patientstatus.value.toLowerCase() === "accepted" || patientstatus.value.toLowerCase() === "consulted" || patientstatus.value.toLowerCase() === "due on this day" || patientstatus.value === "Waiting"){
    reasonField.remove();
  }
}
document.querySelector('#back').addEventListener('click' , function(){
  window.history.back();
})