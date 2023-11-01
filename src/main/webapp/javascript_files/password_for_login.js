const password = document.getElementById("psw");
const togglePassword = document.querySelector("#toggle-password");
const openedEye = document.querySelector("#open_eye");
const closedEye = document.querySelector("#close_eye");

let passwordVisibility = false;

// eslint-disable-next-line func-names
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