<%@ page import="dao.DBConnection,model.PasswordEntry,java.sql.*" %>
<%
int id = Integer.parseInt(request.getParameter("id"));
Connection con = DBConnection.getConnection();
PreparedStatement ps = con.prepareStatement("SELECT * FROM passwords WHERE id=?");
ps.setInt(1,id);
ResultSet rs = ps.executeQuery();
rs.next();
%>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Edit Password - Vault</title>
  <link rel="stylesheet" href="../css/style.css">
</head>
<body>

<div class="container">
  <div class="card">

    <div class="page-header">
      <h2 style="margin-bottom:0;">Edit Password</h2>
    </div>

    <form action="../updatePassword" method="post">

      <input type="hidden" name="id" value="<%= rs.getInt("id") %>">

      <div class="form-group">
        <label for="application">Application / Website</label>
        <input type="text" id="application" name="application" value="<%= rs.getString("application") %>" required>
      </div>

      <div class="form-group">
        <label for="username">Username / Email</label>
        <input type="text" id="username" name="username" value="<%= rs.getString("username") %>" required>
      </div>

      <div class="form-group">
        <label for="password">Password</label>
        <input type="text" id="password" name="password" value="<%= rs.getString("password") %>" required>
      </div>

      <button type="submit">Update Password</button>

    </form>

    <a href="viewPasswords.jsp" class="back-link">Back to Passwords</a>

  </div>
</div>

</body>
</html>