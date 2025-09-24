package controller;

import db.DBConnection;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;

@WebServlet("/DonorServlet")
public class DonorServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String name = request.getParameter("name");
        String mobilenumber = request.getParameter("mobilenumber");
        String email = request.getParameter("email");
        String bloodgroup = request.getParameter("bloodgroup");

        try (Connection con = DBConnection.getCon()) {
            String sql = "INSERT INTO donor (name, mobilenumber, email, bloodgroup) VALUES (?, ?, ?, ?)";
            PreparedStatement ps = con.prepareStatement(sql);
            ps.setString(1, name);
            ps.setString(2, mobilenumber);
            ps.setString(3, email);
            ps.setString(4, bloodgroup);

            int rows = ps.executeUpdate();

            if (rows > 0) {
                response.sendRedirect("donor.jsp?msg=valid"); // Changed to match JSP check
            } else {
                response.sendRedirect("donor.jsp?msg=invalid");
            }

        } catch (Exception e) {
            e.printStackTrace();
            response.sendRedirect("donor.jsp?msg=invalid");
        }
    }
}
