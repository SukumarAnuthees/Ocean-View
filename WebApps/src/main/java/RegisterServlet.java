import java.io.IOException;
import java.sql.*;
import jakarta.servlet.*;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;

@WebServlet("/RegisterServlet")
public class RegisterServlet extends HttpServlet {

    private static final long serialVersionUID = 1L;

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String username = request.getParameter("username");
        String email = request.getParameter("email");
        String password = request.getParameter("password");

        String url = "jdbc:mysql://localhost:3306/icbt?useSSL=false&allowPublicKeyRetrieval=true";
        String dbUser = "root";      // replace with your MySQL username
        String dbPass = "";          // replace with your MySQL password

        Connection con = null;
        PreparedStatement psCheck = null;
        PreparedStatement psInsert = null;
        ResultSet rs = null;

        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            con = DriverManager.getConnection(url, dbUser, dbPass);

            // Check if username or email exists
            String checkUser = "SELECT * FROM users WHERE username=? OR email=?";
            psCheck = con.prepareStatement(checkUser);
            psCheck.setString(1, username);
            psCheck.setString(2, email);
            rs = psCheck.executeQuery();

            if(rs.next()) {
                // Username or email already exists
                request.setAttribute("errorMessage", "Username or Email already exists!");
                request.getRequestDispatcher("register.jsp").forward(request, response);
            } else {
                // Insert new user
                String sql = "INSERT INTO users (username, email, password) VALUES (?, ?, ?)";
                psInsert = con.prepareStatement(sql);
                psInsert.setString(1, username);
                psInsert.setString(2, email);
                psInsert.setString(3, password); // For production, hash the password

                int i = psInsert.executeUpdate();
                if(i > 0) {
                    request.setAttribute("successMessage", "Registration successful! Please login.");
                    request.getRequestDispatcher("login.jsp").forward(request, response);
                } else {
                    request.setAttribute("errorMessage", "Registration failed. Try again.");
                    request.getRequestDispatcher("register.jsp").forward(request, response);
                }
            }

        } catch (Exception e) {
            e.printStackTrace();
            request.setAttribute("errorMessage", "Database error: " + e.getMessage());
            request.getRequestDispatcher("register.jsp").forward(request, response);
        } finally {
            try {
                if(rs != null) rs.close();
                if(psCheck != null) psCheck.close();
                if(psInsert != null) psInsert.close();
                if(con != null) con.close();
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        // Redirect GET requests to register page
        response.sendRedirect("register.jsp");
    }
}
