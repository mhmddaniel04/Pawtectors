package com.pawtectors.servlet;

import com.pawtectors.dao.AdminDAO;
import com.pawtectors.model.Cat;
import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;

@WebServlet(name = "CatDetailsServlet", urlPatterns = {"/CatDetails"})
public class CatDetailsServlet extends HttpServlet {

    private final AdminDAO dao = new AdminDAO();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            String idStr = request.getParameter("id");
            
            if (idStr != null && !idStr.isEmpty()) {
                int catId = Integer.parseInt(idStr);
                
                Cat selectedCat = dao.getCatById(catId);
                
                if (selectedCat != null) {
                    request.setAttribute("cat", selectedCat);
                    request.getRequestDispatcher("CatDetails.jsp").forward(request, response);
                    return;
                }
            }
            
            response.sendRedirect("Adoption");
            
        } catch (Exception ex) {
            ex.printStackTrace();
            response.sendRedirect("Adoption");
        }
    }
}