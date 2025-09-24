package controller;

import db.DBConnection;
import java.io.IOException;
import java.sql.*;
import java.util.ArrayList;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import dto.DonorDTO;

@WebServlet("/DonorHistoryServlet")
public class DonorHistoryServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        ArrayList<DonorDTO> donorList = new ArrayList<>();

        try (Connection con = DBConnection.getCon()) {
            String sql = "SELECT * FROM donor ORDER BY id DESC";
            PreparedStatement ps = con.prepareStatement(sql);
            ResultSet rs = ps.executeQuery();

            while (rs.next()) {
                DonorDTO donor = new DonorDTO();
                donor.setName(rs.getString("name"));
                donor.setMobilenumber(rs.getString("mobilenumber"));
                donor.setEmail(rs.getString("email"));
                donor.setBloodgroup(rs.getString("bloodgroup"));
                donorList.add(donor);
            }

        } catch (Exception e) {
            e.printStackTrace();
        }

        request.setAttribute("donorList", donorList);
        request.getRequestDispatcher("donorhistory.jsp").forward(request, response);
    }
}
