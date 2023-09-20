const daysTag = document.querySelector(".days"),
    currentDate = document.querySelector(".current-date"),
    prevNextIcon = document.querySelectorAll(".icons span");

// getting new date, current year and month
let date = new Date(),
    currYear = date.getFullYear(),
    currMonth = date.getMonth();

// storing full name of all months in array
const months = ["January", "February", "March", "April", "May", "June", "July",
    "August", "September", "October", "November", "December"];

const renderCalendar = () => {
    let firstDayofMonth = new Date(currYear, currMonth, 1).getDay(), // getting first day of month
        lastDateofMonth = new Date(currYear, currMonth + 1, 0).getDate(), // getting last date of month
        lastDayofMonth = new Date(currYear, currMonth, lastDateofMonth).getDay(), // getting last day of month
        lastDateofLastMonth = new Date(currYear, currMonth, 0).getDate(); // getting last date of previous month
    let liTag = "";

    for (let i = firstDayofMonth; i > 0; i--) { // creating li of previous month last days
        liTag += `<li class="inactive">${lastDateofLastMonth - i + 1}</li>`;
    }

    for (let i = 1; i <= lastDateofMonth; i++) { // creating li of all days of current month
        // adding active class to li if the current day, month, and year matched
        let isToday = i === date.getDate() && currMonth === new Date().getMonth()
            && currYear === new Date().getFullYear() ? "active" : "";
        liTag += `<li class="${isToday}">${i}</li>`;
    }

    for (let i = lastDayofMonth; i < 6; i++) { // creating li of next month first days
        liTag += `<li class="inactive">${i - lastDayofMonth + 1}</li>`
    }
    currentDate.innerText = `${months[currMonth]} ${currYear}`; // passing current mon and yr as currentDate text
    daysTag.innerHTML = liTag;
}
renderCalendar();

prevNextIcon.forEach(icon => { // getting prev and next icons
    icon.addEventListener("click", () => { // adding click event on both icons
        // if clicked icon is previous icon then decrement current month by 1 else increment it by 1
        currMonth = icon.id === "prev" ? currMonth - 1 : currMonth + 1;

        if (currMonth < 0 || currMonth > 11) { // if current month is less than 0 or greater than 11
            // creating a new date of current year & month and pass it as date value
            date = new Date(currYear, currMonth, new Date().getDate());
            currYear = date.getFullYear(); // updating current year with new date year
            currMonth = date.getMonth(); // updating current month with new date month
        } else {
            date = new Date(); // pass the current date as date value
        }
        renderCalendar(); // calling renderCalendar function
    });
});


// getting logged in doctor,doctor_detail and appointmentList JSON from LS.

const uniqueDoctor = JSON.parse(localStorage.getItem('uniqueDoctor'));
const doctor_detail = JSON.parse(localStorage.getItem('doctor_detail'));
const appointmentList = JSON.parse(localStorage.getItem('appointments'));
const doctor = doctor_detail.find((data_1) => data_1.doctor_email_address === uniqueDoctor);
if (doctor) {

    const idOfDoctor = doctor.uuid;
    // console.log(idOfDoctor)

    //filtering appointments as per matching of doctor's name.
    const doctorAppointment = appointmentList.filter((a) => {
        return a.doctorId === idOfDoctor
    });
    console.log(doctorAppointment)

    // // Get the modal
    var modal_1 = document.getElementById("myModal-1");
    var span_1 = document.getElementsByClassName("close-1")[0];

    var modal_2 = document.getElementById('myModal-2');
    var span_2 = document.getElementsByClassName("close-2")[0]

    let each;
    let fname;
    let lname;
    let time;
    let time2;
    let status;
    let True = "ACCEPTED";
    let False = "REJECTED";
    let a;
    let consultDate;

    let todayDate = new Date();

    for (let j = 0; j < doctorAppointment.length; j++) {
        each = doctorAppointment[j];

        // extracting first letter of first name and laast name to create an icon for appointment list.
        fname = each.patient_first_name.charAt(0).toUpperCase();
        lname = each.patient_last_name.charAt(0).toUpperCase();
        status = each.status.toLowerCase();


        time = each.dateOfConsultation;
        // time2 = new Date(time);
        // time3 = time2.getHours() + ":" + time2.getMinutes();
        // consultDate = new Date(each.dateOfConsultation);




        // to display the color of the status: accepted as green and rejected as red.
        if (status.toLowerCase() === True.toLowerCase()) {
            a = document.createElement('div');
            a.setAttribute('class', "status");
            a.setAttribute('style', "color:#08ad37;font-size:14px;font-weight:bold")
            a.innerHTML = status;
            console.log(a)
        }
        else if (status.toLowerCase() === False.toLowerCase()) {
            a = document.createElement('div');
            a.setAttribute('class', 'status');
            a.setAttribute('style', 'color:#930202;font-size:14px;font-weight:bold');
            a.innerHTML = status;
            console.log(a)
        }
        else {
            a = "";
        }



        const appointment = `
            <div class="individual" id="${fname}">
                <div class="avatar" value="${each.appointment_id}">${fname}${lname}</div>
                <div class="name" id="${each.patient_first_name}">
                    <div class="patient_name">${each.patient_first_name}  ${each.patient_last_name}</div>
                    <div class="time" style="font-weight:bold;font-size:14px">${time}</div>
                </div>
            </div>
        `
        document.querySelector('#appointmentList').insertAdjacentHTML('beforeend', appointment);
        document.getElementById(each.patient_first_name).append(a);

        let consultedApp = document.getElementById(fname);

        if (status.toLowerCase() === "rejected") {
            consultedApp.style.contentVisibility = "hidden"
        }
        if (status.toLowerCase() === "consulted") {
            consultedApp.style.contentVisibility = "hidden"
        }
        if (status.toLowerCase() === "on process") {
            if ((consultDate.getDate() - todayDate.getDate()) < 0) {
                consultedApp.style.contentVisibility = "hidden"
            }
        }

    }

    // to display the appointment details of each by clicking each appointment.
    let details = document.querySelectorAll('.individual');
    details.forEach(function (data) {
        data.addEventListener('click', function () {

            let section = document.querySelector('#appointmentDetails');
            if (section) {
                section.remove();
            }

            let parent = this.closest(".individual");
            let app_id = parent.querySelector(".avatar").getAttribute("value");

            console.log(app_id);


            for (let k = 0; k < doctorAppointment.length; k++) {
                const d = doctorAppointment[k];
                const name1 = d.patient_first_name.charAt(0).toUpperCase();
                const name2 = d.patient_last_name.charAt(0).toUpperCase();

                time = d.dateOfConsultation;
                time2 = new Date(d);
                time3 = time2.getHours() + ":" + time2.getMinutes();

                // if one value of an appointment id is matched with any of the appointment id listed
                if (app_id === d.appointment_id) {
                    console.log(name1);
                    console.log(name2);
                    const appointDetails = `
                      <section id="appointmentDetails">
                        <div class="each">
                            <div class="avatar">${name1}${name2}</div>
                            <div>
                                <h2 style="text-align:center;font-size:25px">${d.patient_first_name} ${d.patient_last_name}</h2>
                            </div>
                        </div>
                        <div class="each" style="display:flex">
                            <div><b>Age:</b> ${d.patient_age}</div>
                            <div style="margin-left: 20px;"><b>Gender:</b>${d.patient_gender}</div>
                        </div>
                        <div class="each">
                            <div><b>Health issues:</b>${d.healthIssues}</div>
                        </div>
                        <div class="each">
                            <div><b>Method of consultation:</b></div>
                            <div>${d.method_of_consultation}</div>
                        </div>
                        <div class="each">
                            <div><b>Date and time of consultation:</b></div>
                            <div>${d.dateOfConsultation}</div>
                        </div>
                        <div class="each">
                            <div><b>Mobile number:</b></div>
                            <div>${d.patient_mobile_number}</div>
                        </div>
                        <div>
                            <div><b>Status:</b> ${d.status}</div>
                        </div>
                        <div class="each" id="buttons" style="display:flex;justify-content:space-between">
                            <button type="button" id="accept">ACCEPT</button>
                            <button type="button" id="reject">REJECT</button>
                        </div>
                      </section>
                        `
                    document.querySelector('#appointmentList').insertAdjacentHTML('afterend', appointDetails);


                    // if doctor responsed as accepted or rejected I want the buttons to remove.
                    if (d.status.toLowerCase() === "accepted" || d.status.toLowerCase() === "rejected") {
                        document.querySelector('#buttons').remove();
                    }

                    let accept = document.getElementById('accept');
                    let reject = document.getElementById('reject');


                    // if there is accept or reject buttons, I want this function to be run.
                    if (accept && reject) {
                        accept.addEventListener('click', function acceptAppointment() {
                            modal_2.style.display = "block"

                            let acceptButton = document.getElementById('accept_send');
                            acceptButton.addEventListener('click' , function(){
                                d.timeOfConsultation = document.getElementById('timings').value;
                                // d.timeOfConsultation = consultTime.toLocaleTimeString('en-US');
                                d.hospital_clinic_location = document.getElementById('location').value;
                                d.status = "accepted";
                                localStorage.setItem('appointments', JSON.stringify(appointmentList)) // update the status of particular user and stores in local storage
                                alert('appointment accepted ✅');

                                // disabling the buttons so that the doctors can accept or reject the patient at once
                                document.querySelector('#buttons').remove();
                            })
                        })

                        reject.addEventListener('click', function rejectAppointment() {
                            modal_1.style.display = "block"

                            let rejectButton = document.getElementById('rejectAppointment');
                            rejectButton.addEventListener('click', function () {
                                d.reason = document.getElementById('rejecting_reason').value;
                                d.status = "rejected";
                                localStorage.setItem('appointments', JSON.stringify(appointmentList)) // update the status of particular user and stores in local storage
                                alert('appointment rejected ❎');

                                // disabling the buttons so that the doctors can accept or reject the patient at once
                                document.querySelector('#buttons').remove();
                            })
                        })
                    }
                    span_1.onclick = function () {
                        modal_1.style.display = "none";
                    }
                    window.onclick = function (event) {
                        if (event.target == modal_1) {
                            modal_1.style.display = "none";
                        }
                    }

                    span_2.onclick = function(){
                        modal_2.style.display = "none";
                    }
                    window.onclick = function (event) {
                        if (event.target == modal_2) {
                            modal_2.style.display = "none";
                        }
                    }

                }
            }


        }

        )
    }
    )
}



// profile part of doctor

const dashBoard = document.getElementById('dashBoard'); // appointment dashboard
const proDashBoard = document.getElementById('profileDashBoard'); // profile dashboard
const viewAll = document.getElementById('all'); // to view all appointments irrespective of accepted , rejected and past


const profile = document.getElementById('viewpro');

// to see the profile part at the same page, I hide the appointment dashboard and display the profile dashboard
profile.addEventListener('click', function () {
    dashBoard.classList.add("hide");
    proDashBoard.classList.remove("hide");
})

// to see the appointment list at the same page , I hide the profile dashboard and display the profile dashboard. (same as toggling between two pages)
viewAll.addEventListener('click', function () {
    dashBoard.classList.remove('hide');
    proDashBoard.classList.add('hide');
})

// log out part
const logOut = document.getElementById('logOut');
logOut.addEventListener('click', function () {
    localStorage.removeItem('uniqueDoctor');
    alert('Logged out successfully!! ✅');
    window.location.href = "../../../index.html"
})