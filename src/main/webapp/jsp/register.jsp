<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Register - Vault</title>
  <link rel="stylesheet" href="../css/style.css">
</head>
<body>

<div class="container">
  <div class="card">

    <div class="brand">
      <span class="brand-dot"></span>
      Vault
    </div>

    <h2 style="text-align:center; margin-bottom:8px;">Create account</h2>
    <p style="text-align:center; color:var(--muted); font-size:0.88rem; margin-bottom:28px;">Your notes &amp; passwords, secured.</p>

    <form action="../register" method="post">

      <div class="form-group">
        <label for="email">Email</label>
        <input type="email" id="email" name="email" placeholder="you@example.com" required>
      </div>

      <div class="form-group">
        <label for="password">Password</label>
        <input type="password" id="password" name="password" placeholder="Create a strong password" required>
      </div>

      <button type="submit">Create Account</button>

    </form>

    <div class="auth-footer">
      Already have an account? <a href="login.jsp">Sign in</a>
    </div>

  </div>
</div>

</body>
</html>