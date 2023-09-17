const password = document.getElementById("password");
const togglePassword = document.querySelector("#toggle-password");
const openedEye = document.querySelector("#open_eye");
const closedEye = document.querySelector("#close_eye");

let passwordVisibility = false;

togglePassword.addEventListener("click", function () {
    if (!passwordVisibility) {
        openedEye.classList.remove("hide");
        closedEye.classList.add("hide");
        password.type = "text";
    } else {
        openedEye.classList.add("hide");
        closedEye.classList.remove("hide");
        password.type = "password";
    }
    passwordVisibility = !passwordVisibility;
});
function logIn(e) {
    e.preventDefault();
    const email = document.getElementById("email").value.trim();
    const password = document.getElementById("password").value.trim();

    const doctor_detail = JSON.parse(localStorage.getItem("doctor_detail")) || [];

    const exist_2 =
        doctor_detail.length &&
        JSON.parse(localStorage.getItem("doctor_detail")).some(
            (data_2) =>
                data_2.doctor_email_address.toLowerCase() === email.toLowerCase() &&
                data_2.password === password
        );
    if (!exist_2) {
        alert("User details didn't match ❌");
        // location.href = "../pages/homepage/home page.html"
    } else {
        localStorage.setItem("uniqueDoctor", JSON.stringify(email));
        alert("Your login in is successful ✅");
        window.location.href = "../doctor/doctor homepage.html";
    }
};