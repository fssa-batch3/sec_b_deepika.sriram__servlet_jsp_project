// here I collecting all the files and storing in each variable so thst we can avoid relative path of the file


const { origin } = window.location;
const about = `${origin}/pages/other pages/other pages/about us.html`;
const contact = `${origin}/pages/other pages/patient/contact us.html`
const image = `${origin}/assets/images/deepika logo-4.png`;
const patient_login = `${origin}/pages/other pages/other pages/login for patient.html`;
const doctor_login = `${origin}/pages/other pages/other pages/login for doctor.html`
const signup = `${origin}/pages/other pages/other pages/sign up page.html`;
const profile = `${origin}/pages/other pages/patient/patient profile page.html`;
const my_appointment = `${origin}/pages/other pages/patient/my appointment.html`;
const hospitals = `${origin}/pages/other pages/patient/list of hospital page.html`;
const menu = `${origin}/pages/other pages/other pages/menu.html`;
const avatar = `${origin}/assets/images/22-223968_default-profile-picture-circle-hd-png-download-removebg-preview.png`
const index = `${origin}/index.html`;


// header before login

const heading_1 = `
        <img id="logo" src="${image}" alt="logo of carecentral">
        <section class="head">
            <ul>
                <li>
                    <a href="${index}">Home</a>
                </li>
                <li>
                    <a href="${contact}">Contact us</a>
                </li>
                <li>
                    <a href="${signup}">Sign up</a>
                </li>
            </ul>
            <div class="dropdown" style="width:10%">
              <a href="javascript:void(0)" class="dropbtn">Login</a>
              <div class="dropdown-content">
                <a href="${doctor_login}">Doctor</a>
                <a href="${patient_login}">Patient</a>
              </div>
            </div>
        </section>
`;

// header after login

const heading_2 = `
<img id="logo" src="${image}" alt="logo of carecentral">
<section class="head">
    <ul>
        <li>
            <a href="${index}">Home</a>
        </li>
        <li>
            <a href="${hospitals}">Hospitals</a>
        </li>
        <li>
            <a href="${contact}">Contact Us</a>
        </li>
    </ul>
    <div class="dropdown" style="width:10%">
      <a id="image" href="javascript:void(0)" class="dropbtn"></a>
      <img src="${avatar}" id="avatar"/>
      <div class="dropdown-content">
        <a href="${profile}">View profile <i class="fas fa-user"></i> </a>
        <a href="${my_appointment}">My appointments <i class="fa-solid fa-calendar-check"></i> </a>
        <a id="signout" style="cursor:pointer">Sign out <i class="fa fa-sign-out"></i></a>
      </div>
    </div>
</section>

`;

function indexPage() {
  // collecting logged in user, id of header and user_detail JSON from local storage
  const unique = JSON.parse(localStorage.getItem("uniqueUser"));
  const header = document.getElementById("header");

  const user_detail = JSON.parse(localStorage.getItem("user_detail"));

  
  const registerButton = `
  <div>
    <a href="/pages/other pages/other pages/sign up page.html">
      <button type="button" id="register">Register</button>
    </a>
  </div>
  `

  const section_1 = document.querySelector("#sec1");
  const searchBar = `
        <div>
            <input type="text" id="city" placeholder="enter the city" />
            <a id="search">
            <i class="fa-solid fa-magnifying-glass" style="color:black;position:relative;right:5%"></i>
            </a>
        </div>
    `;

 

  if (user_detail) {
    const user = user_detail.find((detail) => detail.email_id === unique);
    if (!unique) {
      header.innerHTML = heading_1;
      if(section_1){
        section_1.insertAdjacentHTML("beforeend" , registerButton);
      }
    } 
    else {
      header.innerHTML = heading_2;
      if (user) {
        if (section_1) {
          section_1.removeChild(section_1.lastElementChild)
          section_1.insertAdjacentHTML('beforeend', searchBar)
        }
        document.getElementById("signout").onclick = function logOut(event) {
          event.preventDefault();

          alert("logged out successfully");
          window.location.href=index;
          document.querySelector("#city").remove();
          document.querySelector("#search").remove();
          section_1.insertAdjacentHTML("beforeend" , registerButton);
          header.innerHTML = heading_1;
          localStorage.removeItem("uniqueUser");
        };
        if (section_1) {
          const hospitalList = JSON.parse(localStorage.getItem("hospital_detail"));


          document.querySelector("#city").addEventListener("keypress", function (e) {
            if (e.key === "Enter") {
              e.preventDefault();
              document.getElementById("search").click();
            }
          });
          document
            .querySelector("#search")
            .addEventListener("click", function searchPlace(e) {
              e.preventDefault();
              const search = document.getElementById("city").value.trim().toLowerCase();
              console.log(search);

              if (search === "" || search === null || search === undefined) {
                alert("invalid search input");
                return;
              }

              const match = [];

              for (let i = 0; i < hospitalList.length; i++) {
                const city = hospitalList[i].city.toLowerCase().trim();
                
                const condition = search.includes(city, 0);
                if (condition) {
                  match.push(hospitalList[i]);
                  
                  window.location.href = `${hospitals}?city=${search}`;
                }
              }
              console.log(match);
            });
        }
      }

    }
  } 
    else {
      header.innerHTML = heading_1;
      section_1.insertAdjacentHTML("beforeend" , registerButton);
    }
}

indexPage();
