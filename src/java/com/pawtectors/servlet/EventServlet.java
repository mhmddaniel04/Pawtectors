package com.pawtectors.servlet;

import com.pawtectors.dao.AdminDAO;
import com.pawtectors.model.Event;
import java.io.IOException;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;

@WebServlet(name = "EventServlet", urlPatterns = {"/Events"})
public class EventServlet extends HttpServlet {

    private final AdminDAO dao = new AdminDAO();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {

            List<Event> eventList = dao.getAllAnnouncements();
            
            request.setAttribute("publicEventList", eventList);
            
            request.getRequestDispatcher("Events.jsp").forward(request, response);
        } catch (Exception ex) {
            ex.printStackTrace();

            request.getRequestDispatcher("Events.jsp").forward(request, response);
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        doGet(request, response);
    }
}