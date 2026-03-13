<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Add Note - Vault</title>
  <link rel="stylesheet" href="../css/style.css">
</head>
<body>

<div class="container">
  <div class="card">

    <div class="page-header">
      <h2 style="margin-bottom:0;">Add Note</h2>
    </div>

    <form action="../addNote" method="post">

      <div class="form-group">
        <label for="title">Title</label>
        <input type="text" id="title" name="title" placeholder="Give your note a title" required>
      </div>

      <div class="form-group">
        <label for="content">Content</label>
        <textarea id="content" name="content" rows="6" placeholder="Write your note here..." required></textarea>
      </div>

      <button type="submit">Save Note</button>

    </form>

    <a href="dashboard.jsp" class="back-link">Back to Dashboard</a>

  </div>
</div>

</body>
</html>