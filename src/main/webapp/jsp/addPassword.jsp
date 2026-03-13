<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Add Password - Vault</title>
  <link rel="stylesheet" href="../css/style.css">
</head>
<body>

<div class="container">
  <div class="card">

    <div class="page-header">
      <h2 style="margin-bottom:0;">Add Password</h2>
    </div>

    <form action="../addPassword" method="post">

      <div class="form-group">
        <label for="application">Application / Website</label>
        <input type="text" id="application" name="application" placeholder="e.g. GitHub, Gmail" required>
      </div>

      <div class="form-group">
        <label for="username">Username / Email</label>
        <input type="text" id="username" name="username" placeholder="your@email.com" required>
      </div>

      <div class="form-group">
        <label for="password">Password</label>
        <input type="text" id="password" name="password" placeholder="Enter password" required>
      </div>

      <button type="submit">Save Password</button>

    </form>

    <a href="dashboard.jsp" class="back-link">Back to Dashboard</a>

  </div>
</div>

</body>
</html>