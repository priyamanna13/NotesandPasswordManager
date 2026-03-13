<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Login - Vault</title>
  <link rel="stylesheet" href="../css/style.css">
</head>
<body>

<div class="container">
  <div class="card">

    <div class="brand">
      <span class="brand-dot"></span>
      Vault
    </div>

    <h2 style="text-align:center; margin-bottom:8px;">Welcome back</h2>
    <p style="text-align:center; color:var(--muted); font-size:0.88rem; margin-bottom:28px;">Sign in to your account</p>

    <form action="../login" method="post">

      <div class="form-group">
        <label for="email">Email</label>
        <input type="email" id="email" name="email" placeholder="you@example.com" required>
      </div>

      <div class="form-group">
        <label for="password">Password</label>
        <input type="password" id="password" name="password" placeholder="Enter your password" required>
      </div>

      <button type="submit">Sign In</button>

    </form>

    <div class="auth-footer">
      Don't have an account? <a href="register.jsp">Register here</a>
    </div>

  </div>
</div>

</body>
</html>