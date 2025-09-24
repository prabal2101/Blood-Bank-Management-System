<!doctype html>
<html lang="en">
<head>
  <meta charset="utf-8"/>
  <meta name="viewport" content="width=device-width, initial-scale=1"/>
  <title>Register | Blood Donation Management System</title>

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

    .register-card {
      width: 100%;
      max-width: 820px;
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
      padding: 2rem;
    }

    .hero-side h1 {
      margin: 0 0 0.6rem 0;
      color: var(--brand-red-dark);
      font-size: clamp(1.35rem, 2.8vw, 2.2rem);
    }

    .hero-side p {
      color: #555;
      line-height: 1.45;
    }

    .form-side {
      padding: 2rem;
      background: linear-gradient(180deg, rgba(255,255,255,0.98), rgba(255,255,255,0.95));
    }

    .form-title {
      font-weight:700;
      color:var(--brand-red-dark);
      margin-bottom:.5rem;
    }

    .form-sub {
      color:#666;
      margin-bottom:1rem;
      font-size:.95rem;
    }

    .form-control {
      border-radius:10px;
      padding: .8rem 1rem;
      border:1px solid rgba(0,0,0,0.08);
      box-shadow:none;
    }

    .btn-register {
      background: var(--brand-red);
      border: none;
      color: white;
      padding: .75rem 1rem;
      font-weight:700;
      border-radius:10px;
      box-shadow: 0 8px 24px rgba(211,47,47,0.12);
    }

    .btn-login {
      background: white;
      color: var(--brand-red-dark);
      border: 2px solid var(--brand-red);
      padding: .6rem 0.9rem;
      font-weight:700;
      border-radius:10px;
    }

    @media (max-width: 980px) {
      .register-card { grid-template-columns: 1fr; max-width: 640px; }
      .hero-side, .form-side { padding:1.2rem; }
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
    <div class="register-card" role="main" aria-labelledby="register-heading">
      <!-- LEFT: Info -->
      <div class="hero-side">
        <h1 id="register-heading">Blood Donation Management System</h1>
        <p>Register now to become a donor or create an account to request blood. Help save lives with just a few clicks.</p>
      </div>

      <!-- RIGHT: Form -->
      <div class="form-side">
        <div class="mb-3">
          <div class="form-title">Create your account</div>
          <div class="form-sub">Fill in the details below to get started</div>
        </div>

        <form method="post" action="RegisterServlet">
          <!-- Full Name -->
          <div class="mb-3">
            <label for="fullname" class="form-label">Full Name</label>
            <input id="fullname" name="fullname" type="text" class="form-control" placeholder="Enter your full name" required />
          </div>

          <!-- Username -->
          <div class="mb-3">
            <label for="username" class="form-label">Username</label>
            <input id="username" name="username" type="text" class="form-control" placeholder="Choose a username" required />
          </div>

          <!-- Email -->
          <div class="mb-3">
            <label for="email" class="form-label">Email</label>
            <input id="email" name="email" type="email" class="form-control" placeholder="Enter your email" required />
          </div>

          <!-- Mobile Number -->
          <div class="mb-3">
            <label for="mobile" class="form-label">Mobile Number</label>
            <input id="mobile" name="mobile" type="text" class="form-control" placeholder="Enter your mobile number" required />
          </div>

          <!-- Password -->
          <div class="mb-3">
            <label for="password" class="form-label">Password</label>
            <input id="password" name="password" type="password" class="form-control" placeholder="Enter password" required />
          </div>

          <!-- Confirm Password -->
          <div class="mb-3">
            <label for="confirmPassword" class="form-label">Confirm Password</label>
            <input id="confirmPassword" name="confirmPassword" type="password" class="form-control" placeholder="Re-enter password" required />
          </div>

          <!-- Blood Group -->
          <div class="mb-3">
            <label for="bloodgroup" class="form-label">Blood Group</label>
            <select id="bloodgroup" name="bloodgroup" class="form-control" required>
              <option value="" disabled selected>Select your blood group</option>
              <option>A+</option>
              <option>A-</option>
              <option>B+</option>
              <option>B-</option>
              <option>O+</option>
              <option>O-</option>
              <option>AB+</option>
              <option>AB-</option>
            </select>
          </div>

          <!-- City -->
          <div class="mb-3">
            <label for="city" class="form-label">City</label>
            <input id="city" name="city" type="text" class="form-control" placeholder="Enter your city" required />
          </div>

          <!-- Buttons -->
          <div class="d-grid gap-2 mb-3">
            <button type="submit" class="btn btn-register">Register</button>
            <a href="login.jsp" class="btn btn-login text-center">Login</a>
          </div>
        </form>
      </div>
    </div>
  </div>

  <!-- Bootstrap JS -->
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
