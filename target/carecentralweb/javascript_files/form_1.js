function enter(e) {
  e.preventDefault();
  // hear i collect value from signUp form
  const f_name = document.getElementById("first_name").value.trim();
  const l_name = document.getElementById("last_name").value.trim();
  const age = document.getElementById("age").value.trim();
  const user_gender = document.getElementById('gender').value;
  

  const mobile = document.getElementById("mobile_number").value.trim();
  const email_id = document.getElementById("user_email").value.trim();
  const create_password = document.getElementById("pass_1").value.trim();
  const confirm_password = document.getElementById("pass_2").value.trim();

  const uuid = uuidv4();
  const a = new Date();
  const created_at = a.toLocaleString('en-US');
  const modified_at = "";



  const Experiences = {};
  const experience_duration = "";
  const experience_type = "";
  const speciality = "";
  const Availabilities = [];
  const starting_time = "";
  const ending_time = "";
  const working_days = {};
  const medical_license_img = "";
  const university = "";
  const mrc_number = "";
  const year_of_mrcnumber = "";
  const name_of_council = "";
  const status = "";
  const hospital_name = "";

  const Doctor_name = f_name + l_name;


  // hear i give var name for local storage data (initially there is no data so we mentioned or (||) symbol to get empty array)
  const user_detail = JSON.parse(localStorage.getItem("user_detail")) || [];
  // const doctor_detail = JSON.parse(localStorage.getItem('doctor_detail')) || [];

  // hear we give some condition for signup to restict same unique id
  const exist = user_detail.some(
    (data) =>
      data.f_name.trim().toLowerCase() === f_name.toLowerCase() ||
      data.l_name.trim().toLowerCase() === l_name.toLowerCase() ||
      data.mobile.trim().toLowerCase() === mobile.toLowerCase() ||
      data.email_id.trim().toLowerCase() === email_id.toLowerCase() ||
      data.create_password.trim().toLowerCase() ===
      create_password.toLowerCase() ||
      data.confirm_password.trim().toLowerCase() ===
      confirm_password.toLowerCase()
  );

  // if condition fail
  if (!exist) {
    if (create_password === confirm_password) {
      if(age>0 && age<100){
        user_detail.push({
          f_name,
          l_name,
          age,
          user_gender,
          mobile,
          email_id,
          create_password,
          confirm_password,
          created_at,
          modified_at,
          uuid
        })
  
        localStorage.setItem("user_detail", JSON.stringify(user_detail));
  
        document.querySelector("form").reset();
        alert("Account created Successfully✅");
  
        window.location.href = "./login for patient.html";
      }
      else{
        alert('Invalid age')
      }

    }
    else {
      alert("create password and confirm password doesn't match ❎");
    }
  }

  // if condition pass
  else {
    alert(
      "Sorry the User already Exist!! \n Try with different Phone number or email "
    );
    document.querySelector("form").reset();
  }
}
;

// for sign in()
function signIn(e) {
  e.preventDefault();
  const email = document.getElementById("email").value.trim();
  const password = document.getElementById("password").value.trim();

  const user_detail = JSON.parse(localStorage.getItem("user_detail")) || [];

  const unique = user_detail.find((data) => {
    // let check = 0;
    data.email_id === email || data.confirm_password === password
    return data;

  })

  if (email === "admin@gmail.com") {
    alert("logged in successfully")
    localStorage.setItem("uniqueUser" , JSON.stringify(email))
    window.location.href = "./admin.html"
  }
  else if(unique){
    alert("Your login in is successful ✅");
    localStorage.setItem("uniqueUser", JSON.stringify(email));
    window.location.href = "/index.html";
  }
  else{
    alert("invaild users")
  }
};
