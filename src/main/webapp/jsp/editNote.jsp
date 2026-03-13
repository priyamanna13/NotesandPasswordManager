<%@ page import="dao.NotesDAO,dao.DBConnection,model.Note,java.sql.*" %>
<%
int id = Integer.parseInt(request.getParameter("id"));
NotesDAO dao = new NotesDAO();
Connection con = DBConnection.getConnection();
PreparedStatement ps = con.prepareStatement("SELECT * FROM notes WHERE id=?");
ps.setInt(1,id);
ResultSet rs = ps.executeQuery();
rs.next();
%>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Edit Note - Vault</title>
  <link rel="stylesheet" href="../css/style.css">
</head>
<body>

<div class="container">
  <div class="card">

    <div class="page-header">
      <h2 style="margin-bottom:0;">Edit Note</h2>
    </div>

    <form action="../updateNote" method="post">

      <input type="hidden" name="id" value="<%= rs.getInt("id") %>">

      <div class="form-group">
        <label for="title">Title</label>
        <input type="text" id="title" name="title" value="<%= rs.getString("title") %>" required>
      </div>

      <div class="form-group">
        <label for="content">Content</label>
        <textarea id="content" name="content" rows="6" required><%= rs.getString("content") %></textarea>
      </div>

      <button type="submit">Update Note</button>

    </form>

    <a href="viewNotes.jsp" class="back-link">Back to Notes</a>

  </div>
</div>

</body>
</html>