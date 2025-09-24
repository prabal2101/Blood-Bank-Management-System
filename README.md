
# 🩸 Blood Donation Management System ❤️

A **web-based application** to manage **blood donors**, **donation history**, and **blood requests**.
Built using **Java Servlets, JSP, and MySQL**, this project aims to make **blood donation tracking fast, easy, and organized**.
Whether you are a donor or a recipient, this system ensures **efficient blood management**. 💻🩹

Blood Donation Management System is a web app for tracking **donors, donation history, and blood requests**. Built with Java, JSP, and MySQL, it provides **real-time notifications, responsive UI, and organized data management** to ensure blood is available when needed. 🩸❤️

---

## ✨ Features

* 🧑‍🤝‍🧑 **Donor Registration** – Easy registration with name, email, mobile, and blood group.
* 📜 **Donation History** – View **all donors** and their donation history in a structured table.
* 🩹 **Blood Requests** – Users can request blood and get notified when a donor is available.
* 📩 **Notifications** – **Success/failure messages** displayed for every action.
* 💻 **Responsive UI** – Modern design with **animations**, mobile-friendly, and intuitive.
* 🔒 **Basic Security** – Input validations to ensure **accurate data entry**.
* 📊 **Admin Dashboard (Future)** – Manage donors, requests, and track statistics.

---

## 🛠️ Technology Stack

* **Backend:** Java (Servlets & JSP)
* **Database:** MySQL
* **Frontend:** HTML, CSS, JavaScript, Bootstrap
* **Server:** Apache Tomcat
* **Version Control:** Git & GitHub

---

## 🗄️ Database Schema

### `donor` Table

| Column       | Type         | Description         |
| ------------ | ------------ | ------------------- |
| id           | INT (PK, AI) | Unique donor ID     |
| name         | VARCHAR(200) | Donor full name     |
| mobilenumber | VARCHAR(15)  | Donor mobile number |
| email        | VARCHAR(200) | Donor email address |
| bloodgroup   | VARCHAR(10)  | Donor blood group   |

### `users` Table (Optional for login feature)

| Column       | Type         | Description                |
| ------------ | ------------ | -------------------------- |
| id           | INT (PK, AI) | Unique user ID             |
| fullname     | VARCHAR(200) | Full name of user          |
| username     | VARCHAR(100) | Username for login         |
| password     | VARCHAR(100) | User password              |
| email        | VARCHAR(200) | Email of user              |
| mobile       | VARCHAR(15)  | Mobile number              |
| blood\_group | VARCHAR(10)  | Blood group                |
| city         | VARCHAR(100) | City of residence          |
| role         | VARCHAR(50)  | Role (Admin/Donor/User)    |
| created\_at  | TIMESTAMP    | Account creation timestamp |

---

## 🚀 Setup Instructions

1. **Clone the repository**

```bash
git clone https://github.com/yourusername/blood-donation-management.git
```

2. **Database Setup**

   * Create a MySQL database named `blood_donation`
   * Import the `donor.sql` schema file

3. **Configure DB Connection**

   * Open `DBConnection.java` and update MySQL credentials

4. **Deploy on Tomcat**

   * Copy project to `webapps` folder
   * Start Tomcat and access the app:
     `http://localhost:8080/blood-donation-management/`

---

## 🖼️ Screenshots

* 🩸 **Donor Form** – Register donors with ease
* 📜 **Donation History** – Organized table view of all donors
* 🩹 **Request Blood Page** – Submit blood requests

*(Add screenshots in `WebContent/images/` and reference them here for GitHub display)*

---

## 🌟 Future Enhancements

* 🔑 **User Authentication & Roles** – Separate dashboards for Admin, Donor, and User
* 📧 **Email Notifications** – Notify donors & requesters when blood is available
* 📱 **Mobile App Integration** – Request blood from anywhere
* 📊 **Analytics Dashboard** – Track donation stats & popular blood groups
* 🔄 **Auto Reminders** – Remind donors for future donations
* 🧩 **Advanced Search** – Filter donors by blood group, city, or availability

---

## 🏗️ Project Structure

```
blood-donation-management/
│
├── src/
│   ├── controller/        # Servlets
│   ├── db/                # Database connection
│
├── WebContent/
│   ├── donor.jsp
│   ├── donorhistory.jsp
│   ├── request.jsp
│   ├── register.jsp
│   └── css, js, images/
│
├── README.md
└── donor.sql
```

---

## 📝 Author

**Prabal Chouhan**
GitHub: [@yourusername](https://github.com/yourusername)
Email: [your.email@example.com](mailto:your.email@example.com)

---

## ⚖️ License

This project is licensed under the **MIT License** – see the LICENSE file for details.

---

## 💌 Contact

⭐ **Star the repo** if you like it!
Open for contributions, suggestions, and collaborations.

---
