<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Blood Donation Management System</title>

<!-- Google Fonts -->
<link href="https://fonts.googleapis.com/css2?family=Poppins:wght@400;600;700&display=swap" rel="stylesheet">

<style>
    body {
        font-family: 'Poppins', sans-serif;
        margin: 0;
        padding: 0;
        background: linear-gradient(135deg, #fff 0%, #ffe5e5 50%, #fff5f5 100%);
        overflow-x: hidden;
    }

    /* Animated blood drops */
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
        0% { transform: translateY(-60px) scale(1); opacity: 0.8; }
        70% { opacity: 1; }
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

    nav .search-bar {
        display: flex;
        gap: 10px;
    }

    nav input {
        padding: 8px 12px;
        border-radius: 6px;
        border: none;
        outline: none;
        font-size: 14px;
    }

    nav button {
        background: white;
        color: #e63946;
        border: none;
        font-weight: 600;
        padding: 8px 16px;
        border-radius: 6px;
        cursor: pointer;
        transition: 0.3s;
    }

    nav button:hover {
        background: #c1121f;
        color: white;
    }

    /* Container */
    .container {
        display: flex;
        justify-content: center;
        align-items: center;
        gap: 40px;
        margin: 100px auto;
        flex-wrap: wrap;
        max-width: 1100px;
        position: relative;
        z-index: 5;
    }

    /* Card */
    .card {
        background: white;
        border-radius: 20px;
        padding: 40px 30px;
        width: 340px;
        text-align: center;
        box-shadow: 0 10px 30px rgba(230,57,70,0.2);
        transition: all 0.3s ease;
        border: 2px solid #ffe5e5;
        position: relative;
        overflow: hidden;
    }

    .card:hover {
        transform: translateY(-8px);
        box-shadow: 0 15px 35px rgba(230,57,70,0.3);
    }

    .card h2 {
        font-size: 22px;
        margin-bottom: 15px;
        font-weight: 600;
        color: #c1121f;
    }

    .card p {
        font-size: 14px;
        margin-bottom: 25px;
        color: #444;
    }

    /* Buttons */
    .btn {
        display: inline-block;
        padding: 12px 25px;
        font-size: 15px;
        font-weight: 600;
        border-radius: 8px;
        text-decoration: none;
        transition: all 0.3s ease-in-out;
    }

    .btn-request {
        background: white;
        border: 2px solid #e63946;
        color: #e63946;
    }

    .btn-request:hover {
        background: #e63946;
        color: white;
    }

    .btn-donate {
        background: linear-gradient(135deg, #e63946, #c1121f);
        color: white;
        border: none;
    }

    .btn-donate:hover {
        background: linear-gradient(135deg, #c1121f, #e63946);
    }

    /* Responsive */
    @media (max-width: 768px) {
        nav { flex-direction: column; gap: 10px; }
        nav .search-bar { flex-direction: column; }
        .container { flex-direction: column; }
    }
</style>
</head>
<body>

    <!-- Animated Drops -->
    <div class="blood-drop" style="left:10%; animation-delay:0s;"></div>
    <div class="blood-drop" style="left:30%; animation-delay:2s;"></div>
    <div class="blood-drop" style="left:60%; animation-delay:4s;"></div>
    <div class="blood-drop" style="left:80%; animation-delay:6s;"></div>

    <!-- Navigation Bar -->
    <nav>
        <div class="logo">Blood Donation Management System</div>
        
        <ul>
            
            <li><a href="requesthistory.jsp">Request History</a></li>
            <li><a href="donorhistory.jsp">Donate History</a></li>
          
            <li><a href="logout.jsp">Logout</a></li>
        </ul>
    </nav>

    <!-- Main Section with Cards -->
    <div class="container">

        <!-- Request Blood Card -->
        <div class="card">
            <h2>Need Blood?</h2>
            <p>Submit a request and we’ll connect you with available donors quickly.</p>
            <a href="request.jsp" class="btn btn-request">Request Blood</a>
        </div>

        <!-- Donate Blood Card -->
        <div class="card">
            <h2>Want to Donate?</h2>
            <p>Become a life saver by donating blood. Your small step saves lives.</p>
            <a href="donor.jsp" class="btn btn-donate">Donate Blood</a>
        </div>

    </div>

</body>
</html>
