// getting id of each input field and storing in each variable.

const doctor_name = document.getElementById('doctor_name');
const doctor_age = document.getElementById('doctor_age');
const doctor_gender = document.getElementById('doctor_gender');
// const doctor_dob = document.getElementById('doctorDOB');
const doctorQualifications = document.getElementById('doctorQualifications');
const doctorDepartments = document.getElementById('doctorDepartment');

const experience_duration = document.getElementById('experienceDuration');
const experience_type = document.getElementById('experienceType');

const hospital_name = document.getElementById('doctorHospitalName');
const university = document.getElementById('university');
const doctor_mobile_number = document.getElementById('doctorMobileNumber');
const doctor_email_address = document.getElementById('doctorEmailAddress');


const starting_time = document.getElementById('starting_time');
const ending_time = document.getElementById('ending_time');


// week days
const mon = document.getElementById("Monday");
const tues = document.getElementById("Tuesday");
const wed = document.getElementById("Wednesday");
const thurs = document.getElementById("Thursday");
const fri = document.getElementById("Friday");
const sat = document.getElementById("Saturday");
const sun = document.getElementById("Sunday");

const doctor_password = document.getElementById('doctorPassword');

// getting logged in doctor and doctor_detail JSON from LS
const unique_doctor = JSON.parse(localStorage.getItem('uniqueDoctor'));
const list_doctor_detail = JSON.parse(localStorage.getItem('doctor_detail'));

// finding the doctor which email address is matched
const udoctor = list_doctor_detail.find((data) => data.doctor_email_address === unique_doctor);
if(udoctor){

    // assigning JSON values to the above mentioned variable
    doctor_name.value = udoctor.Doctor_name;
    doctor_age.value = udoctor.Doctor_age;
    doctor_gender.value = udoctor.Doctor_gender;
    // doctor_dob.value = udoctor.Doctor_DOB;
    doctorQualifications.value = udoctor.Qualifications;
    doctorDepartments.value = udoctor.Departments;
    
    experience_duration.value = udoctor.Experience.experience_duration;
    experience_type.value = udoctor.Experience.experience_type;

    starting_time.value = udoctor.Availabilities[0].starting_time;
    ending_time.value = udoctor.Availabilities[0].ending_time;

    mon.checked = udoctor.Working_days.monday;
    tues.checked = udoctor.Working_days.tuesday;
    wed.checked = udoctor.Working_days.wednesday;
    thurs.checked = udoctor.Working_days.thursday;
    fri.checked = udoctor.Working_days.friday;
    sat.checked = udoctor.Working_days.saturday;
    sun.checked = udoctor.Working_days.sunday;

    doctor_password.value = udoctor.password;
    hospital_name.value = udoctor.Doctor_hospital_name;
    university.value = udoctor.University_of_doctor;

    doctor_mobile_number.value = udoctor.doctor_mobile_number;
    doctor_email_address.value = udoctor.doctor_email_address;

    document.getElementById('updateDetails').onclick = function updateDoctorDetails(event){
        event.preventDefault();

        // creating another variable to assign the valuesof the above
        const doctorName = doctor_name.value;
        const doctorAge = doctor_age.value;
        const doctorGender = doctor_gender.value;
        // const doctorDOB = doctor_dob.value;
        const doctorQualification = doctorQualifications.value.split(",");
        const doctorExperienceDuration = experience_duration.value;
        const doctorExperienceType = experience_type.value;
        const doctorDepartment = doctorDepartments.value.split(",");
        const doctorHospitalName = hospital_name.value;
        const doctorUniversity = university.value;
        const doctorTimeFrom = starting_time.value;
        const doctorTimeTo = ending_time.value;

        const docMobile = doctor_mobile_number.value;
        const docEmail = doctor_email_address.value;
        const docPassword = doctor_password.value;

        // setting time of update
        let stamp = new Date();
        const modifed_at_date = stamp.toLocaleDateString('en-US');
        const modified_at_time = stamp.toLocaleTimeString('en-US');

        const m_day = mon.checked;
        const tue_day = tues.checked;
        const wed_day = wed.checked;
        const thur_day = thurs.checked;
        const fri_day = fri.checked;
        const sat_day = sat.checked;
        const sun_day = sun.checked;

        // updating doctor details
        udoctor.Doctor_name = doctorName;
        udoctor.Doctor_age = doctorAge;
        udoctor.Doctor_gender = doctorGender;
        // udoctor.Doctor_DOB = doctorDOB;
        udoctor.Qualifications = doctorQualification;
        udoctor.Departments = doctorDepartment;
        udoctor.Experience.experience_duration = doctorExperienceDuration;
        udoctor.Experience.experience_type = doctorExperienceType;
        udoctor.Doctor_hospital_name = doctorHospitalName;

        udoctor.Availabilities.starting_time = doctorTimeFrom;
        udoctor.Availabilities.ending_time = doctorTimeTo;

        udoctor.University_of_doctor = doctorUniversity ;
        udoctor.doctor_mobile_number = docMobile;
        udoctor.doctor_email_address = docEmail;
        udoctor.password = docPassword;


        udoctor.Working_days.monday = m_day;
        udoctor.Working_days.tuesday = tue_day;
        udoctor.Working_days.wednesday = wed_day;
        udoctor.Working_days.thursday = thur_day;
        udoctor.Working_days.friday = fri_day;
        udoctor.Working_days.saturday = sat_day;
        udoctor.Working_days.sunday = sun_day;

        udoctor.modified_date = modifed_at_date;
        udoctor.modified_time = modified_at_time;

        const start_time = document.getElementById('starting_time_2').value;
        const end_time = document.getElementById('ending_time_2').value;

        if(start_time && end_time){
            if(start_time.value!== "" || end_time.value!== ""){
                udoctor.Availabilities.push({starting_time:start_time , ending_time:end_time})
            }
        }
        

        localStorage.setItem('doctor_detail' , JSON.stringify(list_doctor_detail));
        alert('profile updated successfully !!')

    }
}

