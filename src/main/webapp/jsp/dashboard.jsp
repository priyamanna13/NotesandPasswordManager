<%@ page import="model.User" %>
<%
User user = (User) session.getAttribute("user");
if(user == null){ response.sendRedirect("login.jsp"); return; }
String email = user.getEmail();
String displayName = email.contains("@") ? email.substring(0, email.indexOf("@")) : email;
%>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Dashboard - Vault</title>
  <link rel="stylesheet" href="../css/style.css">
</head>
<body>

<div class="dashboard-wrapper">

  <div class="brand" style="justify-content:flex-start; margin-bottom:48px;">
    <span class="brand-dot"></span>
    Vault
  </div>

  <div class="dashboard-greeting">
    <div class="label">Signed in as <%= email %></div>
    <h1>Hello, <%= displayName %></h1>
  </div>

  <div class="nav-grid">

    <a href="addNote.jsp" class="nav-card">
      <span class="nav-label">Add Note</span>
      <span class="nav-desc">Write a new note</span>
    </a>

    <a href="viewNotes.jsp" class="nav-card">
      <span class="nav-label">My Notes</span>
      <span class="nav-desc">Browse &amp; manage notes</span>
    </a>

    <a href="addPassword.jsp" class="nav-card">
      <span class="nav-label">Add Password</span>
      <span class="nav-desc">Save new credentials</span>
    </a>

    <a href="viewPasswords.jsp" class="nav-card">
      <span class="nav-label">My Passwords</span>
      <span class="nav-desc">View saved credentials</span>
    </a>

    <a href="../logout" class="nav-card nav-card-logout">
      Sign out
    </a>

  </div>

</div>

</body>
</html>