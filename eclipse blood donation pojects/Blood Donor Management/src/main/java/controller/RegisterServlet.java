package controller;

import db.DBConnection;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;  
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/RegisterServlet")
public class RegisterServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        // Get all data from the form
        String fullname = request.getParameter("fullname");
        String username = request.getParameter("username");
        String password = request.getParameter("password");
        String confirmPassword = request.getParameter("confirmPassword");
        String email = request.getParameter("email");
        String mobile = request.getParameter("mobile");
        String bloodGroup = request.getParameter("blood_group");
        String city = request.getParameter("city");

        // Check if password and confirm password match
        if (!password.equals(confirmPassword)) {
            response.sendRedirect(request.getContextPath() + "/register.jsp?msg=password_mismatch");
            return;
        }

        try (Connection con = DBConnection.getCon()) {

            // Insert data into database
            PreparedStatement ps = con.prepareStatement(
                "INSERT INTO users (fullname, username, password, email, mobile, blood_group, city) VALUES (?, ?, ?, ?, ?, ?, ?)"
            );
            ps.setString(1, fullname);
            ps.setString(2, username);
            ps.setString(3, password); // storing as plain text (not recommended, but simple)
            ps.setString(4, email);
            ps.setString(5, mobile);
            ps.setString(6, bloodGroup);
            ps.setString(7, city);

            int rows = ps.executeUpdate();

            if (rows > 0) {
                response.sendRedirect(request.getContextPath() + "/login.jsp?msg=registered");
            } else {
                response.sendRedirect(request.getContextPath() + "/register.jsp?msg=invalid");
            }

        } catch (Exception e) {
            e.printStackTrace();
            response.sendRedirect(request.getContextPath() + "/register.jsp?msg=error");
        }
    }
}
