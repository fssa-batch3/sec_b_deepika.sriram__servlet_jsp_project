let date_of_consultation;
// let currentDate = new Date();
// let current = new Date().toLocaleString('en-US');
let consultDate;
let dateDiff;
let date_difference;

const uniqueUser = JSON.parse(localStorage.getItem('uniqueUser'));
const Appointments = JSON.parse(localStorage.getItem("appointments"));
const status = "";
const today = new Date();
for(let j=0;j<Appointments.length;j++){
    const a = Appointments[j];
    consultDate = new Date(a.dateOfConsultation);
    dateDiff = consultDate-today;
    date_difference = Math.floor(dateDiff/(1000*60*60*24));
    

    if(a.status.toLowerCase() === "accepted"){
        if(date_difference<0){
          a.status = "consulted"
          localStorage.setItem('appointments' , JSON.stringify(Appointments))
        }
        else if(date_difference === 0){
          a.status = "due on this day"
          localStorage.setItem('appointments' , JSON.stringify(Appointments))
        }
        else{
          a.status = "accepted";
          localStorage.setItem('appointments' , JSON.stringify(Appointments))
        }
    }
    else if(a.status.toLowerCase() === "due on this day"){
        if(date_difference<0){
            a.status = "consulted"
            localStorage.setItem('appointments' , JSON.stringify(Appointments))
        }
        else{
            a.status = "due on this day"
            localStorage.setItem('appointments' , JSON.stringify(Appointments))
        }
    }
}

const appointmentList = JSON.parse(localStorage.getItem('appointments'));
const userAppointments = appointmentList.filter((data) =>
    data.user_email_id === uniqueUser)
console.log(userAppointments)
for (let i = 0; i < userAppointments.length; i++) {
    const userAppointment = userAppointments[i];
    firstLetter = userAppointment.patient_first_name.charAt(0);
    lastLetter = userAppointment.patient_last_name.charAt(0);
    id = firstLetter+lastLetter;
    console.log(id);
    const historyTable = `
                <tr id="${id}">
                    <td>${i + 1} . </td>
                    <td>${userAppointment.patient_first_name} ${userAppointment.patient_last_name}</td>
                    <td>${userAppointment.doctorName}</td>
                    <td>${userAppointment.dateOfBooking} , ${userAppointment.timeOfBooking}</td> 
                    <td>${userAppointment.dateOfConsultation} ${userAppointment.timeOfConsultation}</td>
                    <td>${userAppointment.status}</td>
                    <td>
                        <a href="./appointment detail form.html?appointment-id=${userAppointment.appointment_id}">
                            <button type="button">Click here</button>
                        </a>    
                    </td>  
                </tr>
            `;
            document.querySelector("table").insertAdjacentHTML("beforeend", historyTable);
    
    }
