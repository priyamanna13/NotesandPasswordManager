<%@ page import="java.util.*,dao.PasswordDAO,model.PasswordEntry,model.User" %>
<%
User user = (User) session.getAttribute("user");
if(user == null){ response.sendRedirect("login.jsp"); return; }
PasswordDAO dao = new PasswordDAO();
List<PasswordEntry> list = dao.getPasswordsByUser(user.getId());
%>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>My Passwords - Vault</title>
  <link rel="stylesheet" href="../css/style.css">
</head>
<body>

<div class="container-wide">
  <div class="card">

    <div class="page-header">
      <h2 style="margin-bottom:0;">My Passwords</h2>
      <a href="addPassword.jsp" class="btn" style="width:auto; padding:9px 18px; font-size:0.88rem;">+ New Password</a>
    </div>

    <% if(list == null || list.isEmpty()){ %>
      <div class="empty-state">
        <p>No passwords saved yet. <a href="addPassword.jsp">Add your first one.</a></p>
      </div>
    <% } else { %>
      <div class="table-wrap">
        <table>
          <thead>
            <tr>
              <th>Application</th>
              <th>Username</th>
              <th>Password</th>
              <th style="width:160px">Actions</th>
            </tr>
          </thead>
          <tbody>
            <% for(PasswordEntry p : list){ %>
            <tr>
              <td><strong><%= p.getApplication() %></strong></td>
              <td style="color:var(--muted)"><%= p.getUsername() %></td>
              <td><%= p.getPassword() %></td>
              <td>
                <div class="td-actions">
                  <a href="editPassword.jsp?id=<%= p.getId() %>" class="btn btn-edit">Edit</a>
                  <a href="../deletePassword?id=<%= p.getId() %>"
                     class="btn btn-danger"
                     onclick="return confirm('Delete this entry?')">Delete</a>
                </div>
              </td>
            </tr>
            <% } %>
          </tbody>
        </table>
      </div>
    <% } %>

    <a href="dashboard.jsp" class="back-link">Back to Dashboard</a>

  </div>
</div>

</body>
</html>