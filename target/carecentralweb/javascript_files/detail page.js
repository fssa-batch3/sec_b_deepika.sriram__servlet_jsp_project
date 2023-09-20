// getting 
const hsp = new URLSearchParams(window.location.search).get('hospital-id');
const a = JSON.parse(localStorage.getItem("doctor_detail"));
const b = JSON.parse(localStorage.getItem('user_detail'));
const back = document.getElementById("back");
back.addEventListener('click', function () {
    window.history.back();
})


const dctr = new URLSearchParams(window.location.search).get('doctor-id');

for (let i = 0; i < a.length; i++) {
    const b = a[i];
    if (dctr === b.uuid) {
        const doctorCard = renderCard(b);

        document.querySelector("main").insertAdjacentHTML('afterbegin', doctorCard)
    }
}

function renderTime(time) {
    for (let i = 0; i < 2; i++) {
        return `
            <span>
                from ${time.starting_time} to ${time.ending_time}
            </span>
        `;
    }
}

function workingDays(day) {
    return `
        <span>${day}
    `;
}

function renderCard(b) {
    let departmentString = "";
    const departmentArray = b.Departments;
    departmentString += departmentArray.join(", ");

    let qualificationString = "";
    const qualificationArray = b.Qualifications;
    qualificationString += qualificationArray.join(", ");

    let timeString = "";
    const timeArray = b.Availabilities;
    const timeCount = timeArray.length;

    for (let i = 0; i < timeCount; i++) {
        timeString += renderTime(timeArray[i]);
    }

    let dayString = [];
    const dayObj = b.Working_days;

    
    for (const key in dayObj) {
        if (dayObj[key] === true) {
            dayString.push(workingDays(key));
        }
    }

    const card = `
        <section class="doctor_detail">
            <img src = "${b.Doctor_image}" alt="image of ${b.Doctor_name}">
            <div style="margin-left:5%;">
                <div>
                    <h2>${b.Doctor_name}</h2>
                </div>
                <div style="display:flex;">
                    <div>
                        <p>${qualificationString}</p>
                        <p><b>${b.Experience.experience_duration}</b> ${b.Experience.experience_type} experience overall</p>
                        <p style="font-weight:800">${departmentString}</p>
                    </div>
                    <div style="margin-left:5%">
                        <p><i class="fa-solid fa-clock"></i> : ${timeString}</p>
                        <p><i class="fa-solid fa-calendar-days"></i> : ${dayString}</p>
                        <a href="../patient/appointment-form.html?doctor-id=${dctr}&doctor-name=${b.Doctor_name}" style="text-decoration:none">
                            <button type="button" id="book" >Book Appointment</button>
                        </a>
                        <button type="button" id="reviewButton">Add review</button>
                    </div>
                </div>
            </div>
        </section>
    `

    return card;
}

document.querySelector('#book').addEventListener('click' , function(){

})

const patient_review = JSON.parse(localStorage.getItem('patient_review')) || [];
const uniqueReview = patient_review.filter((data) =>
    data.doctor_id === dctr
)
for(let k=0;k<uniqueReview.length;k++){
    const rvw = uniqueReview[k];

    const reviewCard = `
    <div class="card">
        <div class="cnt">
            <p>${rvw.review_msg}</p>
        </div>
        <div>
            <img class="revimg" src="../../../assets/images/22-223968_default-profile-picture-circle-hd-png-download-removebg-preview.png" alt="avatar">
            <h3>${rvw.created_by}</h3>
        </div>
    </div>
    `

    document.querySelector('.scroll').insertAdjacentHTML('beforeend' , reviewCard)
}


const reviewModal = document.getElementById('myModal_2');
var span = document.getElementsByClassName("close")[0];
document.querySelector('#reviewButton').addEventListener('click' , function(){
    reviewModal.style.display = "block"
})
span.addEventListener('click' , function(){
    reviewModal.style.display = "none"
})

const uploadButton = document.querySelector('#uploadReview');

uploadButton.addEventListener('click' , function(){
    const review_msg = document.getElementById('addReview').value;

    const user_id = JSON.parse(localStorage.getItem('uniqueUser'));
    const user = b.find((data) => data.email_id === user_id);
    const doctor = a.find((data) => data.uuid === dctr)
    if(user && doctor){
        const created_by = user.f_name+" "+user.l_name;
        const created_at = new Date().toLocaleString('en-US');
        const doctor_id = dctr;
        const created_for = doctor.Doctor_id;
        const modified_at = "";

        patient_review.push({created_at,modified_at,created_by,user_id,created_for,doctor_id,review_msg});
        localStorage.setItem('patient_review' , JSON.stringify(patient_review));
        alert('review uploaded');
    }
    else{
        alert("sorry! we can't upload your review")
    }

})