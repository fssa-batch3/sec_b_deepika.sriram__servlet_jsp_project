const hosp_name = document.getElementById("hosp_name");
const address = document.getElementById("address");
const hospState = document.getElementById("state");
const Locality = document.getElementById("locality");
const hosCity = document.getElementById("city");
const hosPincode = document.getElementById("pincode");
const contact_number = document.getElementById("con_no");
const email_address = document.getElementById("hosp_email");
const image_file = document.getElementById("img_file");
const hosLicenseNo = document.getElementById("hosp_license_no");
const licenseImg = document.getElementById("license_img");

const hospitalId = new URLSearchParams(window.location.search).get('hospital-id');
const hospitalDetails = JSON.parse(localStorage.getItem('hospital_detail'));
const uniqueHosp = hospitalDetails.find((data) =>
    parseInt(data.hospital_id) === parseInt(hospitalId))
if (uniqueHosp) {
    hosp_name.value = uniqueHosp.hospital_name;
    address.value = uniqueHosp.address;
    hospState.value = uniqueHosp.state;
    Locality.value = uniqueHosp.locality;
    hosCity.value = uniqueHosp.city;
    hosPincode.value = uniqueHosp.pincode;
    contact_number.value = uniqueHosp.contact_number;
    email_address.value = uniqueHosp.email_address;
    image_file.value = uniqueHosp.image_link;
    hosLicenseNo.value = uniqueHosp.hosp_license_no;
    licenseImg.value = uniqueHosp.license_img;


    document.getElementById('Update').addEventListener("click", function (event) {
        event.preventDefault();

        const hosName = hosp_name.value;
        const hosAddress = address.value;
        const hospital_state = hospState.value;
        const hospital_locality = Locality.value;
        const hospital_city = hosCity.value;
        const hospital_city_pincode = hosPincode.value;
        const hosContactNumber = contact_number.value;
        const hosEmailAddress = email_address.value;
        const hosImageFile = image_file.value;
        const hosptl_lcnse_no = hosLicenseNo.value;
        const lcnseImg = licenseImg.value;


        // updating values in local storage
        uniqueHosp.hospital_name = hosName;
        uniqueHosp.address = hosAddress;
        uniqueHosp.state = hospital_state;
        uniqueHosp.locality = hospital_locality;
        uniqueHosp.city = hospital_city;
        uniqueHosp.pincode = hospital_city_pincode;
        uniqueHosp.contact_number = hosContactNumber;
        uniqueHosp.email_address = hosEmailAddress;
        uniqueHosp.image_link = hosImageFile;
        uniqueHosp.hosp_license_no = hosptl_lcnse_no;
        uniqueHosp.license_img = lcnseImg;

        localStorage.setItem("hospital_detail", JSON.stringify(hospitalDetails));
        alert('updated successfully!!');
        document.querySelector('form').reset();
        document.getElementById("Update").setAttribute("disabled", true);


    })
}

// delete page
document.getElementById("delete_del").addEventListener("click", (event) => {
    event.preventDefault();

    const hospitalId = new URLSearchParams(window.location.search).get('hospital-id');
    const hospitalDetails = JSON.parse(localStorage.getItem('hospital_detail'));

    const hospitalIndex = hospitalDetails.findIndex((detail) =>
        detail.hospital_id === parseInt(hospitalId))

    if (hospitalIndex > -1) {
        hospitalDetails.splice(hospitalIndex, 1);
        localStorage.setItem("hospital_detail", JSON.stringify(hospitalDetails));
        alert("Hospital details deleted successfully");
        document.querySelector("form").reset();
    }
})