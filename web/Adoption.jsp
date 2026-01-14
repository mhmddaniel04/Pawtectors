<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
    <title>Pawtectors | Adoption</title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link href="https://fonts.googleapis.com/css2?family=Inter:wght@400;600;700;800&display=swap" rel="stylesheet">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.0/css/all.min.css">
    <link rel="icon" type="image/jpeg" href="Images/logo.jpeg">
    <style>
        :root {
            --color-primary: #1F4A66;
            --color-accent: #4A89B0;
            --color-light-accent: #A8C8DB;
            --color-background: #f7f9fc;
        }

        body { font-family: 'Inter', Arial, sans-serif; margin: 0; background-color: #f8fafc; color: var(--color-primary); }

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

        /* HEADER */
        .adopt-header { 
            background-color: var(--color-primary); 
            color: white; 
            padding: 140px 50px 80px; 
            text-align: center; 
            border-radius: 0 0 40px 40px; 
        }
        .adopt-header h1 { font-size: 48px; margin: 0 0 10px; font-weight: 800; letter-spacing: -1px; }
        .adopt-header p { font-size: 18px; opacity: 0.9; }

        /* STATUS CHECKER SECTION */
        .status-check-bar {
            max-width: 800px;
            margin: -40px auto 40px;
            background: white;
            padding: 25px 40px;
            border-radius: 20px;
            box-shadow: 0 10px 25px rgba(31, 74, 102, 0.1);
            display: flex;
            align-items: center;
            justify-content: space-between;
            position: relative;
            z-index: 10;
        }
        .status-text h4 { margin: 0; font-size: 18px; color: var(--color-primary); }
        .status-text p { margin: 5px 0 0; font-size: 14px; color: #64748b; }
        .btn-check {
            background: var(--color-primary); color: white; padding: 12px 25px; border-radius: 10px;
            text-decoration: none; font-weight: 700; font-size: 14px; transition: 0.3s;
            border: none; cursor: pointer;
        }
        .btn-check:hover { background: var(--color-accent); transform: scale(1.02); }

        /* PET GRID */
        .pet-grid { display: grid; grid-template-columns: repeat(auto-fill, minmax(320px, 1fr)); gap: 30px; padding: 20px 5%; max-width: 1200px; margin: 0 auto 80px; }
        .pet-card { background: white; border-radius: 24px; box-shadow: 0 4px 15px rgba(0,0,0,0.05); overflow: hidden; transition: 0.3s ease; display: flex; flex-direction: column; border: 1px solid #f1f5f9; }
        .pet-card:hover { transform: translateY(-8px); box-shadow: 0 12px 30px rgba(31, 74, 102, 0.15); }
        .pet-img-container { width: 100%; height: 260px; background: #e2e8f0; overflow: hidden; }
        .pet-card img { width: 100%; height: 100%; object-fit: cover; transition: 0.5s ease; }
        .pet-card:hover img { transform: scale(1.05); }
        
        .pet-info { padding: 25px; flex-grow: 1; }
        .pet-info h3 { margin: 0; font-size: 22px; font-weight: 800; color: var(--color-primary); }
        
        /* Fixed Dynamic Status Badges */
        .status-badge { display: inline-block; padding: 6px 14px; border-radius: 12px; font-weight: 800; font-size: 11px; text-transform: uppercase; margin-bottom: 12px; }
        .available { background: #dcfce7; color: #166534; }
        .adopted { background: #fee2e2; color: #991b1b; }
        .pending { background: #fef9c3; color: #854d0e; }

        .btn-view { 
            display: flex; 
            align-items: center; 
            justify-content: center; 
            gap: 8px; 
            background: var(--color-primary); 
            color: white; 
            text-decoration: none; 
            padding: 14px; 
            font-weight: 700; 
            margin: 0 25px 25px; 
            border-radius: 15px; 
            font-size: 15px; 
            transition: 0.3s;
        }
        .btn-view:hover { background: var(--color-accent); }

        /* MODAL STYLES */
        .modal { display: none; position: fixed; z-index: 1001; left: 0; top: 0; width: 100%; height: 100%; background: rgba(15, 23, 42, 0.7); backdrop-filter: blur(8px); }
        .modal-content { background: white; margin: 8% auto; padding: 40px; border-radius: 30px; width: 90%; max-width: 480px; box-shadow: 0 20px 50px rgba(0,0,0,0.2); position: relative; }
        .modal-header { display: flex; justify-content: space-between; align-items: center; margin-bottom: 25px; }
        .modal-header h2 { margin: 0; font-size: 24px; font-weight: 800; color: var(--color-primary); }
        .close { cursor: pointer; font-size: 28px; color: #94a3b8; transition: 0.2s; }
        .close:hover { color: var(--color-primary); }
        
        .form-input { 
            width: 100%; padding: 14px 18px; border: 2px solid #f1f5f9; border-radius: 12px; margin: 10px 0 20px; 
            box-sizing: border-box; font-family: inherit; font-size: 15px; transition: 0.2s;
        }
        .form-input:focus { border-color: var(--color-accent); outline: none; background: #fff; }
        
        .result-item { background: #f8fafc; border: 1px solid #e2e8f0; padding: 18px; border-radius: 18px; margin-top: 15px; display: flex; justify-content: space-between; align-items: center; }
        .status-pill { padding: 6px 12px; border-radius: 10px; font-size: 11px; font-weight: 800; text-transform: uppercase; }
        .pill-Approved { background: #dcfce7; color: #166534; }
        .pill-Rejected { background: #fee2e2; color: #991b1b; }
        .pill-Pending { background: #fef9c3; color: #854d0e; }

        @media (max-width: 600px) {
            .navbar { padding: 15px 25px; }
            .status-check-bar { flex-direction: column; gap: 20px; text-align: center; margin: -40px 20px 40px; }
            .btn-check { width: 100%; }
            .adopt-header h1 { font-size: 32px; }
        }
        
        .footer-tiny {
            background: #16354a;
            color: #94a3b8;
            text-align: center;
            padding: 30px 10%;
            font-size: 14px;
        }
        
        .breed-search-wrapper {
    max-width: 1200px;
    margin: 0 auto 25px;
    padding: 0 5%;
    display: flex;
    justify-content: flex-end;
    position: relative;
}

.breed-search-wrapper input {
    width: 250px;
    padding: 10px 40px 10px 15px;
    border-radius: 25px;
    border: 1px solid #ccc;
    font-size: 14px;
    transition: 0.3s;
}

.breed-search-wrapper input:focus {
    outline: none;
    border-color: var(--color-accent);
    box-shadow: 0 0 8px rgba(72, 144, 176, 0.2);
}

.breed-search-wrapper .search-icon {
    position: absolute;
    right: 15px;
    top: 50%;
    transform: translateY(-50%);
    color: #64748b;
    font-size: 14px;
    pointer-events: none;
}

    </style>
</head>
<body>

    <!-- NAVBAR -->
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
        <a href="Adoption" class="nav-active">Adoption</a>
        <a href="Events">Events</a>
        <a href="Guides.jsp">Pet Guides</a>
        <a href="Contact.jsp">Contact</a>
    </div>
</div>

    <div class="adopt-header">
        <h1>Meet Our Lovely Pets</h1>
        <p>Give a rescued animal the loving home they deserve.</p>
    </div>

    <div class="status-check-bar">
        <div class="status-text">
            <h4>Already applied?</h4>
            <p>Check the status of your adoption request here.</p>
        </div>
        <button class="btn-check" onclick="openStatusModal()">Check My Status</button>
    </div>
    
    <div class="breed-search-wrapper">
        <i class="fa-solid fa-magnifying-glass search-icon"></i>
        <input 
            type="text" 
            id="breedSearch" 
            placeholder="Search by breed...">
    </div>


    
    <div class="pet-grid">
        <c:forEach var="cat" items="${publicCatList}">
            <div class="pet-card">
                <div class="pet-img-container">
                    <img src="${cat.base64Image != null ? cat.base64Image : 'https://placehold.co/600x400?text=No+Image'}" alt="${cat.name}">
                </div>
                <div class="pet-info">
                    <span class="status-badge ${cat.status == 'Available' ? 'available' : (cat.status == 'Adopted' ? 'adopted' : 'pending')}">
                        ${cat.status}
                    </span>
                    <h3>${cat.name}</h3>
                    <p style="font-size: 14px; color: #64748b; margin-top: 5px;"><i class="fa-solid fa-dna"></i> ${cat.breed}</p>
                </div>
                <a href="CatDetails?id=${cat.id}" class="btn-view">
                    <i class="fa-solid fa-eye"></i> View Details
                </a>
            </div>
        </c:forEach>
    </div>
    
    <div class="footer-tiny">
        <p>&copy; 2026 <span id="admin-trigger">Pawtectors Rescue Shelter</span>. All rights reserved.</p>
    </div>

    <!-- TRACKING MODAL -->
    <div id="statusModal" class="modal">
        <div class="modal-content">
            <div class="modal-header">
                <h2>Track Application</h2>
                <span class="close" onclick="closeStatusModal()">&times;</span>
            </div>
            <p style="font-size: 14px; color: #64748b; margin-bottom: 20px;">Enter the email address you used in your application to see the latest updates.</p>
            
            <label style="font-size: 12px; font-weight: 800; color: var(--color-primary); text-transform: uppercase;">Email Address</label>
            <input type="email" id="trackEmail" class="form-input" placeholder="e.g. yourname@email.com">
            
            <button class="btn-check" style="width: 100%; padding: 16px;" onclick="fetchStatus()">Find My Application</button>
            <div id="statusResults" style="margin-top: 25px;"></div>
        </div>
    </div>
    
    <script>
        function openStatusModal() {
            document.getElementById('statusModal').style.display = 'block';
            document.getElementById('statusResults').innerHTML = '';
            document.getElementById('trackEmail').value = '';
        }
        function closeStatusModal() { document.getElementById('statusModal').style.display = 'none'; }

        async function fetchStatus() {
            const email = document.getElementById('trackEmail').value;
            const resultsDiv = document.getElementById('statusResults');
            if (!email) return;
            resultsDiv.innerHTML = '<div style="text-align:center; padding: 20px;"><i class="fa-solid fa-spinner fa-spin" style="font-size: 24px; color: var(--color-accent);"></i></div>';
            
            try {
                const response = await fetch('AdoptionStatus?email=' + encodeURIComponent(email));
                const data = await response.json();
                if (data.length === 0) {
                    resultsDiv.innerHTML = '<div style="text-align:center; padding: 20px; background: #fff1f2; border-radius: 15px; color:#be123c; font-size:14px; font-weight:600;">No applications found for this email.</div>';
                    return;
                }
                let html = '<h4 style="margin-bottom:15px; font-size:14px; font-weight: 800; color: var(--color-primary);">Applications Found:</h4>';
                data.forEach(req => {
                    html += `
                        <div class="result-item">
                            <div>
                                <div style="font-weight:800; font-size:16px; color: var(--color-primary);">\${req.catName}</div>
                                <div style="font-size:12px; color:#64748b; margin-top: 3px;"><i class="fa-solid fa-calendar"></i> Applied \${req.date}</div>
                            </div>
                            <span class="status-pill pill-\${req.status}">\${req.status}</span>
                        </div>
                    `;
                });
                resultsDiv.innerHTML = html;
            } catch (err) { 
                resultsDiv.innerHTML = '<p style="text-align:center; color:#991b1b; padding: 20px;">Error connecting to server. Please try again.</p>'; 
            }
        }
        
        window.onclick = function(event) { 
            if (event.target == document.getElementById('statusModal')) closeStatusModal(); 
        }
        
        const breedInput = document.getElementById('breedSearch');
        const petCards = document.querySelectorAll('.pet-card');

        breedInput.addEventListener('input', function() {
            const query = this.value.toLowerCase();

            petCards.forEach(card => {
                const breedText = card.querySelector('.pet-info p').innerText.toLowerCase();
                if (breedText.includes(query)) {
                    card.style.display = 'flex';
                } else {
                    card.style.display = 'none';
                }
            });
        });
    </script>
</body>
</html>