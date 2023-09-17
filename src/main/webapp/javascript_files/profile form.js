const userFirstName = document.getElementById("first_name");
const userLastName = document.getElementById("last_name");
const userAge = document.getElementById("age");

// const gender_1 = document.getElementById("male");
// const gender_2 = document.getElementById("female");
// const gender_3 = document.getElementById("others");

const userGender = document.getElementById("gender");

const mobileNumber = document.getElementById("mobile_number");
const emailId = document.getElementById("email");

const unique_id = JSON.parse(localStorage.getItem("uniqueUser"));
const user_detail = JSON.parse(localStorage.getItem("user_detail"));

const user = user_detail.find((detail) => detail.email_id === unique_id);
if (user) {
  userFirstName.value = user.f_name;
  userLastName.value = user.l_name;
  userAge.value = user.age;
  mobileNumber.value = user.mobile;
  emailId.value = user.email_id;
  userGender.value = user.user_gender;
  // gender_1.checked = user.user_gender.male;
  // gender_2.checked = user.user_gender.female;
  // gender_3.checked = user.user_gender.others;

  document.getElementById("updateUser").onclick = function update_user(event) {
    event.preventDefault();
    const uFName = userFirstName.value;
    const uLName = userLastName.value;
    const uAge = userAge.value;
    const uNumber = mobileNumber.value;
    const uEmail = emailId.value;

    const uGender = userGender.value;
    const b=new Date();

    user.f_name = uFName;
    user.l_name = uLName;
    user.age = uAge;
    user.mobile = uNumber;
    user.email_id = uEmail;

    user.user_gender = uGender;
    
    user.modified_at = b.toLocaleString('en-US');

    localStorage.setItem("user_detail", JSON.stringify(user_detail));
    alert("updated successfully");
    document.querySelector("form").reset();
    window.location.href = "../../../index.html";
    document.getElementById("updateUser").setAttribute("disabled", true);
  };
}

// document.getElementById("deleteUser").addEventListener('click' , (event) =>{
//     event.preventDefault();

//     const unique_id = JSON.parse(localStorage.getItem("uniqueUser"));
//     const user_detail = JSON.parse(localStorage.getItem("user_detail"));

//     const userIndex = user_detail.findIndex(detail =>
//         detail.email_id === unique_id
//     );

//     if (userIndex > -1) {
//         user_detail.splice(userIndex, 1);
//         localStorage.setItem('user_detail', JSON.stringify(user_detail));
//         alert("account deleted successfully");
//         document.querySelector('form').reset();
//         location.href="../../../index.html"

//     }
// });

// function profile_data(e){
//     return e.email_id == unique_id;
// }
// user = user_detail.find(profile_data);
