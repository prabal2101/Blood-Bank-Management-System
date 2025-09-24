# Blood-Bank-Management-System
🩸 Blood Donation Management System ❤️ – A web app to register donors, track donation history, and request blood easily. Built with Java, JSP, and MySQL, featuring a responsive design, notifications, and an organized dashboard for smooth blood donation management. 🧑‍🤝‍🧑💉📜
Absolutely! Let’s make your README longer, more detailed, and even more visually appealing with emojis. Here’s an expanded version for your GitHub repository:

#🩸 Blood Donation Management System ❤️

A web-based application to manage blood donors, donation history, and blood requests.
Built with Java Servlets, JSP, and MySQL, it aims to make blood donation tracking fast, easy, and organized. 💻🩹

✨ Features

🧑‍🤝‍🧑 Donor Registration
Users can register as donors with name, email, mobile number, and blood group.

📜 Donation History
View all registered donors and their donation history in a clean, organized table.

🩹 Blood Requests
Users can request blood and get notifications when a donor is available.

📩 Notifications
Confirmation messages for successful donations or requests.

💻 Responsive UI
Modern, animated, and mobile-friendly interface.

🔒 Simple Security
Basic validation to ensure accurate data entry.

🛠️ Technology Stack

Backend: Java (Servlets & JSP)

Database: MySQL

Frontend: HTML, CSS, JavaScript, Bootstrap

Server: Apache Tomcat

Version Control: Git & GitHub

🗄️ Database Schema
donor Table
Column	Type	Description
id	INT (PK, AI)	Unique donor ID
name	VARCHAR(200)	Donor full name
mobilenumber	VARCHAR(15)	Donor mobile number
email	VARCHAR(200)	Donor email address
bloodgroup	VARCHAR(10)	Donor blood group
users Table (Optional for login feature)
Column	Type	Description
id	INT (PK, AI)	Unique user ID
fullname	VARCHAR(200)	Full name of user
username	VARCHAR(100)	Username for login
password	VARCHAR(100)	User password
email	VARCHAR(200)	Email of user
mobile	VARCHAR(15)	Mobile number
blood_group	VARCHAR(10)	Blood group
city	VARCHAR(100)	City of residence
role	VARCHAR(50)	Role (Admin/Donor/User)
created_at	TIMESTAMP	Account creation timestamp
🚀 Setup Instructions

Clone the repository

git clone https://github.com/yourusername/blood-donation-management.git


Database Setup

Create a MySQL database named blood_donation

Import the donor.sql schema file

Configure DB Connection

Open DBConnection.java and update MySQL credentials

Deploy on Tomcat

Copy project to webapps folder

Start Tomcat and access the app:
http://localhost:8080/blood-donation-management/

🖼️ Screenshots

🩸 Donor Form

📜 Donation History

🩹 Request Blood Page

(Add your screenshots in WebContent/images/ and reference them here for GitHub display)

🌟 Future Enhancements

🔑 User Authentication & Roles – Admin, Donor, General User dashboards

📧 Email Notifications – Alert donors/requesters when blood is available

📱 Mobile App Integration – Request blood on-the-go

📊 Analytics Dashboard – Donation stats & active donors

🔄 Auto Reminders – Remind donors for future donations

🏗️ Project Structure
blood-donation-management/
│
├── src/
│   ├── controller/        # Servlets
│   ├── db/                # Database connection
├── WebContent/
│   ├── donor.jsp
│   ├── donorhistory.jsp
│   ├── request.jsp
│   ├── register.jsp
│   └── css, js, images/
│
├── README.md
└── donor.sql

📝 Author

Prabal Chouhan
GitHub: @yourusername

Email: your.email@example.com

⚖️ License

This project is licensed under the MIT License – see the LICENSE file for details.

💌 Contact

⭐ Star the repo if you like it!
Open for contributions, suggestions, and collaborations.
