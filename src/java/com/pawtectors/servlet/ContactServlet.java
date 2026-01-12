import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/Contact")
public class ContactServlet extends HttpServlet {

    private String dbUrl = "jdbc:derby://localhost:1527/pawtectors_db;create=true";
    private String dbUser = "app";
    private String dbPass = "app";
    private String dbDriver = "org.apache.derby.jdbc.ClientDriver";

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        request.getRequestDispatcher("Contact.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String name = request.getParameter("name");
        String email = request.getParameter("email");
        String message = request.getParameter("message");

        Connection conn = null;
        try {

            Class.forName(dbDriver);
            conn = DriverManager.getConnection(dbUrl, dbUser, dbPass);

            String sql = "INSERT INTO contact_messages (name, email, message) VALUES (?, ?, ?)";
            PreparedStatement statement = conn.prepareStatement(sql);
            statement.setString(1, name);
            statement.setString(2, email);
            statement.setString(3, message);

            statement.executeUpdate();

            request.setAttribute("success", "true");
            request.getRequestDispatcher("Contact.jsp").forward(request, response);

        } catch (Exception e) {
            e.printStackTrace();

            response.sendRedirect("Contact?error=database");
        } finally {
            try {
                if (conn != null) conn.close();
            } catch (Exception ex) {
                ex.printStackTrace();
            }
        }
    }
}