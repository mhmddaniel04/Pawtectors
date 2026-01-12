package com.pawtectors.servlet;

import com.pawtectors.dao.AdminDAO;
import com.pawtectors.model.Cat;
import com.pawtectors.model.Event;
import com.pawtectors.model.AdoptionRequest;
import com.pawtectors.model.Message;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;

import java.io.IOException;
import java.io.InputStream;
import java.net.URLEncoder;
import java.sql.Date;
import java.util.Base64;
import java.util.List;

@WebServlet("/Admin")
@MultipartConfig(maxFileSize = 1024 * 1024 * 5)
public class AdminServlet extends HttpServlet {

    private AdminDAO dao;

    @Override
    public void init() {
        dao = new AdminDAO();
    }

    // ===================== GET =====================
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp)
            throws ServletException, IOException {

        String action = req.getParameter("action");

        try {
            // ----- ADOPTION ACTIONS -----
            if ("approveAdoption".equals(action)) {
                int id = Integer.parseInt(req.getParameter("id"));
                int catId = Integer.parseInt(req.getParameter("catId"));

                dao.updateRequestStatus(id, "Approved");
                dao.updateCatStatus(catId, "Adopted");

                resp.sendRedirect("Admin?tab=adoptions&success=" +
                        URLEncoder.encode("Adoption approved successfully.", "UTF-8"));
                return;
            }

            if ("rejectAdoption".equals(action)) {
                int id = Integer.parseInt(req.getParameter("id"));
                dao.updateRequestStatus(id, "Rejected");

                resp.sendRedirect("Admin?tab=adoptions&success=" +
                        URLEncoder.encode("Adoption request rejected.", "UTF-8"));
                return;
            }

            // ----- DELETE ACTIONS -----
            if ("deleteCat".equals(action)) {
                dao.deleteCat(Integer.parseInt(req.getParameter("id")));
                resp.sendRedirect("Admin?tab=cats&success=" +
                        URLEncoder.encode("Cat record deleted.", "UTF-8"));
                return;
            }

            if ("deleteEvent".equals(action)) {
                dao.deleteEvent(Integer.parseInt(req.getParameter("id")));
                resp.sendRedirect("Admin?tab=events&success=" +
                        URLEncoder.encode("Event deleted successfully.", "UTF-8"));
                return;
            }

            if ("deleteInquiry".equals(action)) {
                dao.deleteInquiry(Integer.parseInt(req.getParameter("id")));
                resp.sendRedirect("Admin?tab=inquiries&success=" +
                        URLEncoder.encode("Inquiry deleted successfully.", "UTF-8"));
                return;
            }

            // ----- LOAD DASHBOARD -----
            loadData(req);
            req.getRequestDispatcher("admin.jsp").forward(req, resp);

        } catch (Exception e) {
            throw new ServletException(e);
        }
    }

    // ===================== POST =====================
   @Override
protected void doPost(HttpServletRequest req, HttpServletResponse resp)
        throws ServletException, IOException {

    String action = req.getParameter("action");

    try {
        String tab = "cats";
        String successMsg = "";

        if ("addCat".equals(action) || "updateCat".equals(action)) {
            handleCatAction(req, action);
            tab = "cats";
            successMsg = action.equals("addCat")
                    ? "Cat record added successfully."
                    : "Cat record updated successfully.";
        }
        else if ("addEvent".equals(action) || "updateEvent".equals(action)) {
            handleEventAction(req, action);
            tab = "events";
            successMsg = action.equals("addEvent")
                    ? "Event created successfully."
                    : "Event updated successfully.";
        }

        resp.sendRedirect("Admin?tab=" + tab + "&success=" +
                URLEncoder.encode(successMsg, "UTF-8"));

    } catch (Exception e) {
        throw new ServletException(e);
    }
}


    // ===================== CAT HANDLER =====================
    private void handleCatAction(HttpServletRequest req, String action) throws Exception {

        Cat c = new Cat();

        if ("updateCat".equals(action)) {
            c.setId(Integer.parseInt(req.getParameter("id")));
        }

        c.setName(req.getParameter("name"));
        c.setBreed(req.getParameter("breed"));
        c.setAge(Integer.parseInt(req.getParameter("age")));
        c.setGender(req.getParameter("gender"));
        c.setShelterLocation(req.getParameter("shelterLocation"));
        c.setStatus(req.getParameter("status"));
        c.setDetails(req.getParameter("details"));
        c.setDateArrived(Date.valueOf(req.getParameter("arrivalDate")));

        Part file = req.getPart("imageFile");
        if (file != null && file.getSize() > 0) {
            try (InputStream is = file.getInputStream()) {
                c.setImageData(AdminDAO.toByteArray(is));
            }
        } else if ("updateCat".equals(action)) {
            Cat old = dao.getCatById(c.getId());
            if (old != null) {
                c.setImageData(old.getImageData());
            }
        }

        if ("addCat".equals(action)) {
            dao.addCat(c);
        } else {
            dao.updateCat(c);
        }
    }

    // ===================== EVENT HANDLER =====================
   private void handleEventAction(HttpServletRequest req, String action) throws Exception {
    String idStr = req.getParameter("id");
    String title = req.getParameter("title");
    String dateStr = req.getParameter("eventDate");
    String location = req.getParameter("location");
    String description = req.getParameter("description");
    
    String startTime = req.getParameter("startTime");
    String endTime = req.getParameter("endTime");

    Event e = new Event();
    if (idStr != null && !idStr.isEmpty()) {
        e.setId(Integer.parseInt(idStr));
    }
    e.setTitle(title);
    e.setEventDate(java.sql.Date.valueOf(dateStr));
    e.setLocation(location);
    e.setDescription(description);
    
    e.setStartTime(startTime);
    e.setEndTime(endTime);

    if ("addEvent".equals(action)) {
        dao.addEvent(e);
    } else {
        dao.updateEvent(e);
    }
}

    // ===================== LOAD DATA =====================
    private void loadData(HttpServletRequest req) throws Exception {

        // Cats
        List<Cat> cats = dao.getAllCats();
        for (Cat c : cats) {
            if (c.getImageData() != null) {
                c.setBase64Image("data:image/png;base64," +
                        Base64.getEncoder().encodeToString(c.getImageData()));
            }
        }
        req.setAttribute("catList", cats);

        req.setAttribute("eventList", dao.getAllEvents());

        req.setAttribute("adoptionRequests", dao.getPendingRequests());

        req.setAttribute("messageList", dao.getMessages());
    }
}
