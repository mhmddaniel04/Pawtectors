<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<!DOCTYPE html>
<html>
<head>
    <title>Pawtectors | Events</title>
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

        body { font-family: 'Inter', Arial, sans-serif; margin: 0; background-color: #ffffff; }

        /* NAVBAR  */
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
        
        /* HEADER SECTION */
        .events-header {
            background-color: var(--color-primary); 
            color: white;
            padding: 100px 50px 60px; 
            text-align: center;
            border-radius: 0 0 40px 40px; 
            margin-bottom: 50px;
        }
        .events-header h1 { font-size: 48px; margin-bottom: 10px; font-weight: 800; padding-top: 30px;}

        /* EVENT CARDS */
        .event-list { padding: 20px 80px 80px; display: grid; gap: 40px; max-width: 1200px; margin: 0 auto; }
        .event-card {
            display: flex; 
            background: white; 
            border-radius: 20px;
            box-shadow: 0 8px 20px rgba(0,0,0,0.1); 
            overflow: hidden;
            transition: 0.3s ease;
        }
        .event-card:hover { transform: translateY(-5px); box-shadow: 0 15px 30px rgba(74, 137, 176, 0.3); }

        .event-date-box {
            background-color: var(--color-accent); 
            color: white;
            min-width: 140px; 
            display: flex; 
            flex-direction: column;
            align-items: center; 
            justify-content: center; 
            padding: 20px;
            border-right: 5px solid var(--color-primary);
        }
        .event-date-box .month { font-size: 18px; font-weight: 600; text-transform: uppercase; }
        .event-date-box .day { font-size: 56px; font-weight: 800; }

        .event-details { padding: 25px 35px; flex-grow: 1; }
        .event-details h3 { color: var(--color-primary); font-size: 24px; margin: 0 0 10px; }
        .event-meta { display: flex; gap: 25px; margin-bottom: 10px; font-size: 14px; color: var(--color-primary); font-weight: 600; }
        .event-meta span { display: flex; align-items: center; gap: 5px; }

        /* FOOTER CTA */
        .support-cta-section { 
            background: linear-gradient(135deg, var(--color-primary) 0%, #316A85 100%); 
            padding: 60px 10%; 
            display: flex; 
            align-items: center; 
            justify-content: center; 
            gap: 50px; 
            color: white; 
            border-radius: 40px 40px 0 0; 
            margin-top: 50px; 
        }
        .cta-image img { width: 350px; border-radius: 15px; }
        .btn-cta { padding: 15px 30px; border-radius: 30px; border: none; font-weight: bold; cursor: pointer; transition: 0.2s; }
        .btn-volunteer { background: white; color: var(--color-primary); }
        .btn-volunteer:hover { background: #f1f5f9; transform: scale(1.05); }
        .btn-donate { background: var(--color-accent); color: white; margin-left: 10px;}
        .btn-donate:hover { filter: brightness(1.1); transform: scale(1.05); }
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

    <!-- CONSISTENT NAVBAR -->
    <div class="navbar">
    <div class="nav-left">
        <a href="Home.jsp" style="display:flex; align-items:center; gap:12px; text-decoration:none; color:inherit;">
            <img src="Images/logo.jpeg" alt="Pawtectors Logo">
            <span>Pawtectors</span>
        </a>
    </div>
    <div class="nav-right">
        <a href="Home.jsp">Home</a>
        <a href="AboutUs.jsp">About Us</a>
        <a href="Adoption">Adoption</a>
        <a href="Events" class="nav-active">Events</a>
        <a href="Guides.jsp">Pet Guides</a>
        <a href="Contact.jsp">Contact</a>
    </div>
</div>

    <header class="events-header">
        <h1>Upcoming Events</h1>
        <p>Join us this month! Every event helps support our mission to save and rehome pets.</p>
    </header>

    <div class="event-list">
        <c:choose>
            <c:when test="${not empty publicEventList}">
                <c:forEach var="event" items="${publicEventList}">
                    <div class="event-card">
                        <div class="event-date-box">
                            <span class="month">${fn:substring(event.date, 0, 3)}</span>
                            <span class="day">${fn:substring(event.date, 4, fn:length(event.date))}</span>
                        </div>
                        <div class="event-details">
                            <h3>${event.title}</h3>
                            <div class="event-meta">
                                <span>
                                    <i class="fas fa-clock"></i>
                                    ${event.startTime} - ${event.endTime}
                                </span>
                                <span><i class="fas fa-map-marker-alt"></i> ${event.location}</span>
                            </div>
                            <p>${event.description}</p>
                        </div>
                    </div>
                </c:forEach>
            </c:when>
            <c:otherwise>
                <div style="text-align: center; color: #666; padding: 50px;">
                    <h2>No events scheduled at the moment.</h2>
                    <p>Check back later for updates!</p>
                </div>
            </c:otherwise>
        </c:choose>
    </div>

    <div class="footer-tiny">
        <p>&copy; 2026 <span id="admin-trigger">Pawtectors Rescue Shelter</span>. All rights reserved.</p>
    </div>
</body>
</html>