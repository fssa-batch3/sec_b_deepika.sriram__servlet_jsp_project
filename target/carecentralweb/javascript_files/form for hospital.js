function upload(e) {
  e.preventDefault();
  // hear i collect value from details form
  const hospital_name = document.getElementById("hosp_name").value.trim();
  const address = document.getElementById("address").value.trim();
  const locality = document.getElementById("locality").value.trim();
  const state = document.getElementById("state").value.trim();
  const city = document.getElementById("city").value.trim();
  const pincode = document.getElementById("pincode").value.trim();
  const contact_number = document.getElementById("con_no").value.trim();
  // const link_file = document.getElementById("link_file").value.trim();
  const email_address = document.getElementById("hosp_email").value.trim();
  const image_link = document.getElementById("img_file").value.trim();
  const hosp_license_no = document.getElementById("hosp_license_no").value.trim();
  const license_img = document.getElementById("license_img").value.trim();
  const uuid = uuidv4();

  let hospital_id = 0;

  // hear i give var name for local storage data (initially there is no data so we mentioned or (||) symbol to get empty array)
  const hospital_detail =
    JSON.parse(localStorage.getItem("hospital_detail")) || [];

  // hear we give some condition for uploading details to restict same unique id
  const exist = hospital_detail.some(
    (data) => data.address.trim().toLowerCase() === address.toLowerCase()
  );

  // if condition fail
  if (!exist) {
    if (hospital_name !== "") {
      hospital_id = hospital_detail.length + 1;
    }

    hospital_detail.push({
      hospital_name,
      address,
      contact_number,
      // link_file,
      email_address,
      image_link,
      state,
      locality,
      city,
      pincode,
      hospital_id,
      hosp_license_no,
      license_img,
      uuid,
    });

    localStorage.setItem("unique_id", hospital_name);
    localStorage.setItem("hospital_detail", JSON.stringify(hospital_detail));

    document.querySelector("form").reset();
    alert("Detail submitted Successfully✅");
    window.location.href = "./admin.html";
  }
  // if condition pass
  else {
    alert("hospital detail already exist!!");
    document.querySelector("form").reset();
  }
};
