function admin(e) {
    e.preventDefault();
    const mobile_number = document.getElementById('mobile_number').value;
    const email_address = document.getElementById('email_address').value;
    const password = document.getElementById('pass_1').value;
    const confirm_password = document.getElementById('pass_2').value;


    if (password === confirm_password) {
        const admin = { mobile_number, email_address, password };

        localStorage.setItem('Admin', JSON.stringify(admin));
        alert('admin registered successfully!')
        window.location.href = "./login for patient.html"
    }
}

