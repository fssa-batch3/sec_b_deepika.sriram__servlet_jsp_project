const create_password = document.getElementById("pass_1");
const confirm_password = document.getElementById("pass_2");

const note = document.createElement("p");
note.innerText = "enter at least 8 to 12 characters with a combination of uppercase , lowercase , numbers and special symbols";
note.style.fontSize = "13px";
note.style.fontWeight = "bold";
note.style.fontStyle = "Roboto-Condensed";
note.style.color = "green";

// eslint-disable-next-line func-names
create_password.addEventListener("focus", function () {
    create_password.insertAdjacentElement("afterend", note);
});
// eslint-disable-next-line func-names
create_password.addEventListener("blur", function () {
    note.remove();
});

const togglePassword1 = document.querySelector("#toggle-password-1");
const openedEye1 = document.querySelector("#open_eye-1");
const closedEye1 = document.querySelector("#close_eye-1");

let passwordVisibility1 = false;

// eslint-disable-next-line func-names
togglePassword1.addEventListener("click", function () {
    if (!passwordVisibility1) {
        openedEye1.classList.remove("hide");
        closedEye1.classList.add("hide");
        create_password.type = "text";
    } else {
        openedEye1.classList.add("hide");
        closedEye1.classList.remove("hide");
        create_password.type = "password";
    }
    passwordVisibility1 = !passwordVisibility1;
});

const togglePassword2 = document.querySelector("#toggle-password-2");
const openedEye2 = document.querySelector("#open_eye-2");
const closedEye2 = document.querySelector("#close_eye-2");

let passwordVisibility2 = false;

// eslint-disable-next-line func-names
togglePassword2.addEventListener("click", function () {
    if (!passwordVisibility2) {
        openedEye2.classList.remove("hide");
        closedEye2.classList.add("hide");
        confirm_password.type = "text";
    } else {
        openedEye2.classList.add("hide");
        closedEye2.classList.remove("hide");
        confirm_password.type = "password";
    }
    passwordVisibility2 = !passwordVisibility2;
});