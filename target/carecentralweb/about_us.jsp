<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <title>About us</title>
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <link rel = "stylesheet" href="./style_files/header.css">
        <link rel="stylesheet" href="./style_files/about_us.css">
        <link rel="stylesheet" href="./style_files/normalize.css">
        <link rel = "stylesheet" href = "./style_files/footer.css">
        <link rel="preconnect" href="https://fonts.googleapis.com">
        <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
        <!-- <link rel="icon" href="../../../assets/images/hospital logo 3.JPG"> -->
        <link href="https://fonts.googleapis.com/css2?family=Abril+Fatface&family=Courgette&family=Hammersmith+One&family=Kumbh+Sans:wght@100;200;300;400;500;600;700;800;900&family=Roboto+Condensed:ital,wght@0,300;0,400;0,700;1,300;1,400;1,700&family=Roboto+Mono:ital,wght@0,100;0,200;0,300;0,400;0,500;0,600;0,700;1,100;1,300;1,400;1,500;1,600;1,700&family=Source+Sans+Pro:ital,wght@0,200;0,300;0,400;0,600;0,700;0,900;1,200;1,300;1,400;1,600;1,700;1,900&family=Source+Serif+Pro:ital,wght@0,200;0,300;0,400;0,600;0,700;0,900;1,200;1,300;1,400;1,600;1,700;1,900&display=swap" rel="stylesheet">
    </head>
    <body>
        <jsp:include page="header.jsp"></jsp:include>
        <main>
            <h1 style="text-align:center;font-family:cursive;color:#03045e">ABOUT US</h1>
            <p>
                Our Website is on a mission to make <b>quality healthcare affordable and accessible</b>. We believe in empowering our users with the most accurate, comprehensive, and curated information and care, enabling them to make better healthcare decisions.
            </p>
            <section class="odd">
                <img src="./images/Boost your inmune system.gif" alt="health image">
                <div>
                    <h2>Health is a habit</h2>
                    <p>It is the journey that takes you to new destinations every day with endless possibilities of life on the back of happiness, energy, and hope. GWS wants to make this journey easy for every Indian and help them live healthier and longer lives.</p>
                </div>
            </section>
            <section class="even">
                <div>
                    <h2>Data privacy and security is our first priority</h2>
                    <p>Data privacy and security has always served as one of the founding philosophies of GWS, and we go to great lengths to safeguard the confidentiality and integrity of our users.</p>
                </div>
                <img src="./images/Privacy policy.gif" alt="privacy policy">
            </section>
            <section class="odd">
                <img src="./images/Calendar.gif" alt="appointment schedule">
                <div>
                    <h2>Online appointment booking</h2>
                    <p>User can book appointment with doctors through online without roaming everywhere.... </p>
                </div>
            </section>
            <!-- <section class="even">
                <div>
                    <h2>Prescription download</h2>
                    <p>Downloading of prescription is useful for future appointments.</p>
                </div>
                <img src="./images/Medical prescription.gif" alt="medical prescription">
            </section> -->
        </main>
        <jsp:include page="footer.jsp"></jsp:include>
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.2.1/css/all.min.css" integrity="sha512-MV7K8+y+gLIBoVD59lQIYicR65iaqukzvf/nwasF0nqhPay5w/9lJmVM2hMDcnK1OnMGCdVK+iQrJ7lzPJQd1w==" crossorigin="anonymous" referrerpolicy="no-referrer">
        <script src="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.2.1/js/all.min.js" integrity="sha512-rpLlll167T5LJHwp0waJCh3ZRf7pO6IT1+LZOhAyP6phAirwchClbTZV3iqL3BMrVxIYRbzGTpli4rfxsCK6Vw==" crossorigin="anonymous" referrerpolicy="no-referrer"></script>    
    </body>
</html>