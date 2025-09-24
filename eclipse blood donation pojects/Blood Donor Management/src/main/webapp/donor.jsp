<%@ page language="java" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Donor Dashboard</title>

    <!-- Google Fonts -->
    <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@400;600;700&display=swap" rel="stylesheet">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">

    <style>
        body {
            font-family: 'Poppins', sans-serif;
            margin: 0;
            padding: 0;
            background: linear-gradient(135deg, #fff 0%, #ffe5e5 50%, #fff5f5 100%);
            overflow-x: hidden;
        }

        /* Blood Drops */
        .blood-drop {
            position: fixed;
            top: -60px;
            width: 25px;
            height: 25px;
            background: #e63946;
            border-radius: 50% 50% 60% 60%;
            animation: drop 6s linear infinite;
            opacity: 0.8;
            z-index: 0;
        }

        @keyframes drop {
            0%   { transform: translateY(-60px) scale(1); opacity: 0.8; }
            70%  { opacity: 1; }
            100% { transform: translateY(120vh) scale(0.9); opacity: 0; }
        }

        /* Navbar */
        nav {
            display: flex;
            justify-content: space-between;
            align-items: center;
            background: #e63946;
            padding: 15px 30px;
            box-shadow: 0 4px 15px rgba(0,0,0,0.2);
            position: relative;
            z-index: 10;
        }

        nav .logo {
            font-size: 22px;
            font-weight: 700;
            color: white;
        }

        nav ul {
            list-style: none;
            display: flex;
            gap: 20px;
            margin: 0;
            padding: 0;
        }

        nav ul li a {
            color: white;
            text-decoration: none;
            font-weight: 600;
            transition: 0.3s;
        }

        nav ul li a:hover {
            color: #ffd1d1;
        }

        /* Form Card */
        .form-container {
            max-width: 600px;
            margin: 50px auto;
            background-color: white;
            border-radius: 20px;
            padding: 40px 30px;
            box-shadow: 0 15px 30px rgba(0,0,0,0.2);
            border: 2px solid #ffe5e5;
            position: relative;
            z-index: 5;
            transition: transform 0.3s, box-shadow 0.3s;
        }

        .form-container:hover {
            transform: translateY(-5px);
            box-shadow: 0 20px 40px rgba(0,0,0,0.25);
        }

        .form-container h2 {
            color: #c1121f;
            text-align: center;
            margin-bottom: 25px;
        }

        .form-container input,
        .form-container select {
            width: 100%;
            padding: 12px;
            margin-bottom: 15px;
            border-radius: 10px;
            border: 1px solid #ccc;
            font-size: 15px;
            outline: none;
            transition: 0.3s;
        }

        .form-container input:focus,
        .form-container select:focus {
            border-color: #c1121f;
            box-shadow: 0 0 6px rgba(193,18,31,0.3);
        }

        .form-container button {
            width: 100%;
            padding: 14px;
            font-size: 16px;
            font-weight: 600;
            border: none;
            border-radius: 10px;
            background: linear-gradient(135deg, #e63946, #c1121f);
            color: white;
            cursor: pointer;
            transition: 0.3s;
        }

        .form-container button:hover {
            background: linear-gradient(135deg, #c1121f, #e63946);
        }

        /* Action Cards */
        .action-cards {
            display: flex;
            justify-content: center;
            flex-wrap: wrap;
            gap: 20px;
            margin-top: 30px;
        }

        .card {
            background-color: white;
            border-radius: 15px;
            box-shadow: 0 8px 20px rgba(0,0,0,0.2);
            padding: 30px 25px;
            width: 250px;
            cursor: pointer;
            transition: transform 0.3s, box-shadow 0.3s;
            text-align: center;
        }

        .card:hover {
            transform: translateY(-10px);
            box-shadow: 0 15px 30px rgba(0,0,0,0.3);
        }

        .card i {
            font-size: 3rem;
            color: #c1121f;
            margin-bottom: 15px;
        }

        .card h3 {
            font-size: 1.4rem;
            margin-bottom: 10px;
            color: #c1121f;
        }

        .card p {
            font-size: 1rem;
            color: #555;
            margin-bottom: 15px;
        }

        .card button {
            border: 2px solid #c1121f;
            padding: 10px 20px;
            border-radius: 8px;
            font-weight: bold;
            cursor: pointer;
            background: none;
            color: #c1121f;
            transition: all 0.3s;
        }

        .card button:hover {
            background-color: #c1121f;
            color: white;
        }

        @media (max-width: 700px) {
            .action-cards {
                flex-direction: column;
                align-items: center;
            }
        }

        /* Message */
        .message {
            text-align: center;
            margin-bottom: 20px;
            font-size: 1.1rem;
            color: green;
        }

    </style>
</head>
<body>

    <!-- Blood Drops Animation -->
    <div class="blood-drop" style="left: 15%; animation-delay: 0s;"></div>
    <div class="blood-drop" style="left: 40%; animation-delay: 2s;"></div>
    <div class="blood-drop" style="left: 70%; animation-delay: 4s;"></div>

    <!-- Navbar -->
    <nav>
        <div class="logo">Donor Dashboard</div>
        <ul>
         
            <li><a href="donorhistory.jsp">Donation History</a></li>
            <li><a href="logout.html">Logout</a></li>
        </ul>
    </nav>

    <!-- Main Content -->
    <div class="content">

        <% 
String msg = request.getParameter("msg");
if("success".equals(msg)) {
%>
    <div class="message">Form Submitted Successfully. You will get notified within 6 Hours!</div>
<% } else if("failed".equals(msg)) { %>
    <div class="message" style="color:red;">Invalid Data! Try Again</div>
<% } else if("error".equals(msg)) { %>
    <div class="message" style="color:red;">Something went wrong! Try again later.</div>
<% } %>


        <!-- Form Card -->
        <div class="form-container">
            <h2>Donate Blood</h2>
           <form action="DonorServlet" method="post">

                <input type="text" name="name" placeholder="Enter Name" required>
                <input type="text" name="mobilenumber" placeholder="Enter Mobile-Number" required>
                <input type="email" name="email" placeholder="Enter Email Address" required>
                <select name="bloodgroup" required>
                    <option value="" disabled selected>Select Blood Group</option>
                    <option>A+</option>
                    <option>A-</option>
                    <option>B+</option>
                    <option>B-</option>
                    <option>O+</option>
                    <option>O-</option>
                    <option>AB+</option>
                    <option>AB-</option>
                </select>
                <button type="submit">Submit</button>
            </form>


        <!-- Action Cards -->
        <div class="action-cards">
            <div class="card" onclick="location.href='request.jsp'">
                <i class="fa fa-tint"></i>
                <h3>Request Blood</h3>
                <p>Need blood? You can request it now!</p>
                <button>Request Now</button>
            </div>
        </div>
        </div>
    </div>

</body>
</html>
