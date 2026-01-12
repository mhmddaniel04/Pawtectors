package com.pawtectors.servlet;

import com.pawtectors.dao.AdminDAO;
import com.pawtectors.model.AdoptionRequest;
import java.io.IOException;
import java.sql.Date;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;

@WebServlet("/AdoptionSubmit")
public class AdoptionSubmitServlet extends HttpServlet {
    private AdminDAO dao = new AdminDAO();

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String catIdStr = request.getParameter("catId");
        if (catIdStr == null) {
            response.sendRedirect("index.jsp");
            return;
        }

        int catId = Integer.parseInt(catIdStr);
        
        try {
            AdoptionRequest ar = new AdoptionRequest();
            ar.setCatId(catId);
            ar.setUserName(request.getParameter("userName"));
            ar.setOrigin(request.getParameter("origin"));
            ar.setGender(request.getParameter("gender"));
            ar.setEmail(request.getParameter("email"));
            ar.setAge(Integer.parseInt(request.getParameter("age")));
            ar.setPickupDate(Date.valueOf(request.getParameter("pickupDate")));
            
            dao.submitAdoptionRequest(ar);
            
            response.sendRedirect("CatDetails?id=" + catId + "&success=true");
            
        } catch (Exception e) {
            e.printStackTrace();
            response.sendRedirect("CatDetails?id=" + catId + "&error=true");
        }
    }
}