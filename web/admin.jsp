<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>


<!DOCTYPE html>

<html>
<head>
<title>Pawtectors | Admin Dashboard</title>
<link href="https://fonts.googleapis.com/css2?family=Inter:wght@400;600;700;800&display=swap" rel="stylesheet">
<link rel="icon" type="image/jpeg" href="Images/logo.jpeg">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.0/css/all.min.css">
<style>
    :root {
    --nav-blue: #1F4A66;
    --accent-blue: #288EB9;
    --light-blue: #A8C8DB;
    --bg: #f4f7f9;
    --success: #22c55e;
    --danger: #ef4444;
    }

    body { 
        font-family: 'Inter', sans-serif; 
        margin: 0; 
        background-color: var(--bg); 
        display: flex; 
    }

    /* Sidebar Branding */
    .sidebar { 
        width: 280px; 
        background: var(--nav-blue); 
        height: 100vh; 
        position: fixed; 
        color: white; 
        display: flex; 
        flex-direction: column; 
        padding: 30px 20px; 
        box-sizing: border-box; 
    }

    .sidebar h2 { 
        font-size: 24px; 
        font-weight: 800; 
        margin-bottom: 40px; 
        border-bottom: 1px solid rgba(255,255,255,0.1); 
        padding-bottom: 20px; 
    }
    
    .nav-item { 
        padding: 15px; 
        margin-bottom: 10px; 
        border-radius: 10px; 
        cursor: pointer; 
        transition: 0.3s; 
        font-weight: 600; 
        display: flex; 
        align-items: center; 
        gap: 12px; 
    }

    .nav-item:hover { background: rgba(255,255,255,0.1); }
    .nav-item.active { background: var(--accent-blue); }

    .exit-btn { 
        margin-top: auto; 
        padding: 15px; 
        background: rgba(255,255,255,0.1); 
        color: white; 
        text-decoration: none; 
        border-radius: 10px; 
        text-align: center; 
        font-weight: bold; 
        transition: 0.3s; 
    }
    .exit-btn:hover { background: var(--danger); }

    /* Main Panel */
    .main { 
        margin-left: 280px; 
        padding: 40px; 
        width: calc(100% - 280px); 
    }

    .card { 
        background: white; 
        border-radius: 20px; 
        box-shadow: 0 4px 20px rgba(0,0,0,0.05); 
        padding: 30px; 
        margin-bottom: 30px; 
    }

    h1 { 
        color: var(--nav-blue); 
        font-weight: 800; 
        margin-top: 0; 
    }

    /* Tables */
    table { 
        width: 100%; 
        border-collapse: collapse; 
        margin-top: 20px; 
    }

    th { 
        text-align: left; 
        color: #888; 
        font-size: 11px; 
        text-transform: uppercase; 
        letter-spacing: 1px; 
        padding: 15px; 
        border-bottom: 2px solid #f0f0f0; 
    }

    td { 
        padding: 15px; 
        border-bottom: 1px solid #f0f0f0; 
        color: var(--nav-blue); 
        vertical-align: middle; 
    }

    .cat-thumb { 
        width: 50px; 
        height: 50px; 
        border-radius: 12px; 
        object-fit: cover; 
    }
    
    /* Buttons */
    .btn { 
        padding: 10px 20px; 
        border-radius: 8px; 
        border: none; 
        cursor: pointer; 
        font-weight: bold; 
        font-family: 'Inter'; 
        transition: 0.3s; 
        font-size: 14px; 
        text-decoration: none; 
        display: inline-block; 
    }

    .btn-add { background: var(--nav-blue); color: white; margin-bottom: 20px; }
    .btn-edit { background: var(--light-blue); color: white; }
    .btn-approve { background: var(--success); color: white; }
    .btn-reject { background: var(--danger); color: white; }
    .btn-delete { 
        color: var(--danger); 
        background: none; 
        text-decoration: none; 
        font-size: 14px; 
        margin-left: 10px; 
    }
    
    .modal-actions {
    display: flex;
    justify-content: flex-end;
    gap: 12px;
    margin-top: 20px;
    }

    .btn-primary {
        background: var(--nav-blue);
        color: #fff;
        padding: 10px 22px;
        border-radius: 6px;
        font-weight: 600;
        border: none;
        cursor: pointer;
    }

    .btn-primary:hover {
        opacity: 0.9;
    }

    .btn-cancel {
        background: #f1f5f9;
        color: #334155;
        padding: 10px 18px;
        border-radius: 6px;
        border: 1px solid #cbd5e1;
        cursor: pointer;
    }

    .btn-cancel:hover {
        background: #e2e8f0;
    }

    
    /* Inquiry Message Box */
    .msg-text { 
        background: #f8fafc; 
        padding: 12px; 
        border-radius: 8px; 
        font-size: 14px; 
        color: #475569; 
        border: 1px solid #e2e8f0; 
    }

    .sender-email { 
        font-size: 12px; 
        color: var(--accent-blue); 
        display: block; 
    }

    /* Badges */
    .badge { 
        padding: 5px 12px; 
        border-radius: 20px; 
        font-size: 12px; 
        font-weight: 700; 
    }
    .badge-pending { background: #fef9c3; color: #854d0e; }

    /* Modals */
    .modal { 
        display: none; 
        position: fixed; 
        inset: 0; 
        background: rgba(31, 74, 102, 0.8); 
        justify-content: center; 
        align-items: center; 
        z-index: 1000; 
    }

    .modal-content { 
        background: white; 
        width: 500px; 
        border-radius: 20px; 
        padding: 40px; 
        position: relative; 
    }

    input, select, textarea { 
        width: 100%; 
        padding: 12px; 
        margin: 10px 0 20px; 
        border: 2px solid #eee; 
        border-radius: 10px; 
        font-family: 'Inter'; 
        box-sizing: border-box; 
    }
    
    .tab-content { display: none; }
    .tab-content.active { display: block; }
    
    
</style>


</head>
<body>

<!-- SIDEBAR -->
<div class="sidebar">

    <div style="text-align: center; margin-bottom: 20px;">
        <img src="Images/logo.jpeg" alt="Pawtectors Logo" style="width: 120px; height: auto; border-radius: 12px;">
    </div>

    <h2>Pawtectors Admin</h2>
    
    <div class="nav-item active" id="nav-cats" onclick="showTab('cats', this)">
        <i class="fa-solid fa-cat"></i> Cat Records
    </div>
    
    <div class="nav-item" id="nav-adoptions" onclick="showTab('adoptions', this)">
        <i class="fa-solid fa-file-signature"></i> Adoption Approval
    </div>
    
    <div class="nav-item" id="nav-events" onclick="showTab('events', this)">
        <i class="fa-solid fa-calendar-days"></i> Event Posts
    </div>

    <div class="nav-item" id="nav-inquiries" onclick="showTab('inquiries', this)">
        <i class="fa-solid fa-envelope"></i> User Inquiries
    </div>

    <a href="Home.jsp" class="exit-btn">
        <i class="fa-solid fa-right-from-bracket"></i> Exit to Site
    </a>
</div>


<!-- MAIN CONTENT -->
<div class="main">
   <c:if test="${not empty param.success}">
        <div id="successMsg" class="card" style="
            background: #ecfdf5;
            border-left: 6px solid #22c55e;
            color: #065f46;
            padding: 15px 20px;
            margin-bottom: 20px;
            font-weight: 600;
            transition: opacity 0.6s ease, transform 0.6s ease;">
            <i class="fa-solid fa-circle-check"></i>
            ${param.success}
        </div>
    </c:if>


    <!-- CAT RECORDS TAB -->
    <div id="cats-tab" class="tab-content active">
        <div style="display:flex; justify-content: space-between; align-items: center;">
            <h1>Shelter Management</h1>
            <button class="btn btn-add" onclick="openAddCatModal()">+ Add New Cat</button>
        </div>
        <div class="card">
            <div style="display: flex; justify-content: space-between; align-items: center; margin-bottom: 15px;">
                <div>
                    <input type="text" id="searchBreed" placeholder="Search by breed..." style="padding: 8px 12px; border-radius: 6px; border: 1px solid #ccc;">
                </div>
                <div>
                    <select id="statusFilter" style="padding: 8px 12px; border-radius: 6px; border: 1px solid #ccc;">
                        <option value="All">All Status</option>
                        <option value="Available">Available</option>
                        <option value="Adopted">Adopted</option>
                    </select>
                </div>
            </div>
            <table>
                <thead>
                    <tr>
                        <th>Image</th>
                        <th>Name</th>
                        <th>Breed</th>
                        <th>Status</th>
                        <th>Actions</th>
                    </tr>
                </thead>
                <tbody>
                    <c:forEach var="c" items="${catList}">
                        <tr>
                            <td>
                                <img src="${not empty c.base64Image ? c.base64Image : 'https://via.placeholder.com/50'}" class="cat-thumb">
                            </td>
                            <td><strong>${c.name}</strong></td>
                            <td>${c.breed}</td>
                            <td>
                                <span style="color: ${c.status == 'Available' ? '#22c55e' : (c.status == 'Adopted' ? '#3b82f6' : '#64748b')}">
                                    <i class="fa-solid fa-circle" style="font-size: 8px; vertical-align: middle; margin-right: 5px;"></i> ${c.status}
                                </span>
                            </td>
                            <td>
                                <button class="btn btn-edit" onclick="openEditCatModal('${c.id}','${fn:escapeXml(c.name)}','${fn:escapeXml(c.breed)}','${c.age}','${c.gender}','${fn:escapeXml(c.shelterLocation)}','${c.htmlDate}','${c.status}','${fn:escapeXml(c.details)}')">Edit</button>
                                <a href="Admin?action=deleteCat&id=${c.id}" class="btn btn-delete" onclick="return confirm('Delete this record?')">Delete</a>
                            </td>
                        </tr>
                    </c:forEach>
                </tbody>
            </table>
        </div>
    </div>

    <!-- ADOPTION APPROVAL TAB -->
    <div id="adoptions-tab" class="tab-content">
    <h1>Adoption Approval</h1>
        <div class="card">
            <c:choose>
                <c:when test="${empty adoptionRequests}">
                    <div style="text-align: center; padding: 40px; color: #888;">
                        <i class="fa-solid fa-inbox" style="font-size: 48px; margin-bottom: 20px; opacity: 0.3;"></i>
                        <p>No pending adoption requests at the moment.</p>
                    </div>
                </c:when>
                <c:otherwise>
                    <div style="display: flex; justify-content: flex-end; align-items: center; margin-bottom: 10px; gap: 8px;">
                        <label for="adoptionSort" style="font-weight: 600; color: #1F4A66;">Sort by:</label>
                        <select id="adoptionSort" style="padding: 6px 12px; border-radius: 6px; border: 1px solid #ccc; min-width: 140px;">
                            <option value="newest">Newest First</option>
                            <option value="oldest">Oldest First</option>
                        </select>
                    </div>

                    <table>
                        <thead>
                            <tr>
                                <th>Pet</th>
                                <th>Applicant Info</th>
                                <th>Applicant Age</th>
                                <th>Pickup Date</th>
                                <th>Request Date</th> 
                                <th>Actions</th>
                            </tr>
                        </thead>
                        <tbody id="adoptionTableBody">
                            <c:forEach var="ar" items="${adoptionRequests}">
                                <tr>
                                    <td>
                                        <div style="font-weight: 800; color: var(--accent-blue)">${ar.catName}</div>
                                        <small>ID: #${ar.catId}</small>
                                    </td>
                                    <td>
                                        <strong>${ar.userName}</strong><br>
                                        <span style="font-size: 12px; color: #666;">${ar.email}</span>
                                    </td>
                                    <td>
                                        ${ar.origin}<br>
                                        <small>${ar.age} Years Old</small>
                                    </td>
                                    <td>
                                        <div style="font-weight: 600;">${ar.pickupDate}</div>
                                        <span class="badge badge-pending">${ar.status}</span>
                                    </td>
                                    <td data-date="${ar.requestDate}">
                                        <fmt:formatDate value="${ar.requestDate}" pattern="dd-MM-yyyy"/>
                                    </td>
                                    <td>
                                        <div style="display: flex; gap: 8px;">
                                            <a href="Admin?action=approveAdoption&id=${ar.id}&catId=${ar.catId}" 
                                               class="btn btn-approve" 
                                               onclick="return confirm('Approve this adoption?')">Approve</a>
                                            <a href="Admin?action=rejectAdoption&id=${ar.id}" 
                                               class="btn btn-reject" 
                                               onclick="return confirm('Reject this application?')">Reject</a>
                                        </div>
                                    </td>
                                </tr>
                            </c:forEach>
                        </tbody>
                    </table>
                </c:otherwise>
            </c:choose>
        </div>
    </div>

    <!-- EVENTS TAB -->
    <div id="events-tab" class="tab-content">
    <div style="display:flex; justify-content: space-between; align-items: center; margin-bottom: 15px;">
        <h1>Announcements</h1>
        <button class="btn btn-add" onclick="openAddEventModal()">+ Create Event</button>
    </div>

    <div class="card">
        <c:choose>
            <c:when test="${empty eventList}">
                <div style="text-align: center; padding: 40px; color: #888;">
                    <i class="fa-solid fa-calendar-days" style="font-size: 48px; margin-bottom: 20px; opacity: 0.3;"></i>
                    <p>No events posted yet.</p>
                </div>
            </c:when>
            <c:otherwise>
                <div style="display: flex; justify-content: flex-end; align-items: center; margin-bottom: 10px; gap: 8px;">
                    <label for="eventSort" style="font-weight: 600; color: #1F4A66;">Sort by:</label>
                    <select id="eventSort" style="padding: 6px 12px; border-radius: 6px; border: 1px solid #ccc; min-width: 140px;">
                        <option value="sooner">Sooner First</option>
                        <option value="later">Later First</option>
                    </select>
                </div>

                <table>
                    <thead>
                        <tr>
                            <th>Title</th>
                            <th>Date</th>
                            <th>Location</th>
                            <th>Start Time</th>
                            <th>End Time</th>
                            <th>Actions</th>
                        </tr>
                    </thead>
                    <tbody id="eventTableBody">
                        <c:forEach var="e" items="${eventList}">
                            <tr>
                                <td><strong>${e.title}</strong></td>
                                <td data-date="${e.eventDate}">
                                    <fmt:formatDate value="${e.eventDate}" pattern="dd-MM-yyyy"/>
                                </td>
                                <td>${e.location}</td>
                                <td>${e.startTime}</td>
                                <td>${e.endTime}</td>
                                <td>
                                    <button class="btn btn-edit" 
                                        onclick="openEditEventModal('${e.id}',
                                                                    '${fn:escapeXml(e.title)}',
                                                                    '${e.htmlDate}',
                                                                    '${fn:escapeXml(e.location)}',
                                                                    '${fn:escapeXml(e.description)}',
                                                                    '${e.startTime}',
                                                                    '${e.endTime}')">
                                        Edit
                                    </button>
                                    <a href="Admin?action=deleteEvent&id=${e.id}" class="btn btn-delete" onclick="return confirm('Delete event?')">Delete</a>
                                </td>
                            </tr>
                        </c:forEach>
                    </tbody>
                </table>
            </c:otherwise>
        </c:choose>
    </div>
</div>

    <!-- USER INQUIRIES TAB -->
    <div id="inquiries-tab" class="tab-content">
    <h1>User Inquiries</h1>
        <div class="card">
            <c:choose>
                <c:when test="${empty messageList}">
                    <div style="text-align: center; padding: 40px; color: #888;">
                        <i class="fa-solid fa-envelope-open" style="font-size: 48px; margin-bottom: 20px; opacity: 0.3;"></i>
                        <p>No messages received yet.</p>
                    </div>
                </c:when>
                <c:otherwise>
                    <div style="display: flex; justify-content: flex-end; align-items: center; margin-bottom: 10px; gap: 8px;">
                        <label for="inquirySort" style="font-weight: 600; color: #1F4A66;">Sort by:</label>
                        <select id="inquirySort" style="padding: 6px 12px; border-radius: 6px; border: 1px solid #ccc; min-width: 140px;">
                            <option value="newest">Newest First</option>
                            <option value="oldest">Oldest First</option>
                        </select>
                    </div>

                    <table>
                        <thead>
                            <tr>
                                <th>Sender</th>
                                <th>Message</th>
                                <th>Date</th>
                                <th>Action</th>
                            </tr>
                        </thead>
                        <tbody id="inquiryTableBody">
                            <c:forEach var="m" items="${messageList}">
                                <tr>
                                    <td style="width: 200px;">
                                        <strong>${m.name}</strong>
                                        <span class="sender-email">${m.email}</span>
                                    </td>
                                    <td>
                                        <div class="msg-text">${m.message}</div>
                                    </td>
                                    <td data-date="${m.createdAt}" style="white-space: nowrap; font-size: 13px; color: #64748b;">
                                        ${m.createdAt}
                                    </td>
                                    <td>
                                        <a href="Admin?action=deleteInquiry&id=${m.id}" class="btn btn-delete" onclick="return confirm('Delete this message?')">
                                            <i class="fa-solid fa-trash"></i>
                                        </a>
                                    </td>
                                </tr>
                            </c:forEach>
                        </tbody>
                    </table>
                </c:otherwise>
            </c:choose>
        </div>
    </div>

<!-- CAT MODAL -->
<div id="catModal" class="modal">
    <div class="modal-content">
        <h2 id="catMTitle" style="color: var(--nav-blue)">Add Cat</h2>
        <form action="Admin" method="POST" enctype="multipart/form-data">
            <input type="hidden" name="action" id="catAction" value="addCat">
            <input type="hidden" name="id" id="catId">
            
            <div style="display:grid; grid-template-columns: 1fr 1fr; gap:10px;">
                <input type="text" name="name" id="c_name" placeholder="Cat Name" required>
                <input type="text" name="breed" id="c_breed" placeholder="Breed" required>
            </div>
            
            <div style="display:grid; grid-template-columns: 1fr 1fr; gap:10px;">
                <input type="number" name="age" id="c_age" placeholder="Age" required>
                <select name="gender" id="c_gender">
                    <option>Male</option>
                    <option>Female</option>
                </select>
            </div>
            
            <input type="text" name="shelterLocation" id="c_loc" placeholder="Shelter Location">
            <label style="font-size: 12px; font-weight: 700; color: #555; margin-top: 5px;">
                Arrival Date
            </label>
            <input type="date" name="arrivalDate" id="c_date" required>

            
            <select name="status" id="c_status">
                <option>Available</option>
                <option>Adopted</option>
            </select>
            
            <textarea name="details" id="c_details" placeholder="Care Details/History"></textarea>
            
            <label style="font-size: 12px; color: #888;">Upload Photo</label>
            <input type="file" name="imageFile" accept="image/*">
            
            <div class="modal-actions">
                <button type="button" class="btn btn-cancel" onclick="closeModal('catModal')">
                    Cancel
                </button>
                <button type="submit" class="btn btn-primary">
                    Save Record
                </button>
            </div>

        </form>
    </div>
</div>

<!-- EVENT MODAL -->
<div id="eventModal" class="modal">
    <div class="modal-content">
        <h2 id="eventMTitle" style="color: var(--nav-blue)">New Event</h2>
        <form action="Admin" method="POST">
            <input type="hidden" name="action" id="eventAction" value="addEvent">
            <input type="hidden" name="id" id="eventId">
            
            <input type="text" name="title" id="e_title" placeholder="Event Title" required>
            <input type="date" name="eventDate" id="e_date" required title="Event Date">
            <input type="text" name="location" id="e_loc" placeholder="Event Location">
            
            <textarea name="description" id="e_desc" placeholder="Event Description"></textarea>
            
            <div style="display: flex; gap: 10px; margin-bottom: 10px;">
    <div style="flex: 1;">
        <label style="font-size: 12px; font-weight: bold; color: var(--nav-blue);">Start Time</label>
        <input type="time" name="startTime" id="e_start" required>
    </div>
    <div style="flex: 1;">
        <label style="font-size: 12px; font-weight: bold; color: var(--nav-blue);">End Time</label>
        <input type="time" name="endTime" id="e_end" required>
    </div>
</div>

<div class="modal-actions">
    <button type="button" class="btn btn-cancel" onclick="closeModal('eventModal')">Cancel</button>
    <button type="submit" class="btn btn-primary">Publish</button>
</div>

        </form>
    </div>
</div>

    <script>
        window.onload = function() {
            const urlParams = new URLSearchParams(window.location.search);
            const tab = urlParams.get('tab');
            if (tab === 'adoptions') {
                showTab('adoptions', document.getElementById('nav-adoptions'));
            } else if (tab === 'events') {
                showTab('events', document.getElementById('nav-events'));
            } else if (tab === 'inquiries') {
                showTab('inquiries', document.getElementById('nav-inquiries'));
            }
        };

        function showTab(t, el){
            document.querySelectorAll('.tab-content').forEach(x => x.classList.remove('active'));
            document.querySelectorAll('.nav-item').forEach(x => x.classList.remove('active'));
            document.getElementById(t + '-tab').classList.add('active');
            el.classList.add('active');
        }

        function closeModal(id){ 
            document.getElementById(id).style.display = 'none'; 
        }

        function openAddCatModal(){
            document.getElementById('catMTitle').innerText = "Add New Cat";
            document.getElementById('catAction').value = "addCat";
            document.getElementById('catId').value = '';
            document.getElementById('catModal').style.display = 'flex';
        }

        function openEditCatModal(id,n,b,a,g,l,d,s,dt){
            document.getElementById('catMTitle').innerText = "Edit Cat Record";
            document.getElementById('catAction').value = "updateCat";
            document.getElementById('catId').value = id;
            document.getElementById('c_name').value = n;
            document.getElementById('c_breed').value = b;
            document.getElementById('c_age').value = a;
            document.getElementById('c_gender').value = g;
            document.getElementById('c_loc').value = l;
            document.getElementById('c_date').value = d;
            document.getElementById('c_status').value = s;
            document.getElementById('c_details').value = dt;
            document.getElementById('catModal').style.display = 'flex';
        }

        function openAddEventModal(){
            document.getElementById('eventMTitle').innerText = "Create New Event";
            document.getElementById('eventAction').value = "addEvent";
            document.getElementById('eventModal').style.display = 'flex';
        }

        function openEditEventModal(id, t, d, l, ds, st, et) {
        document.getElementById('eventMTitle').innerText = "Edit Event Details";
        document.getElementById('eventAction').value = "updateEvent";
        document.getElementById('eventId').value = id;
        document.getElementById('e_title').value = t;
        document.getElementById('e_date').value = d;
        document.getElementById('e_loc').value = l;
        document.getElementById('e_desc').value = ds;
        document.getElementById('e_start').value = st;
        document.getElementById('e_end').value = et;

        document.getElementById('eventModal').style.display = 'flex';
        }

        if (window.location.search.includes("success=")) {
        setTimeout(() => {
            const url = new URL(window.location);
            url.searchParams.delete("success");
            window.history.replaceState({}, document.title, url);
        }, 100);
    }

        const tab = new URLSearchParams(window.location.search).get("tab");
        if (tab) {
            document.querySelectorAll(".tab-content").forEach(t => t.classList.remove("active"));
            document.getElementById(tab + "-tab")?.classList.add("active");
        }

        document.addEventListener("DOMContentLoaded", function () {
            const msg = document.getElementById("successMsg");
            if (msg) {
                setTimeout(() => {
                    msg.style.opacity = "0";
                    msg.style.transform = "translateY(-10px)";
                }, 3000);

                setTimeout(() => {
                    msg.remove();
                }, 3600);
            }
        });

        // Cat Table Filtering
        const breedInput = document.getElementById('searchBreed');
        const statusSelect = document.getElementById('statusFilter');
        const catTable = document.querySelector('#cats-tab table tbody');

        function filterCats() {
            const breedValue = breedInput.value.toLowerCase();
            const statusValue = statusSelect.value;

            const rows = catTable.querySelectorAll('tr');
            rows.forEach(row => {
                const breed = row.cells[2].innerText.toLowerCase();
                const status = row.cells[3].innerText.trim();

                const breedMatch = breed.includes(breedValue);
                const statusMatch = (statusValue === "All") || (status === statusValue);

                if (breedMatch && statusMatch) {
                    row.style.display = '';
                } else {
                    row.style.display = 'none';
                }
            });
        }

        // Event listeners
        breedInput.addEventListener('input', filterCats);
        statusSelect.addEventListener('change', filterCats);

        // --- Adoption Sorting (Newest / Oldest Request Date) ---
        document.getElementById('adoptionSort')?.addEventListener('change', function() {
            const sortType = this.value;
            const tableBody = document.getElementById('adoptionTableBody');
            const rows = Array.from(tableBody.querySelectorAll('tr'));

            rows.sort((a, b) => {
                const dateA = new Date(a.cells[4].getAttribute('data-date')); 
                const dateB = new Date(b.cells[4].getAttribute('data-date'));
                return sortType === 'newest' ? dateB - dateA : dateA - dateB;
            });

            rows.forEach(r => tableBody.appendChild(r));
        });

        // --- Event Sorting  ---
        document.getElementById('eventSort')?.addEventListener('change', function() {
            const sortType = this.value;
            const tableBody = document.getElementById('eventTableBody');
            const rows = Array.from(tableBody.querySelectorAll('tr'));

            rows.sort((a, b) => {
                const dateA = new Date(a.cells[1].getAttribute('data-date')); 
                const dateB = new Date(b.cells[1].getAttribute('data-date'));
                return sortType === 'sooner' ? dateA - dateB : dateB - dateA;
            });

            rows.forEach(r => tableBody.appendChild(r));
        });

        // --- User Inquries Sorting  ---
        document.getElementById('inquirySort')?.addEventListener('change', function() {
            const sortType = this.value;
            const tableBody = document.getElementById('inquiryTableBody');
            const rows = Array.from(tableBody.querySelectorAll('tr'));

            rows.sort((a, b) => {
                const dateA = new Date(a.cells[2].getAttribute('data-date'));
                const dateB = new Date(b.cells[2].getAttribute('data-date'));
                return sortType === 'newest' ? dateB - dateA : dateA - dateB;
            });

            rows.forEach(r => tableBody.appendChild(r));
        });
    </script>


</body>
</html>