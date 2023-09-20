const doc = parseInt(
  new URLSearchParams(window.location.search).get("hospital-id")
);

const doctors = JSON.parse(localStorage.getItem("doctor_detail"));
const hospital_list = JSON.parse(localStorage.getItem("hospital_detail"));

for (let i = 0; i < hospital_list.length; i++) {
  const particular_hospital = hospital_list[i]
  if (doc === parseInt(particular_hospital.hospital_id)) {
    const section = `
        <section id="hospital_detail">
          <img src="${particular_hospital.image_link}" alt="logo of${particular_hospital.hospital_name}" style="border-right:1px solid black"> 
          <div style="margin-left:30px">
            <div>
              <h2>${particular_hospital.hospital_name}</h2>  
            </div>
            <div class="details">
              <div>
                <p><i class="fa-solid fa-location-dot"></i>   ${particular_hospital.address + ", " + particular_hospital.locality + ", " + particular_hospital.area + ", " + particular_hospital.city + " - " + particular_hospital.pincode}</p>  
              </div>
              <div>
                <p><i class="fa-solid fa-phone"></i>   ${particular_hospital.contact_number}</p>
                <p><i class="fa-solid fa-envelope"></i>   ${particular_hospital.email_address}</p>  
              </div> 
            </div> 
          </div>
        </section>
        `

    document.querySelector("main").insertAdjacentHTML("afterbegin", section)
  }
}


const specialistsList = JSON.parse(localStorage.getItem('list_of_specialist'));
for (let k = 0; k < specialistsList.length; k++) {
  const spcl = specialistsList[k];

  const specialtyButton = `
    <button class="spclty" value="${spcl.specialty_id}">${spcl.specialty}</button>
  `

  document.querySelector('#specialist').insertAdjacentHTML('beforeend', specialtyButton)
}

const doctor_for_hospital = doctors.filter((data) =>
  parseInt(data.Hospital_id) === doc)

function listDoctors() {
  

  for (let j = 0; j < doctor_for_hospital.length; j++) {
    const doctor = doctor_for_hospital[j];
    const card = `
        <div class="card">
          <div>
            <img src="${doctor.Doctor_image}";
          </div>
          <div>
            <h3 style="font-size:20px">${doctor.Doctor_name}</h3> 
            <p>${doctor.Departments}</p>   
          </div> 
          <div>
            <a href="../other pages/detail page.html?hospital-id=${doctor.Hospital_id}&doctor-id=${doctor.uuid}">
              <button type="button">View doctor</button>    
            </a>    
          </div> 
        </div>
      `

    document.querySelector("#doctorList").insertAdjacentHTML("beforeend", card)
  }

}

listDoctors();

let spcl_btn = document.querySelectorAll('.spclty');
spcl_btn.forEach(function (data) {
  data.addEventListener('click', function () {

    let parent = this.closest('.spclty');
    let spclty_value = parseInt(parent.getAttribute("value"));

    let doctorListPart = document.querySelectorAll('.card');
    for (let a = 0; a < doctorListPart.length; a++) {
      doctorListPart[a].remove();
    }

    console.log(spclty_value);
    console.log(doctor_for_hospital);

    const filteredSpclty = doctor_for_hospital.filter((data) =>
      data.Department_id.includes(spclty_value));
    console.log(filteredSpclty)

    for (let m = 0; m < filteredSpclty.length; m++) {
      const spcltyDoc = filteredSpclty[m];


      const card = `
        <div class="card">
          <div>
            <img src="${spcltyDoc.Doctor_image}";
          </div>
          <div>
            <h3 style="font-size:20px">${spcltyDoc.Doctor_name}</h3> 
            <p>${spcltyDoc.Departments}</p>   
          </div> 
          <div>
            <a href="../other pages/detail page.html?hospital-id=${spcltyDoc.Hospital_id}&doctor-id=${spcltyDoc.uuid}">
              <button type="button">View doctor</button>    
            </a>    
          </div> 
        </div>
        `

      document.querySelector("#doctorList").insertAdjacentHTML("beforeend", card)


      if (spclty_value === 'all') {
        listDoctors();
      }
    }

  })
})




const back = document.getElementById("back");
back.addEventListener('click', function () {
  window.history.back()
})