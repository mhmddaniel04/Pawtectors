<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.Calendar" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Paws & Care | Home</title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    
    <link href="https://fonts.googleapis.com/css2?family=Inter:wght@400;600;700;800&display=swap" rel="stylesheet">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.0/css/all.min.css">
    <link rel="icon" type="image/jpeg" href="Images/logo.jpeg">
    
    <style>
        :root {
            --color-primary: #1F4A66;
            --color-accent: #4A89B0;
            --color-text: #334155;
            --color-bg: #ffffff;
        }

        body {
            font-family: 'Inter', Arial, Helvetica, sans-serif;
            margin: 0;
            background-color: var(--color-bg);
            color: var(--color-text);
            overflow-x: hidden;
        }

        /* NAVBAR */
        .navbar { 
            display: flex; 
            justify-content: space-between; 
            align-items: center; 
            padding: 20px 50px; 
            background-color: #ffffff; 
            box-shadow: 0 2px 5px rgba(0,0,0,0.1); 
            position: fixed; 
            width: 100%; 
            top: 0; 
            z-index: 999; 
            box-sizing: border-box;
        }
        .nav-left {
            display: flex;
            align-items: center;
            gap: 12px;
            font-size: 22px;
            font-weight: 800;
            color: #1F4A66;
        }

        .nav-left img {
            height: 45px;
            width: auto;
            border-radius: 8px;
            object-fit: contain;
        }
        .nav-right a {
            position: relative;
            margin-left: 20px;
            text-decoration: none;
            color: var(--color-primary);
            font-size: 16px;
            font-weight: bold;
            padding-bottom: 3px;
        }
        .nav-right a::after {
            content: "";
            position: absolute;
            left: 0;
            bottom: -3px;
            width: 0%;
            height: 2px;
            background-color: #288EB9;
            transition: width 0.4s ease;
        }
        .nav-right a:hover { color: var(--color-accent); }
        .nav-right a:hover::after { width: 100%; }
        .nav-active { color: var(--color-accent) !important; }

        /* HERO SECTION */
        .hero {
            display: flex;
            align-items: center;
            justify-content: space-between;
            padding: 140px 50px 100px;
            background-color: var(--color-primary);
            color: white;
            border-radius: 0 0 50px 50px;
            margin-top: -20px;
        }

        .hero-text { width: 50%; }
        .hero-text h5 { font-size: 18px; letter-spacing: 1px; margin: 0 0 10px; opacity: 0.85; }
        .hero-text h1 { font-size: 55px; margin: 10px 0 20px; font-weight: 800; line-height: 1.1; }
        .hero-text p { font-size: 18px; margin-bottom: 40px; line-height: 1.5; }
        .btn-adopt { padding: 15px 30px; border-radius: 30px; font-size: 18px; text-decoration: none; background-color: white; color: var(--color-primary); transition: 0.3s; }
        .btn-adopt:hover { background-color: var(--color-primary); color: white; border: 2px solid white; }

        .hero-img img { width: 450px; border-radius: 20px; transform: scale(0.9); }

        /* FEATURE CARDS */
        .features-section { display: flex; gap: 40px; justify-content: center; padding: 45px 0; }
        .feature-card { width: 320px; background: white; border-radius: 18px; overflow: hidden; text-align: center; box-shadow: 0 4px 12px rgba(0,0,0,0.1); transition: 0.4s; padding-bottom: 25px; }
        .feature-card:hover { transform: translateY(-10px); }
        .card-img { width: 100%; height: 200px; }
        .card-img img { width: 100%; height: 100%; object-fit: cover; }
        .btn-card { display: inline-block; padding: 10px 25px; background-color: var(--color-primary); color: white; border-radius: 25px; text-decoration: none; }
        
        /* ANNOUNCEMENT SECTION */
        .announcement-wrapper {
            display: flex;
            justify-content: center;
            margin: 30px 0;
        }

        .announcement-section {
            display: flex;
            align-items: center;
            justify-content: center;
            background-color: #A8C8DB;
            padding: 60px 80px;
            border-radius: 20px;
            width: 50%;          
            color: white;
            gap: 60px;
        }

        .announce-left img {
            width: 260px;
            margin-bottom: -89px;
        }

        .announce-right {
            max-width: 450px;
        }

        .announce-right h2 {
            font-size: 28px;
            margin-bottom: 15px;
        }

        .announce-right p {
            font-size: 15px;
            line-height: 1.7;
        }

        .btn-event {
            display: inline-block;
            margin-top: 20px;
            padding: 12px 28px;
            background-color: #316A85;      
            color: white;
            text-decoration: none;
            border-radius: 10px;
            font-weight: bold;
            transition: 0.3s ease;
        }

        .btn-event:hover {
            background-color: #274F63;
        }
        
        /* CONTACT SECTION  */
        .contact-section {
            display: flex;
            justify-content: space-between;
            align-items: center;
            padding: 80px 10%;
            background: var(--color-primary);
            color: white;
            border-radius: 50px 50px 0 0;
            margin-top: 50px;
            position: relative;
        }

        .contact-left { max-width: 50%; z-index: 2; }
        .contact-left h2 { font-size: 42px; margin-bottom: 20px; font-weight: 800; }
        .contact-left p { font-size: 18px; margin-bottom: 30px; opacity: 0.9; line-height: 1.6; }
        .contact-list { list-style: none; padding: 0; margin-bottom: 40px; }
        .contact-list li { display: flex; align-items: center; gap: 15px; font-size: 18px; margin-bottom: 20px; }
        .contact-list i { color: #A8C8DB; width: 25px; }

        .contact-btn {
            display: inline-block;
            padding: 16px 35px;
            background-color: white;
            color: var(--color-primary);
            font-weight: 800;
            text-decoration: none;
            border-radius: 15px;
            transition: 0.3s cubic-bezier(0.4, 0, 0.2, 1);
            box-shadow: 0 10px 20px rgba(0,0,0,0.1);
        }

        .contact-btn:hover {
            transform: translateY(-3px);
            background-color: #4A89B0;
            color: white;
        }

        .contact-right img {
            width: 100%;
            max-width: 450px;
            border-radius: 20px; 
            object-fit: cover;
            display: block;
            margin: 0 auto; 
        }

        /* FOOTER */
        .footer-tiny {
            background: #16354a;
            color: #94a3b8;
            text-align: center;
            padding: 30px 10%;
            font-size: 14px;
        }

        /* RESPONSIVE */
        @media (max-width: 1024px) {
            .hero { flex-direction: column; text-align: center; padding: 120px 30px 80px; border-radius: 0 0 30px 30px; }
            .hero-text, .hero-img { width: 100%; }
            .hero-img img { width: 300px; margin-top: 30px; }
            .features-section { flex-direction: column; gap: 25px; align-items: center; }
            .contact-section { flex-direction: column; text-align: center; padding-bottom: 200px; }
            .contact-left { max-width: 100%; }
            .contact-right img { width: 300px; margin-bottom: -120px; margin-top: 40px;}
            .announcement-section { flex-direction: column; text-align: center; padding: 40px 30px; width: 90%; }
            .announce-left img { width: 200px; margin-bottom: 10px; }
        }
    </style>
</head>
<body>

    <nav class="navbar">
        <div class="nav-left">
            <a href="Home.jsp" style="display:flex; align-items:center; gap:12px; text-decoration:none; color:inherit;">
                <img src="Images/logo.jpeg" alt="Pawtectors Logo">
                <span>Pawtectors</span>
            </a>
        </div>
        <div class="nav-right">
            <a href="Home" class="nav-active">Home</a>
            <a href="AboutUs.jsp">About Us</a>
            <a href="Adoption">Adoption</a>
            <a href="Events">Events</a>
            <a href="Guides.jsp">Pet Guides</a>
            <a href="Contact.jsp">Contact</a>
        </div>
    </nav>

    <header class="hero">
        <div class="hero-text">
            <h5>LOVE WAITS HERE</h5>
            <h1>Every Pet Deserves<br>A Loving Home</h1>
            <p>Open your heart and give rescued pets a second chance. Adopt today and change a life forever.</p>
            <a class="btn-adopt" href="Adoption">Adopt Now</a>
        </div>
        <div class="hero-img">
            <img src="Images/cat.png" alt="Pet" onerror="this.src='https://placehold.co/450x450?text=Pet';">
        </div>
    </header>

    <main class="features-section">
        <div class="feature-card">
            <div class="card-img"><img src="Images/logo.jpeg" alt="About" onerror="this.src='https://placehold.co/320x200?text=About';"></div>
            <h2>About Us</h2>
            <p style="padding: 0 20px; color: var(--color-primary); font-size: 14px;">Dedicated to rescuing and rehoming animals in need.</p>
            <a href="AboutUs.jsp" class="btn-card">Learn More</a>
        </div>
        <div class="feature-card">
            <div class="card-img"><img src="Images/adoption.jpeg" alt="Adoption" onerror="this.src='https://placehold.co/320x200?text=Adoption';"></div>
            <h2>Adoption</h2>
            <p style="padding: 0 20px; color: var(--color-primary); font-size: 14px;">Find your new best friend today among our rescues.</p>
            <a href="Adoption" class="btn-card">View Pets</a>
        </div>
        <div class="feature-card">
            <div class="card-img"><img src="Images/guides.webp" alt="Guide" onerror="this.src='https://placehold.co/320x200?text=Guide';"></div>
            <h2>Pet Guide</h2>
            <p style="padding: 0 20px; color: var(--color-primary); font-size: 14px;">Expert advice on keeping your pets healthy and happy.</p>
            <a href="Guides.jsp" class="btn-card">Read Guides</a>
        </div>
    </main>
    
    <div class="announcement-wrapper">
        <section class="announcement-section">
            <div class="announce-left">
                <img src="Images/announcement.png" alt="Cat Announcement">
            </div>
            <div class="announce-right">
                <h2>ANNOUNCEMENT !</h2>
                <p>Hey there!</p>
                <p>
                    Our Adoption Drive is happening this Saturday!  
                    Come visit us and meet your future furry best friend.
                </p>
                <a href="Events" class="btn-event">View Event</a>
            </div>
        </section>
    </div>

    <section class="contact-section">
        <div class="contact-left">
            <h2>Contact Us</h2>
            <p>We are just a message away. Reach out to us through any of the platforms listed below.</p>
            <ul class="contact-list">
                <li><i class="fa-solid fa-envelope"></i> pawtectors@gmail.com</li>
                <li><i class="fa-solid fa-phone"></i> +60 12-345 6789</li>
                <li><i class="fa-solid fa-location-dot"></i> 22, Jalan Harmoni, 40000 Shah Alam, Selangor</li>
            </ul>
            <a href="Contact.jsp" class="contact-btn">Get in Touch</a>
        </div>
        <div class="contact-right">
            <img src="Images/contact.webp" alt="Contact Illustration" onerror="this.src='https://placehold.co/300x200?text=Contact';">
        </div>
    </section>

    <footer class="footer-tiny">
        <p>&copy; <%= Calendar.getInstance().get(Calendar.YEAR) %> Pawtectors Rescue Shelter. All rights reserved.</p>
    </footer>
</body>
</html>