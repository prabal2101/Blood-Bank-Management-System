<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.util.ArrayList" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Donor History | Blood Donation Management</title>
    <style>
        body {
            margin: 0;
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            background: linear-gradient(to right, #fff, #f5f5f5);
            overflow-x: hidden;
        }

        /* Floating blood drops */
        .blood-drop {
            position: absolute;
            width: 18px;
            height: 28px;
            background: #e63946;
            border-radius: 50% 50% 50% 50% / 60% 60% 40% 40%;
            opacity: 0.6;
            animation: float 6s infinite ease-in-out;
        }

        .blood-drop:nth-child(1) { left: 10%; animation-duration: 7s; }
        .blood-drop:nth-child(2) { left: 30%; animation-duration: 5s; }
        .blood-drop:nth-child(3) { left: 50%; animation-duration: 6s; }
        .blood-drop:nth-child(4) { left: 70%; animation-duration: 8s; }
        .blood-drop:nth-child(5) { left: 90%; animation-duration: 9s; }

        @keyframes float {
            0% { top: 100%; transform: translateY(0) scale(1); }
            50% { transform: translateY(-50vh) scale(1.2); opacity: 0.8; }
            100% { top: -10%; transform: translateY(0) scale(1); opacity: 0.6; }
        }

        /* Navbar */
        .navbar {
            display: flex;
            justify-content: space-between;
            align-items: center;
            background: #e63946;
            padding: 15px 50px;
            color: white;
            font-weight: bold;
            box-shadow: 0 2px 6px rgba(0,0,0,0.2);
            position: sticky;
            top: 0;
            z-index: 1000;
        }
        .navbar a {
            color: white;
            text-decoration: none;
            margin: 0 18px;
            transition: 0.3s;
        }
        .navbar a:hover {
            text-decoration: underline;
        }

        /* Container */
        .container {
            max-width: 1000px;
            margin: 80px auto;
            padding: 20px;
            background: white;
            border-radius: 16px;
            box-shadow: 0 6px 20px rgba(0,0,0,0.15);
            position: relative;
            z-index: 1;
        }
        .container h2 {
            text-align: center;
            color: #e63946;
            margin-bottom: 30px;
        }

        /* Table */
        table {
            width: 100%;
            border-collapse: collapse;
            border-radius: 12px;
            overflow: hidden;
        }
        table thead {
            background: #e63946;
            color: white;
        }
        table th, table td {
            padding: 14px;
            text-align: center;
        }
        table tr:nth-child(even) {
            background: #f9f9f9;
        }
        table tr:hover {
            background: #ffe5e5;
        }

        /* Icons */
        .icon {
            margin-right: 6px;
            color: #e63946;
            font-weight: bold;
        }
    </style>
</head>
<body>
    <!-- Floating drops -->
    <div class="blood-drop"></div>
    <div class="blood-drop"></div>
    <div class="blood-drop"></div>
    <div class="blood-drop"></div>
    <div class="blood-drop"></div>

    <!-- Navbar -->
    <div class="navbar">
        <div class="logo">❤️ Blood Donation</div>
        <div>
            <a href="home.jsp">Home</a>
            <a href="donor.jsp">Donor</a>
            <a href="request.jsp">Request Blood</a>
            <a href="logout.jsp">Logout</a>
        </div>
    </div>

    <!-- Donor History Section -->
    <div class="container">
        <h2>Donor History</h2>
        <table>
            <thead>
                <tr>
                    <th><span class="icon">👤</span>Name</th>
                    <th><span class="icon">📧</span>Email</th>
                    <th><span class="icon">📞</span>Mobile</th>
                    <th><span class="icon">🩸</span>Blood Group</th>
                </tr>
            </thead>
            <tbody>
            <%
                // Retrieve the donor list from request attribute
                ArrayList<String[]> donorList = (ArrayList<String[]>) request.getAttribute("donorList");
                if (donorList != null && !donorList.isEmpty()) {
                    for (String[] donor : donorList) {
            %>
                <tr>
                    <td><%= donor[0] %></td>
                    <td><%= donor[2] %></td>
                    <td><%= donor[1] %></td>
                    <td><%= donor[3] %></td>
                </tr>
            <%
                    }
                } else {
            %>
                <tr>
                    <td colspan="4">No donors found.</td>
                </tr>
            <%
                }
            %>
            </tbody>
        </table>
    </div>
</body>
</html>
