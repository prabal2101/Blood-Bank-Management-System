<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.List"%>
<%@ page import="dto.BloodRequestDTO"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Request History - Blood Donation Management System</title>
    <style>
        body {
            margin: 0;
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            background: linear-gradient(135deg, #ffffff, #f7f7f7);
            overflow-x: hidden;
        }

        /* Floating blood drop background */
        .blood-drop {
            position: absolute;
            width: 50px;
            height: 50px;
            background: red;
            border-radius: 50% 50% 50% 0;
            transform: rotate(45deg);
            opacity: 0.08;
            animation: float 12s linear infinite;
        }
        .blood-drop:nth-child(1) { top: 15%; left: 10%; animation-delay: 0s; }
        .blood-drop:nth-child(2) { top: 50%; left: 80%; animation-delay: 3s; }
        .blood-drop:nth-child(3) { top: 70%; left: 30%; animation-delay: 6s; }

        @keyframes float {
            from { transform: translateY(0) rotate(45deg); }
            to { transform: translateY(-1000px) rotate(45deg); }
        }

        /* Navbar */
        .navbar {
            background: #d32f2f;
            padding: 15px 40px;
            display: flex;
            justify-content: space-between;
            align-items: center;
            color: white;
            box-shadow: 0 2px 10px rgba(0,0,0,0.1);
            position: sticky;
            top: 0;
            z-index: 1000;
        }
        .navbar h2 { margin: 0; font-size: 20px; }
        .navbar a {
            color: white;
            text-decoration: none;
            margin-left: 25px;
            font-weight: 500;
            transition: 0.3s;
        }
        .navbar a:hover { color: #ffe0e0; }

        /* Content */
        .container {
            max-width: 1100px;
            margin: 40px auto;
            background: white;
            padding: 30px;
            border-radius: 15px;
            box-shadow: 0 6px 18px rgba(0,0,0,0.1);
        }
        .container h3 {
            color: #d32f2f;
            margin-bottom: 20px;
            text-align: center;
            font-size: 24px;
        }

        /* History table */
        table {
            width: 100%;
            border-collapse: collapse;
            margin-top: 15px;
        }
        th, td {
            padding: 14px 18px;
            text-align: center;
            border-bottom: 1px solid #eee;
        }
        th {
            background: #f44336;
            color: white;
            font-size: 16px;
        }
        tr:hover {
            background: #fff5f5;
            transition: 0.3s;
        }

        /* Status badges */
        .status {
            padding: 6px 12px;
            border-radius: 20px;
            font-weight: 600;
            font-size: 13px;
        }
        .status.pending { background: #fff3cd; color: #856404; }
        .status.approved { background: #d4edda; color: #155724; }
        .status.rejected { background: #f8d7da; color: #721c24; }
    </style>
</head>
<body>

    <!-- Floating blood drops -->
    <div class="blood-drop"></div>
    <div class="blood-drop"></div>
    <div class="blood-drop"></div>

    <!-- Navbar -->
    <div class="navbar">
        <h2>Blood Donation Management</h2>
        <div>
            <a href="home.jsp">Home</a>
            <a href="donor.jsp">Donor</a>
            <a href="request.jsp">Request Blood</a>
           
            <a href="logout.jsp">Logout</a>
        </div>
    </div>

    <!-- Request History Section -->
    <div class="container">
        <h3>Your Blood Request History</h3>

        <table>
            <thead>
                <tr>
                    <th>Name</th>
                    <th>Mobile</th>
                    <th>Email</th>
                    <th>Blood Group</th>
                    <th>Status</th>
                </tr>
            </thead>
            <tbody>
                <%
                    List<BloodRequestDTO> historyList = (List<BloodRequestDTO>) request.getAttribute("historyList");
                    if (historyList != null && !historyList.isEmpty()) {
                        for (BloodRequestDTO br : historyList) {
                %>
                <tr>
                    <td><%= br.getName() %></td>
                    <td><%= br.getMobilenumber() %></td>
                    <td><%= br.getEmail() %></td>
                    <td><%= br.getBloodgroup() %></td>
                    <td>
                        <span class="status <%= br.getStatus().toLowerCase() %>">
                            <%= br.getStatus() %>
                        </span>
                    </td>
                </tr>
                <%
                        }
                    } else {
                %>
                <tr>
                    <td colspan="5">No request history found.</td>
                </tr>
                <% } %>
            </tbody>
        </table>
    </div>

</body>
</html>
