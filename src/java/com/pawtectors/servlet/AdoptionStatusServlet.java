package com.pawtectors.servlet;

import com.pawtectors.dao.AdminDAO;
import com.pawtectors.model.AdoptionRequest;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

@WebServlet("/AdoptionStatus")
public class AdoptionStatusServlet extends HttpServlet {
    private AdminDAO dao;

    @Override
    public void init() {
        dao = new AdminDAO();
    }


    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String email = req.getParameter("email");
        resp.setContentType("application/json");
        resp.setCharacterEncoding("UTF-8");
        PrintWriter out = resp.getWriter();

        try {
            List<AdoptionRequest> list = dao.getRequestsByEmail(email);
            
            StringBuilder json = new StringBuilder("[");
            for (int i = 0; i < list.size(); i++) {
                AdoptionRequest ar = list.get(i);
                json.append("{")
                    .append("\"catName\":\"").append(ar.getCatName() != null ? ar.getCatName() : "Unknown").append("\",")
                    .append("\"status\":\"").append(ar.getStatus()).append("\",")
                    .append("\"date\":\"").append(ar.getPickupDate() != null ? ar.getPickupDate().toString() : "N/A").append("\"")
                    .append("}");
                if (i < list.size() - 1) json.append(",");
            }
            json.append("]");
            
            out.print(json.toString());
        } catch (Exception e) {
            resp.setStatus(HttpServletResponse.SC_INTERNAL_SERVER_ERROR);
            out.print("[]");
        }
    }
}