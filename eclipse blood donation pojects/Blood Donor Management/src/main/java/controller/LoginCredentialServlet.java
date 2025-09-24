package controller;

import db.DBConnection;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import java.io.IOException;
import java.sql.*;

@WebServlet("/LoginCredentialServlet")
public class LoginCredentialServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String username = request.getParameter("username").trim();
        String password = request.getParameter("password").trim();

        try (Connection con = DBConnection.getCon();
             PreparedStatement ps = con.prepareStatement("SELECT * FROM users WHERE username=?")) {

            ps.setString(1, username);
            ResultSet rs = ps.executeQuery();

            if (rs.next()) {
                String dbPassword = rs.getString("password");
                if (password.equals(dbPassword)) {
                    HttpSession session = request.getSession();
                    session.setAttribute("username", rs.getString("username"));
                    session.setAttribute("fullname", rs.getString("fullname"));
                    session.setAttribute("email", rs.getString("email"));
                    session.setAttribute("mobile", rs.getString("mobile"));
                    session.setAttribute("bloodGroup", rs.getString("blood_group"));
                    session.setAttribute("city", rs.getString("city"));

                    response.sendRedirect(request.getContextPath() + "/home.jsp");

                    return;
                }
            }

            // login failed
            response.sendRedirect("login.jsp?msg=invalid");

        } catch (Exception e) {
            e.printStackTrace();
            response.sendRedirect("login.jsp?msg=error");
        }
    }
}
