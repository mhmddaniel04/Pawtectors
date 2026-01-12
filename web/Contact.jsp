<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<!DOCTYPE html>

<html>
    <head>
    <title>Pawtectors | Contact Us</title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link href="https://fonts.googleapis.com/css2?family=Inter:wght@400;600;700;800&display=swap" rel="stylesheet">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css">
    <link rel="icon" type="image/jpeg" href="Images/logo.jpeg">
    <style>
    :root {
    --color-primary: #1F4A66;
    --color-accent: #4A89B0;
    --color-light-accent: #A8C8DB;
    --color-background: #f7f9fc;
    }

        body {
            font-family: 'Inter', Arial, Helvetica, sans-serif;
            margin: 0;
            background-color: #ffffff;
        }

        /* Navigation */
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
            margin-left: 25px; 
            text-decoration: none; 
            color: var(--color-primary); 
            font-size: 16px; 
            font-weight: bold; 
        }

        .nav-right a:hover { color: var(--color-accent); }

        /* Header Section */
        .contact-header {
            background-color: var(--color-primary);
            color: white;
            padding: 120px 50px 60px;
            text-align: center;
            border-radius: 0 0 40px 40px;
            margin-bottom: 50px;
        }

        .contact-header h1 { 
            font-size: 48px; 
            margin: 0 0 10px; 
            font-weight: 800; 
        }

        /* Layout Container */
        .contact-container {
            display: flex;
            gap: 40px;
            padding: 0 80px 80px;
            max-width: 1200px;
            margin: 0 auto;
        }

        .contact-form-section {
            flex: 3;
            background: white;
            padding: 35px;
            border-radius: 20px;
            box-shadow: 0 10px 30px rgba(0,0,0,0.08);
            position: relative;
            overflow: hidden;
        }

        .contact-form-section h2 {
            color: var(--color-primary);
            font-size: 30px;
            margin: 0 0 25px;
            border-bottom: 3px solid var(--color-light-accent);
            padding-bottom: 10px;
        }

        /* Form Elements */
        .form-group { margin-bottom: 20px; }

        .form-group label { 
            display: block; 
            margin-bottom: 8px; 
            font-weight: 600; 
            color: var(--color-primary); 
        }

        .form-control {
            width: 100%;
            padding: 14px;
            border: 2px solid #edf2f7;
            border-radius: 12px;
            box-sizing: border-box;
            font-size: 16px;
            font-family: inherit;
            transition: border-color 0.3s;
        }

        .form-control:focus {
            outline: none;
            border-color: var(--color-accent);
        }

        .submit-btn {
            width: 100%;
            padding: 16px;
            background-color: var(--color-accent);
            color: white;
            border: none;
            border-radius: 12px;
            font-size: 18px;
            font-weight: 700;
            cursor: pointer;
            transition: all 0.3s;
        }

        .submit-btn:hover { 
            background-color: var(--color-primary); 
            transform: translateY(-2px); 
            box-shadow: 0 4px 12px rgba(31, 74, 102, 0.2);
        }

        /* Info Section */
        .contact-info-section {
            flex: 2;
            padding: 35px;
            border-radius: 20px;
            background-color: #f8fafc;
            height: fit-content;
            border: 1px solid #e2e8f0;
        }

        .contact-info-section h2 { 
            color: var(--color-primary); 
            margin-top: 0; 
        }

        /* Success Message Overlay */
        .message-success {
            position: absolute;
            top: 0; 
            left: 0; 
            width: 100%; 
            height: 100%;
            background: rgba(255, 255, 255, 0.98);
            display: none;
            flex-direction: column;
            align-items: center;
            justify-content: center;
            text-align: center;
            z-index: 10;
            padding: 20px;
            box-sizing: border-box;
        }

        @media (max-width: 900px) {
            .contact-container { 
                flex-direction: column; 
                padding: 0 20px 40px; 
            }
            .navbar { padding: 15px 20px; }
            .nav-right { display: none; } 
        }

        .footer-tiny {
                background: #16354a;
                color: #94a3b8;
                text-align: center;
                padding: 30px 10%;
                font-size: 14px;
            }
    </style>


    </head>
    <body>

        <!-- NAVBAR -->
        <div class="navbar">
            <div class="nav-left">
                    <a href="Home.html" style="display:flex; align-items:center; gap:12px; text-decoration:none; color:inherit;">
                        <img src="Images/logo.jpeg" alt="Pawtectors Logo">
                        <span>Pawtectors</span>
                    </a>
            </div>
            <div class="nav-right">
                <a href="Home.html">Home</a>
                <a href="AboutUs.html">About Us</a>
                <a href="Adoption">Adoption</a>
                <a href="Events">Events</a>
                <a href="Guides.html">Pet Guides</a>
                <a href="Contact" style="color: var(--color-accent);">Contact</a>
            </div>
        </div>

        <!-- HEADER -->
        <header class="contact-header">
            <h1>Get In Touch</h1>
            <p>We'd love to hear from you. Send us a message below.</p>
        </header>

        <!-- MAIN CONTENT -->
        <main class="contact-container">

            <!-- CONTACT FORM -->
            <section class="contact-form-section">
                <h2>Send a Message</h2>

                <form id="contact-form" action="Contact" method="POST">
                    <div class="form-group">
                        <label>Your Full Name</label>
                        <input type="text" name="name" class="form-control" placeholder="Abu Kamal" required>
                    </div>
                    <div class="form-group">
                        <label>Email Address</label>
                        <input type="email" name="email" class="form-control" placeholder="abukamal@example.com" required>
                    </div>
                    <div class="form-group">
                        <label>Your Message</label>
                        <textarea name="message" class="form-control" rows="6" placeholder="Tell us how we can help..." required></textarea>
                    </div>
                    <button type="submit" class="submit-btn">Send Message</button>
                </form>

                <%-- Check for Success Attribute from ContactServlet --%>
                <% if(request.getAttribute("success") != null) { %>
                    <div id="success-overlay" class="message-success" style="display: flex;">
                        <i class="fas fa-paper-plane" style="font-size: 60px; color: var(--color-accent); margin-bottom: 20px;"></i>
                        <h3 style="font-size: 24px; color: var(--color-primary);">Message Sent Successfully!</h3>
                        <p style="color: #64748b; margin-bottom: 25px;">Our team has received your inquiry and will get back to you soon.</p>
                        <button onclick="this.parentElement.style.display='none'" class="submit-btn" style="width: auto; padding: 12px 40px;">Close</button>
                    </div>
                <% } %>
            </section>

            <!-- INFO SECTION -->
            <section class="contact-info-section">
                <h2>Contact Details</h2>
                <p><i class="fas fa-location-dot" style="margin-right: 10px; color: var(--color-accent);"></i> 22, Jalan Harmoni, 40000 Shah Alam</p>
                <p><i class="fas fa-envelope" style="margin-right: 10px; color: var(--color-accent);"></i> pawtectors@gmail.com</p>
                <hr style="border: 0; border-top: 1px solid #e2e8f0; margin: 25px 0;">
                <h2 style="font-size: 20px;">Social Channels</h2>
                <p>Follow us on Instagram and TikTok for daily pet updates and success stories!</p>
                <div style="display: flex; gap: 15px; font-size: 24px; color: var(--color-primary); margin-top: 15px;">
                    <i class="fab fa-instagram"></i>
                    <i class="fab fa-tiktok"></i>
                    <i class="fab fa-facebook"></i>
                </div>
            </section>

        </main>

        <div class="footer-tiny">
                <p>&copy; 2026 <span id="admin-trigger">Pawtectors Rescue Shelter</span>. All rights reserved.</p>
            </div>
    </body>
</html>