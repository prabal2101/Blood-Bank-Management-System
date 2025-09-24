package controller;

import db.DBConnection;
import java.io.IOException;
import java.sql.*;
import java.util.ArrayList;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;

@WebServlet("/RequestHistoryServlet")
public class RequestHistoryServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String username = request.getParameter("username");  // or from session
        List<String[]> historyList = new ArrayList<>();

        try (Connection con = DBConnection.getCon()) {
            String sql = "SELECT name, mobilenumber, email, bloodgroup, status FROM bloodrequest WHERE username=? ORDER BY id DESC";
            PreparedStatement ps = con.prepareStatement(sql);
            ps.setString(1, username);
            ResultSet rs = ps.executeQuery();

            while (rs.next()) {
                String[] row = new String[5];
                row[0] = rs.getString("name");
                row[1] = rs.getString("mobilenumber");
                row[2] = rs.getString("email");
                row[3] = rs.getString("bloodgroup");
                row[4] = rs.getString("status");
                historyList.add(row);
            }

        } catch (Exception e) {
            e.printStackTrace();
        }

        request.setAttribute("historyList", historyList);
        request.getRequestDispatcher("requesthistory.jsp").forward(request, response);
    }
}
