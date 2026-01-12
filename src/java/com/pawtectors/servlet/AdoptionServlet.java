package com.pawtectors.servlet;

import com.pawtectors.dao.AdminDAO;
import com.pawtectors.model.Cat;
import java.io.IOException;
import java.util.Base64;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;

@WebServlet(name = "AdoptionServlet", urlPatterns = {"/Adoption"})
public class AdoptionServlet extends HttpServlet {
    
    private final AdminDAO dao = new AdminDAO();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) 
            throws ServletException, IOException {
        try {
            List<Cat> allCats = dao.getAllCats();
            
            for (Cat c : allCats) {
                if (c.getImageData() != null && c.getImageData().length > 0) {
                    String base64Str = Base64.getEncoder().encodeToString(c.getImageData());
                    c.setBase64Image("data:image/png;base64," + base64Str);
                }
            }
            
            request.setAttribute("publicCatList", allCats);
            request.getRequestDispatcher("Adoption.jsp").forward(request, response);
            
        } catch (Exception ex) {
            ex.printStackTrace();
            request.getRequestDispatcher("Adoption.jsp").forward(request, response);
        }
    }
}