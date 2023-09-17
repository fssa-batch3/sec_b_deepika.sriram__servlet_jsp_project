<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>

<head>
    <title>Doctor home page</title>
    <link rel="stylesheet" href="../style_files/doctor_homepage.css">
    <link rel="stylesheet" href="../style_files/footer.css">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <!-- <link rel="icon" href="../../../assets/images/logo for care central.JPG"> -->
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Inter:wght@100;200;300;400;500;600;700;800;900&display=swap"
        rel="stylesheet">
    <style>
        .hide {
            display: none;
        }

        .password_container {
            position: relative
        }

        .eye_icon {
            position: absolute;
            top: 5px;
            right: 2%;
            cursor: pointer;
        }

        span .hide {
            visibility: hidden;
        }

        /* The Modal (background) */
        .modal {
            display: none;
            /* Hidden by default */
            position: fixed;
            /* Stay in place */
            z-index: 1;
            /* Sit on top */
            padding-top: 100px;
            /* Location of the box */
            left: 0;
            top: 0;
            width: 100%;
            /* Full width */
            height: 100%;
            /* Full height */
            overflow: auto;
            /* Enable scroll if needed */
            background-color: rgb(0, 0, 0);
            /* Fallback color */
            background-color: rgba(0, 0, 0, 0.4);
            /* Black w/ opacity */
        }

        /* Modal Content */
        .modal-content-1 , .modal-content-2 {
            background-color: #fefefe;
            margin: auto;
            padding: 20px;
            border: 1px solid #888;
            width: 40%;
            height: 20%;
        }

        /* The Close Button */
        .close-1,.close-2 {
            color: #aaaaaa;
            float: right;
            font-size: 28px;
            font-weight: bold;
        }

        .close-1:hover,
        .close-1:focus {
            color: #000;
            text-decoration: none;
            cursor: pointer;
        }
        .close-2:hover,
        .close-2:focus{
            color: #000;
            text-decoration: none;
            cursor: pointer;
        }

        #rejectAppointment , #accept_send {
            padding: 1%;
            color: white;
            background-color: #08ad37;
            border: none;
        }
    </style>

</head>

<body>
    <main>
        <div id="myModal-1" class="modal" >

            <!-- Modal content -->
            <div class="modal-content-1" id="content-1">
                <span class="close-1" id="close-1">&times;</span>
                <form action="">
                    <label for="">State the reason for rejecting</label>
                    <br>
                    <select id="rejecting_reason">
                        <option value="Personal issues">personal issues</option>
                        <option value="Commited with another appointment">Commited with another appointment</option>
                    </select>
                    <br><br>
                    <button type="button" id="rejectAppointment">OK</button>
                </form>
            </div>

        </div>
        <div id="myModal-2" class="modal">

            <!--Modal content-->
            <div class="modal-content-2" id="content-2">
                <span class="close-2" id="close-2">&times;</span>
                <form action="">
                    <div>
                        <label for="">Enter the timing</label>
                    </div>
                    <div>
                        <input type="time" id="timings" />
                    </div>
                    <br><br>
                    <div>
                        <label for="">Enter location</label>
                    </div>
                    <div>
                        <input type="text" id="location" />
                    </div>
                    <br><br>
                    <button type="button" id="accept_send">SEND</button>
                </form>
            </div>
        </div>
        <aside id="sidebar">
            <div class="wrapper">
                <header>
                    <p class="current-date"></p>
                    <div class="icons">
                        <span id="prev" class="material-symbols-rounded"></span>
                        <span id="next" class="material-symbols-rounded"></span>
                    </div>
                </header>
                <div class="calendar">
                    <ul class="weeks">
                        <li>Sun</li>
                        <li>Mon</li>
                        <li>Tue</li>
                        <li>Wed</li>
                        <li>Thur</li>
                        <li>Fri</li>
                        <li>Sat</li>
                    </ul>
                    <ul class="days"></ul>
                </div>
            </div>
            <!-- <div class="appointments">
                <h2 class="heading" id="all">Appointments</h2> -->
            <!-- <ul>
                    <a id="all">
                        <li>All</li>
                    </a>
                    <a id="acptd">
                        <li>Accepted</li>
                    </a>
                    <a id="rjctd">
                        <li>Rejected</li>
                    </a>
                    <a id="past">
                        <li>Past</li>
                    </a>
                </ul> -->
            </div>
            <div class="appointments">
                <!-- <h2 class="heading">My account</h2> -->
                <ul>
                    <a id="all">
                        <li>Appointments</li>
                    </a>
                    <a id="viewpro">
                        <li>Edit Profile</li>
                    </a>
                    <a id="logOut">
                        <li>Log out</li>
                    </a>
                </ul>
            </div>
        </aside>
        <aside id="dashBoard">
            <h2 class="hr-lines">APPOINTMENTS</h2>
            <section id="page">
                <section id="appointmentList"></section>
                <!-- <section id="appointmentDetails"></section> -->
            </section>
        </aside>
        <aside id="profileDashBoard" class="hide">
            <h2 class="hr-lines">PROFILE</h2>
            <section>
                <div>
                    <label for="">Name</label>
                    <br>
                    <input type="text" id="doctor_name" style="width:50%" />
                </div>
            </section>
            <br><br>
            <section style="display:flex">
                <div>
                    <label for="">Age</label>
                    <br>
                    <input type="number" id="doctor_age" style="width:100px" />
                </div>
                <div style="margin-left:20px">
                    <label for="">Gender</label>
                    <br>
                    <select id="doctor_gender" style="width:150px">
                        <option>Select gender</option>
                        <option value="Male">Male</option>
                        <option value="Female">Female</option>
                        <option value="Others">Others</option>
                    </select>
                </div>
                <!-- <div style="margin-left: 20px;">
                    <label for="">Date of birth</label>
                    <br>
                    <input type="date" id="doctorDOB" style="width:150px" />
                </div> -->
            </section>
            <br><br>
            <section style="display:flex">
                <div>
                    <label for="">Qualifications</label>
                    <br>
                    <input type="text" id="doctorQualifications" style="width:300px" />
                </div>
                <div style="margin-left: 40px;">
                    <label for="">Department</label>
                    <br>
                    <input type="text" id="doctorDepartment" style="width:100%" />
                </div>
            </section>
            <br>
            <section style="display:flex">
                <div>
                    <label for="">experience duration</label>
                    <br>
                    <input type="number" id="experienceDuration" value="19" />
                </div>
                <div style="margin-left: 40px;">
                    <label for="">experience type</label>
                    <br>
                    <select id="experienceType" style="width:100%">
                        <option>select type</option>
                        <option value="Years">Years</option>
                        <option value="Months">Months</option>
                    </select>
                </div>
            </section>
            <br><br>
            <section>
                <div>
                    <label for="">Hopsital name</label>
                    <br>
                    <input type="text" id="doctorHospitalName" style="width:50%" />
                </div>
                <!-- <div style="margin-left: 40px;">
                    <label for="">Hospital id</label>
                    <br>
                    <input type="number" id="doctorHospitalId" />
                </div> -->
            </section>
            <br><br>
            <section>
                <div>
                    <label for="">university in which they finished their higher studies</label>
                    <br>
                    <input type="text" id="university" style="width:50%"
                        value=" PGI Chandigarh, JIPMER and Manchester, UK." />
                </div>
            </section>
            <br>
            <section style="display:flex">
                <div>
                    <label for="">mobile number</label>
                    <br>
                    <input type="tel" id="doctorMobileNumber" />
                </div>
                <div style="margin-left: 40px;">
                    <label for="">Email address</label>
                    <br>
                    <input type="email" id="doctorEmailAddress" />
                </div>
            </section>
            <br><br>
            <section style="display:flex">
                <div>
                    <label for="">Time availability:</label>
                    <br>
                    <div>
                        FROM <input type="time" id="starting_time" />
                        TO <input type="time" id="ending_time" />
                    </div>

                </div>
                <div style="margin-left:20px">
                    <label for="">Extra time availabilities:</label>
                    <br>
                    <div>
                        FROM <input type="time" id="starting_time_2" />
                        TO <input type="time" id="ending_time_2" />
                    </div>

                </div>
            </section>
            <br><br>
            <section style="display:flex">
                <div>
                    <label for="">Working days:</label>
                    <br>
                    <input type="checkbox" id="Monday">Monday
                    <input type="checkbox" id="Tuesday">Tuesday
                    <input type="checkbox" id="Wednesday">Wednesday
                    <input type="checkbox" id="Thursday">Thursday
                    <input type="checkbox" id="Friday">Friday
                    <input type="checkbox" id="Saturday">Saturday
                    <input type="checkbox" id="Sunday">Sunday
                </div>
            </section>
            <br>
            <section style="display:flex">
                <div>
                    <label for="">Password</label>
                    <div class="password_container">
                        <input type="password" id="doctorPassword" required="true"
                            pattern="(?=.*\d)(?=.*[a-z])(?=.*[A-Z]).{8,}" style="width:290px">
                        <a id="toggle-password">
                            <span class="eye_icon hide" id="open_eye">
                                <i class="fa fa-eye" style="color:#08ad37;font-size:20px"></i>
                            </span>
                            <span class="eye_icon" id="close_eye">
                                <i class="fa fa-eye-slash" style="color:#1b3c74;font-size:20px"></i>
                            </span>
                        </a>
                    </div>
                </div>
            </section>
            <br>
            <section>
                <button type="button" id="updateDetails">UPDATE PROFILE</button>
            </section>

        </aside>
    </main>
    <script src="../../../Javascript files/doctor homepage.js"></script>
    <script src="../../../Javascript files/doctor profile form.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.2.1/js/all.min.js" integrity="sha512-rpLlll167T5LJHwp0waJCh3ZRf7pO6IT1+LZOhAyP6phAirwchClbTZV3iqL3BMrVxIYRbzGTpli4rfxsCK6Vw==" crossorigin="anonymous" referrerpolicy="no-referrer"></script>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.2.1/css/all.min.css" integrity="sha512-MV7K8+y+gLIBoVD59lQIYicR65iaqukzvf/nwasF0nqhPay5w/9lJmVM2hMDcnK1OnMGCdVK+iQrJ7lzPJQd1w==" crossorigin="anonymous" referrerpolicy="no-referrer">
    <script>
        const password = document.getElementById("doctorPassword");
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
    </script>
</body>

</html>