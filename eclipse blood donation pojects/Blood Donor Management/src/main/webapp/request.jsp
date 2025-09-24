<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Blood Donation Management System</title>
<link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css" rel="stylesheet">
<style>
    * {margin:0; padding:0; box-sizing:border-box; font-family:'Arial', sans-serif;}

    body {
        background: linear-gradient(to right, #ffe5e5, #ffffff);
        min-height: 100vh;
        overflow-x: hidden;
    }

    .drop {
        position: absolute;
        width: 15px;
        height: 15px;
        background: #c62828;
        border-radius: 50%;
        opacity: 0.6;
        animation: float 8s linear infinite;
    }
    @keyframes float {
        0% { transform: translateY(100vh) rotate(0deg); }
        100% { transform: translateY(-10vh) rotate(360deg); }
    }

    nav {
        background-color: #c62828;
        padding: 15px 30px;
        display: flex;
        justify-content: space-between;
        align-items: center;
        box-shadow: 0 5px 15px rgba(0,0,0,0.2);
        position: relative;
        z-index: 2;
    }
    nav .logo {font-size: 20px; font-weight: bold; color: #fff;}
    nav ul {list-style: none; display: flex; gap: 20px;}
    nav ul li a {
        color: #fff; text-decoration: none; font-weight: bold;
        padding: 8px 16px; border-radius: 5px;
        transition: all 0.3s ease;
    }
    nav ul li a:hover {background-color: #b71c1c; transform: scale(1.05);}

    header {text-align: center; padding: 40px 20px; color: #c62828;}
    header h1 {
        font-size: 2.5rem;
        background: linear-gradient(90deg, #c62828, #ff5252);
        -webkit-background-clip: text;
        -webkit-text-fill-color: transparent;
    }

    .content {
        max-width: 800px;
        margin: 30px auto;
        padding: 30px;
        background: rgba(255,255,255,0.95);
        border-radius: 20px;
        box-shadow: 0 10px 25px rgba(0,0,0,0.2);
        text-align: center;
        position: relative;
        z-index: 2;
    }
    .content h2 { color:#c62828; margin-bottom: 20px; }

    form label {
        display: block;
        text-align: left;
        margin: 10px 5% 5px;
        font-weight: bold;
        color: #c62828;
    }
    form input, form select {
        width: 90%;
        padding: 12px;
        margin: 8px 0 15px;
        border-radius: 8px;
        border: 1px solid #ccc;
        font-size: 1rem;
    }
    form button {
        background-color: #c62828;
        color: white;
        border: none;
        padding: 12px 25px;
        border-radius: 8px;
        font-size: 1rem;
        cursor: pointer;
        transition: background 0.3s;
    }
    form button:hover { background-color: #b71c1c; }
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
        padding: 40px 30px;
        width: 250px;
        cursor: pointer;
        transition: transform 0.3s, box-shadow 0.3s;
        text-align: center;
        animation: floatCard 1.5s ease forwards;
    }
    .card:hover {
        transform: translateY(-10px);
        box-shadow: 0 15px 30px rgba(0,0,0,0.3);
    }
    @keyframes floatCard {
        0% { transform: translateY(20px); opacity: 0; }
        100% { transform: translateY(0); opacity: 1; }
    }

    .card i {
        font-size: 3rem;
        color: #c62828;
        margin-bottom: 15px;
    }
    .card h3 {
        font-size: 1.5rem;
        margin-bottom: 10px;
        color: #c62828;
    }
    .card p {
        font-size: 1rem;
        color: #555;
        margin-bottom: 15px;
    }
    .card button {
        border: 2px solid #c62828;
        padding: 10px 20px;
        border-radius: 8px;
        font-weight: bold;
        cursor: pointer;
        background: none;
        color: #c62828;
        transition: all 0.3s;
    }
    .card button:hover {
        background-color: #c62828;
        color: white;
    }

    /* Responsive */
    @media (max-width: 700px) {
        .action-cards {
            flex-direction: column;
            align-items: center;
        }
    }
    

    .message {color: red; font-size: 1.2rem; margin-bottom: 15px;}
</style>
</head>
<body>

<!-- Floating Drops -->
<% for(int i=0; i<15; i++){ %>
    <div class="drop" style="left:<%= (int)(Math.random()*100) %>vw; animation-duration:<%= 5 + (int)(Math.random()*5) %>s;"></div>
<% } %>

<!-- Navbar -->
<nav>
    <div class="logo">Blood Donation Management System</div>
    <ul>
      
        <li><a href="requesthistory.jsp">Request History</a></li>
        <li><a href="logout.html">Logout</a></li>
    </ul>
</nav>

<!-- Header -->
<header>
    <h1>Request Blood</h1>
    <p>Saving lives, one drop at a time!</p>
</header>

<!-- Main Content -->
<div class="content">
    <% String msg=request.getParameter("msg"); if("valid".equals(msg)) { %>
        <div class="message">Form Submitted Successfully. You will get notified soon!</div>
    <% } else if("invalid".equals(msg)) { %>
        <div class="message">Invalid Data! Try Again</div>
    <% } %>

    <h2>Enter Your Details</h2>
    <form action="bloodRequest" method="post">
    <label for="name">Full Name</label>
    <input type="text" id="name" name="name" required>

    <label for="mobilenumber">Mobile Number</label>
    <input type="text" id="mobilenumber" name="mobilenumber" required>

    <label for="email">Email</label>
    <input type="email" id="email" name="email" required>

    <label for="bloodgroup">Blood Group</label>
    <select id="bloodgroup" name="bloodgroup" required>
        <option value="" disabled selected>Select Blood Group</option>
        <option>A+</option><option>A-</option>
        <option>B+</option><option>B-</option>
        <option>O+</option><option>O-</option>
        <option>AB+</option><option>AB-</option>
    </select>

    <button type="submit">Submit Request</button>
</form>

    
    <!-- Action Cards -->
    <div class="action-cards">
        <div class="card" onclick="location.href='donor.jsp'">
            <i class="fa fa-tint"></i>
            <h3>Donate Blood</h3>
            <p>Become a hero. Donate blood and save lives today!</p>
            <button>Donate Now</button>
        </div>
        
    
</div>

</body>
</html>
