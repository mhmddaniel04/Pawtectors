import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet("/AdminAuth")
public class AdminAuth extends HttpServlet {
    private static final long serialVersionUID = 1L;

    // Hardcoded Admin Credentials
    private static final String ADMIN_USER = "admin_paw";
    private static final String ADMIN_PASS = "Admin123!";

    protected void doPost(HttpServletRequest request, HttpServletResponse response) 
            throws ServletException, IOException {
        
        String user = request.getParameter("username");
        String pass = request.getParameter("password");

        // Validate credentials
        if (ADMIN_USER.equals(user) && ADMIN_PASS.equals(pass)) {
            HttpSession session = request.getSession();
            session.setAttribute("adminUser", user);
            session.setAttribute("role", "ADMIN");
            
            response.sendRedirect("Admin");
        } else {
            response.sendRedirect("Login.jsp?error=1");
        }
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) 
            throws ServletException, IOException {
        response.sendRedirect("Login.jsp");
    }
}