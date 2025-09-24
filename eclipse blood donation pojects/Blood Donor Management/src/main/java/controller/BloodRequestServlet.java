package controller;

import db.DBConnection;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;

@WebServlet("/BloodRequestServlet")
public class BloodRequestServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        // Get form data
        String username = request.getParameter("username");  // or from session
        String name = request.getParameter("name");
        String mobilenumber = request.getParameter("mobilenumber");
        String email = request.getParameter("email");
        String bloodgroup = request.getParameter("bloodgroup");

        try (Connection con = DBConnection.getCon()) {
            String sql = "INSERT INTO bloodrequest (username, name, mobilenumber, email, bloodgroup, status) VALUES (?, ?, ?, ?, ?, ?)";
            PreparedStatement ps = con.prepareStatement(sql);
            ps.setString(1, username);
            ps.setString(2, name);
            ps.setString(3, mobilenumber);
            ps.setString(4, email);
            ps.setString(5, bloodgroup);
            ps.setString(6, "pending");

            int rows = ps.executeUpdate();
            if (rows > 0) {
                response.sendRedirect("request.jsp?msg=success");
            } else {
                response.sendRedirect("request.jsp?msg=failed");
            }

        } catch (Exception e) {
            e.printStackTrace();
            response.sendRedirect("request.jsp?msg=error");
        }
    }
}
