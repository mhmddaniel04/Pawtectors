<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
    <title>Pawtectors | ${cat.name}</title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link href="https://fonts.googleapis.com/css2?family=Inter:wght@400;500;600;700;800&display=swap" rel="stylesheet">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.0/css/all.min.css">
    <link rel="icon" type="image/jpeg" href="Images/logo.jpeg">
    <style>
        :root {
            --color-primary: #1F4A66;
            --color-accent: #4A89B0;
            --color-light-accent: #A8C8DB;
            --bg-light: #f8fafc;
        }

        body { font-family: 'Inter', sans-serif; margin: 0; background-color: var(--bg-light); color: var(--color-primary); line-height: 1.6; }

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

        /* HERO HEADER */
        .details-header { 
            padding: 140px 50px 60px; 
            background: linear-gradient(135deg, #1F4A66 0%, #336281 100%); 
            color: white; 
            text-align: center; 
            border-radius: 0 0 40px 40px;
        }
        .details-header h1 { font-size: 48px; margin: 0; font-weight: 800; letter-spacing: -1px; }
        .header-sub { display: flex; justify-content: center; gap: 20px; margin-top: 15px; font-size: 16px; opacity: 0.9; }
        .header-sub span { display: flex; align-items: center; gap: 6px; }

        /* CONTENT CONTAINER */
        .main-layout { 
            display: grid; 
            grid-template-columns: 1fr 1.5fr; 
            gap: 40px; 
            padding: 40px 80px; 
            max-width: 1300px; 
            margin: -40px auto 0; 
            box-sizing: border-box;
        }

        /* LEFT SIDE: IMAGE & ACTION */
        .sidebar { position: sticky; top: 120px; }
        .profile-img-card { 
            background: white; 
            padding: 15px; 
            border-radius: 30px; 
            box-shadow: 0 20px 40px rgba(0,0,0,0.1); 
            margin-bottom: 25px;
        }
        .profile-img-card img { 
            width: 100%; 
            border-radius: 20px; 
            display: block; 
            object-fit: cover; 
            aspect-ratio: 1/1;
        }
        
        .status-ribbon {
            display: flex;
            align-items: center;
            justify-content: center;
            gap: 8px;
            padding: 12px;
            border-radius: 15px;
            font-weight: 800;
            text-transform: uppercase;
            font-size: 13px;
            margin-bottom: 20px;
        }
        .status-Available { background: #dcfce7; color: #166534; }
        .status-Adopted { background: #fee2e2; color: #991b1b; }

        /* RIGHT SIDE: INFO */
        .info-card { background: white; padding: 45px; border-radius: 30px; box-shadow: 0 4px 20px rgba(0,0,0,0.03); margin-bottom: 30px; }
        .info-card h2 { margin-top: 0; font-size: 28px; font-weight: 800; color: var(--color-primary); }
        .story-text { font-size: 17px; color: #475569; line-height: 1.8; margin-bottom: 35px; }

        /* FACTS GRID */
        .facts-grid { display: grid; grid-template-columns: repeat(2, 1fr); gap: 20px; }
        .fact-item { 
            background: #f1f5f9; 
            padding: 20px; 
            border-radius: 20px; 
            display: flex; 
            align-items: center; 
            gap: 15px; 
            border: 1px solid #eef2f6;
        }
        .fact-icon { 
            width: 45px; height: 45px; 
            background: white; 
            border-radius: 12px; 
            display: flex; 
            align-items: center; 
            justify-content: center; 
            color: var(--color-primary); 
            font-size: 18px;
            box-shadow: 0 4px 10px rgba(0,0,0,0.05);
        }
        .fact-label { font-size: 11px; color: #64748b; text-transform: uppercase; font-weight: 700; letter-spacing: 0.5px; }
        .fact-value { font-size: 15px; font-weight: 700; color: var(--color-primary); }

        .btn-adopt { 
            width: 100%; 
            padding: 20px; 
            background: var(--color-primary); 
            color: white; 
            border: none; 
            border-radius: 18px; 
            font-weight: 800; 
            font-size: 18px; 
            cursor: pointer; 
            transition: 0.3s;
            display: flex;
            align-items: center;
            justify-content: center;
            gap: 12px;
        }
        .btn-adopt:hover { background: var(--color-accent); transform: translateY(-3px); box-shadow: 0 10px 25px rgba(31, 74, 102, 0.2); }

        /* MODALS */
        .modal { display: none; position: fixed; z-index: 1000; left: 0; top: 0; width: 100%; height: 100%; background: rgba(15, 23, 42, 0.7); backdrop-filter: blur(8px); }
        .modal-content { background: white; margin: 3% auto; padding: 40px; border-radius: 30px; width: 100%; max-width: 500px; box-sizing: border-box; }
        .form-group { margin-bottom: 20px; }
        .form-group label { display: block; font-weight: 700; margin-bottom: 8px; font-size: 13px; color: #64748b; }
        .form-group input, .form-group select { 
            width: 100%; padding: 14px; border: 2px solid #f1f5f9; border-radius: 12px; font-family: inherit; font-size: 15px; 
            transition: 0.2s;
        }
        .form-group input:focus { border-color: var(--color-accent); outline: none; background: #fff; }

        @media (max-width: 900px) {
            .main-layout { grid-template-columns: 1fr; padding: 20px; }
            .sidebar { position: static; }
            .details-header { padding-top: 100px; }
        }
        
    </style>
</head>
<body>

    <!-- CONSISTENT NAVBAR -->
    <div class="navbar">
        <div class="nav-left">
                    <a href="Home.html" style="display:flex; align-items:center; gap:12px; text-decoration:none; color:inherit;">
                        <img src="Images/logo.jpeg" alt="Pawtectors Logo">
                        <span>Pawtectors</span>
                    </a>
                </div>
        <div class="nav-right">
            <a href="Home.jsp">Home</a>
            <a href="AboutUs.jsp">About Us</a>
            <a href="Adoption" class="nav-active">Adoption</a>
            <a href="Events">Events</a>
            <a href="Guides.html">Pet Guides</a>
            <a href="Contact">Contact</a>
        </div>
    </div>

    <div class="details-header">

        <h1>${cat.name}</h1>
        <div class="header-sub">
            <span><i class="fa-solid fa-dna"></i> ${cat.breed}</span>
            <span><i class="fa-solid fa-venus-mars"></i> ${cat.gender}</span>
            <span><i class="fa-solid fa-cake-candles"></i> ${cat.age} Years Old</span>
        </div>
    </div>

    <div class="main-layout">
        <!-- LEFT COLUMN -->
        <div class="sidebar">
            <div class="profile-img-card">
                <img src="${cat.base64Image != null ? cat.base64Image : 'https://placehold.co/600x600?text=No+Image'}" alt="${cat.name}">
            </div>

            <div class="status-ribbon status-${cat.status}">
                <i class="fa-solid ${cat.status == 'Available' ? 'fa-circle-check' : 'fa-circle-xmark'}"></i>
                Status: ${cat.status}
            </div>

            <c:if test="${cat.status == 'Available'}">
                <button onclick="openModal()" class="btn-adopt">
                    <i class="fa-solid fa-paw"></i> Adopt ${cat.name}
                </button>
            </c:if>
        </div>

        <!-- RIGHT COLUMN -->
        <div class="info-container">
            <div class="info-card">
                <h2>The Story</h2>
                <p class="story-text">
                    ${cat.details != null && !cat.details.isEmpty() ? cat.details : 'We are currently gathering more details about this lovely friend. Stay tuned or contact the shelter for more information!'}
                </p>

                <h2 style="margin-bottom: 20px;">Quick Facts</h2>
                <div class="facts-grid">
                    <div class="fact-item">
                        <div class="fact-icon"><i class="fa-solid fa-house-chimney"></i></div>
                        <div>
                            <div class="fact-label">Location</div>
                            <div class="fact-value">${cat.shelterLocation}</div>
                        </div>
                    </div>
                    <div class="fact-item">
                        <div class="fact-icon"><i class="fa-solid fa-calendar-day"></i></div>
                        <div>
                            <div class="fact-label">Arrival Date</div>
                            <div class="fact-value">${cat.dateArrivedStr}</div>
                        </div>
                    </div>
                    <div class="fact-item">
                        <div class="fact-icon"><i class="fa-solid fa-venus-mars"></i></div>
                        <div>
                            <div class="fact-label">Gender</div>
                            <div class="fact-value">${cat.gender}</div>
                        </div>
                    </div>
                    <div class="fact-item">
                        <div class="fact-icon"><i class="fa-solid fa-hourglass-half"></i></div>
                        <div>
                            <div class="fact-label">Age Category</div>
                            <div class="fact-value">${cat.age <= 1 ? 'Kitten' : (cat.age <= 7 ? 'Adult' : 'Senior')}</div>
                        </div>
                    </div>
                </div>
            </div>

            <div class="info-card" style="background: #eff6ff; border: 2px dashed #bfdbfe;">
                <h3 style="margin: 0; font-size: 18px;"><i class="fa-solid fa-circle-info" style="color: #3b82f6;"></i> Adoption Process</h3>
                <p style="font-size: 14px; color: #1e40af; margin-top: 10px;">
                    Once you submit your application, our team will review your background and the cat's needs. This usually takes 2-3 business days.
                </p>
            </div>
        </div>
    </div>

    <!-- ADOPTION FORM MODAL -->
    <div id="adoptModal" class="modal">
        <div class="modal-content">
            <div style="display: flex; justify-content: space-between; align-items: center; margin-bottom: 30px;">
                <h2 style="margin:0; font-weight: 800;">Adopt ${cat.name}</h2>
                <span style="cursor:pointer; font-size: 24px;" onclick="closeModal()">&times;</span>
            </div>
            
            <form action="AdoptionSubmit" method="POST">
                <input type="hidden" name="catId" value="${cat.id}">
                <div class="form-group">
                    <label>YOUR FULL NAME</label>
                    <input type="text" name="userName" required>
                </div>
                <div class="form-group">
                    <label>EMAIL ADDRESS</label>
                    <input type="email" name="email" required>
                </div>
                <div style="display: grid; grid-template-columns: 1fr 1fr; gap: 15px;">
                    <div class="form-group">
                        <label>YOUR AGE</label>
                        <input type="number" name="age" min="18" required>
                    </div>
                    <div class="form-group">
                        <label>GENDER</label>
                        <select name="gender">
                            <option value="Male">Male</option>
                            <option value="Female">Female</option>
                        </select>
                    </div>
                </div>
                <div class="form-group">
                    <label>PREFERRED PICKUP DATE</label>
                    <input type="date" name="pickupDate" required>
                </div>
                <button type="submit" class="btn-adopt">Submit Application</button>
            </form>
        </div>
    </div>

    <!-- SUCCESS MODAL -->
    <div id="successModal" class="modal">
    <div class="modal-content" style="text-align: center; max-width: 550px;">
        <div style="width: 60px; height: 60px; background: #dcfce7; color: #166534; border-radius: 50%; display: flex; align-items: center; justify-content: center; margin: 0 auto 15px; font-size: 28px;">
            <i class="fa-solid fa-check"></i>
        </div>

        <h2 style="margin-bottom: 10px; font-weight: 800;">Application Sent!</h2>
        <p style="color: #64748b; margin-bottom: 20px;">We have received your request for ${cat.name}.</p>

        <div style="width: 100%; border-radius: 20px; overflow: hidden; background: #f1f5f9; box-shadow: 0 10px 20px rgba(0,0,0,0.05); margin-bottom: 25px;">
            <video id="successVideo" width="100%" style="display: block;">
                <source src="Images/successAdopt1.mp4" type="video/mp4">
                Your browser does not support the video tag.
            </video>
        </div>

        <button class="btn-adopt" onclick="closeSuccessModal()">Great!</button>
    </div>
</div>

    

    <script>
    function openModal() { 
        document.getElementById('adoptModal').style.display = 'block'; 
    }
    
    function closeModal() { 
        document.getElementById('adoptModal').style.display = 'none'; 
    }
    
    function closeSuccessModal() {
        // Stop and reset the video
        const video = document.getElementById('successVideo');
        if (video) {
            video.pause();
            video.currentTime = 0;
        }
        
        document.getElementById('successModal').style.display = 'none';
        
        // Clean the URL parameters without refreshing the page
        const url = new URL(window.location);
        url.searchParams.delete('success');
        window.history.replaceState({}, document.title, url);
    }

    window.onload = function() {
        const urlParams = new URLSearchParams(window.location.search);
        if (urlParams.get('success') === 'true') {
            // Show the success modal
            document.getElementById('successModal').style.display = 'block';
            
            // Play the video
            const video = document.getElementById('successVideo');
            if (video) {
                video.play().catch(function(error) {
                    console.log("Autoplay prevented: user interaction required.");
                });
            }
        }
    }
</script>
</body>
</html>