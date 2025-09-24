<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!doctype html>
<html lang="en">
<head>
  <meta charset="utf-8"/>
  <meta name="viewport" content="width=device-width, initial-scale=1"/>
  <title>Login | Blood Donation Management System</title>

  <!-- Bootstrap -->
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">

  <style>
    :root {
      --brand-red: #d32f2f;
      --brand-red-dark: #b71c1c;
      --bg-gray: #f4f5f7;
      --card-radius: 14px;
    }

    html, body {
      height: 100%;
      margin: 0;
      font-family: "Segoe UI", Roboto, "Helvetica Neue", Arial, sans-serif;
      background: linear-gradient(180deg, #ffffff 0%, #fbfbfc 40%, var(--bg-gray) 100%);
    }

    .bg-abstract {
      position: fixed;
      inset: 0;
      z-index: 0;
      background-image:
        radial-gradient(circle at 10% 20%, rgba(211,47,47,0.12), transparent 12%),
        radial-gradient(circle at 85% 80%, rgba(129,50,200,0.06), transparent 12%),
        linear-gradient(135deg, rgba(244,67,54,0.04), rgba(6, 86, 147, 0.02));
      filter: blur(22px) saturate(1.05);
      pointer-events: none;
    }

    .page-wrap {
      position: relative;
      z-index: 2;
      min-height: 100vh;
      display: flex;
      align-items: center;
      justify-content: center;
      padding: 2rem;
    }

    .login-card {
      width: 100%;
      max-width: 980px;
      display: grid;
      grid-template-columns: 1fr 420px;
      gap: 2rem;
      align-items: center;
      background: rgba(255,255,255,0.9);
      border-radius: var(--card-radius);
      box-shadow: 0 20px 50px rgba(12,12,12,0.08);
      overflow: hidden;
      border: 1px solid rgba(0,0,0,0.04);
    }

    .hero-side {
      padding: 2.2rem;
      background: linear-gradient(180deg, rgba(255,255,255,0.7), rgba(255,255,255,0.85));
    }

    .hero-side h1 {
      margin: 0 0 0.6rem 0;
      color: var(--brand-red-dark);
      font-size: clamp(1.35rem, 2.8vw, 2.2rem);
    }

    .hero-side p { color: #555; margin-bottom: 1.2rem; line-height: 1.45; }

    .hero-illustration { display: flex; gap: 0.8rem; flex-wrap: wrap; margin-top: 1rem; }

    .hero-pill {
      display:flex; gap:.6rem; align-items:center;
      padding:.6rem 0.9rem; border-radius:12px;
      background: linear-gradient(135deg, rgba(211,47,47,0.09), rgba(129,50,200,0.03));
      border:1px solid rgba(0,0,0,0.03);
      color:var(--brand-red-dark); font-weight:600;
    }

    .form-side { padding: 2rem; background: linear-gradient(180deg, rgba(255,255,255,0.98), rgba(255,255,255,0.95)); }
    .form-title { font-weight:700; color:var(--brand-red-dark); margin-bottom:.2rem; }
    .form-sub { color:#666; margin-bottom:1rem; font-size:.95rem; }

    .form-control { border-radius:10px; padding:.8rem 1rem; border:1px solid rgba(0,0,0,0.08); }
    .btn-login { background: var(--brand-red); border: none; color: white; padding:.75rem 1rem; font-weight:700; border-radius:10px; box-shadow: 0 8px 24px rgba(211,47,47,0.12); }
    .btn-register { background:white; color:var(--brand-red-dark); border:2px solid var(--brand-red); padding:.6rem 0.9rem; font-weight:700; border-radius:10px; }
    .helper-row { display:flex; justify-content:space-between; align-items:center; gap:.5rem; margin:.6rem 0 1rem; color:#666; font-size:.95rem; }
    .forgot-link { color:var(--brand-red-dark); text-decoration:none; font-weight:600; }
    .forgot-link:hover{ text-decoration:underline; }

    @media (max-width: 980px) {
      .login-card { grid-template-columns: 1fr; max-width: 680px; }
      .hero-side, .form-side { padding:1.4rem; }
    }
    @media (max-width: 480px) {
      .page-wrap { padding:1rem; }
      .hero-side h1 { font-size:1.2rem; }
      .form-side { padding:1rem; }
    }
  </style>
</head>
<body>
  <div class="bg-abstract" aria-hidden="true"></div>

  <div class="page-wrap">
    <div class="login-card" role="main" aria-labelledby="login-heading">
      
      <!-- LEFT SIDE -->
      <div class="hero-side">
        <h1 id="login-heading">Blood Donation Management System</h1>
        <p>Welcome! Sign in to access donor management, requests, and donation history. If you are new, please register to become a donor or requester.</p>
        <div class="hero-illustration">
          <div class="hero-pill">Request Blood</div>
          <div class="hero-pill">Check Availability</div>
        </div>
      </div>

      <!-- RIGHT SIDE -->
      <div class="form-side">

        <%-- ✅ Show messages based on ?msg=... --%>
        <%
          String msg = request.getParameter("msg");
          if (msg != null) {
        %>
          <div class="alert <%= msg.equals("registered") ? "alert-success" : "alert-danger" %>" role="alert">
            <%
              if (msg.equals("registered")) { out.print("Registration successful! Please login."); }
              else if (msg.equals("invalid")) { out.print("Invalid username or password."); }
              else if (msg.equals("password_mismatch")) { out.print("Passwords do not match."); }
              else if (msg.equals("error")) { out.print("Something went wrong. Try again."); }
            %>
          </div>
        <% } %>

        <div class="mb-3">
          <div class="form-title">Sign in to your account</div>
          <div class="form-sub">Enter your credentials to continue</div>
        </div>

        <!-- ✅ Login form -->
        <form method="post" action="LoginCredentialServlet">
          <div class="mb-3">
            <label for="username" class="form-label">Username</label>
            <input id="username" name="username" type="text" class="form-control" placeholder="you@example.com" required />
          </div>

          <div class="mb-3">
            <label for="password" class="form-label">Password</label>
            <input id="password" name="password" type="password" class="form-control" placeholder="Enter your password" required />
          </div>

         

          <!-- ✅ FIXED SUBMIT BUTTON -->
          <div class="d-grid gap-2 mb-3">
            <button type="submit" class="btn btn-login">Login</button>
            <a href="register.jsp" class="btn btn-register text-center">Register</a>
          </div>
        </form>

        <div class="text-muted" style="font-size:.9rem;">Secure sign in — trusted for donors and hospitals.</div>
      </div>
    </div>
  </div>

  <!-- Bootstrap JS -->
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
