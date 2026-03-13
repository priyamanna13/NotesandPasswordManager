<%@ page import="java.util.*,dao.NotesDAO,model.Note,model.User" %>
<%
User user = (User) session.getAttribute("user");
if(user == null){ response.sendRedirect("login.jsp"); return; }
NotesDAO dao = new NotesDAO();
List<Note> notes = dao.getNotesByUser(user.getId());
%>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>My Notes - Vault</title>
  <link rel="stylesheet" href="../css/style.css">
</head>
<body>

<div class="container-wide">
  <div class="card">

    <div class="page-header">
      <h2 style="margin-bottom:0;">My Notes</h2>
      <a href="addNote.jsp" class="btn" style="width:auto; padding:9px 18px; font-size:0.88rem;">+ New Note</a>
    </div>

    <% if(notes == null || notes.isEmpty()){ %>
      <div class="empty-state">
        <div class="empty-icon">--</div>
        <p>No notes yet. <a href="addNote.jsp">Create your first note.</a></p>
      </div>
    <% } else { %>
      <div class="table-wrap">
        <table>
          <thead>
            <tr>
              <th style="width:25%">Title</th>
              <th>Content</th>
              <th style="width:130px">Actions</th>
            </tr>
          </thead>
          <tbody>
            <% for(Note n : notes){ %>
            <tr>
              <td><strong><%= n.getTitle() %></strong></td>
              <td style="color:var(--muted);"><%= n.getContent() %></td>
              <td>
                <div class="td-actions">
                  <a href="editNote.jsp?id=<%= n.getId() %>" class="btn btn-edit">Edit</a>
                  <a href="../deleteNote?id=<%= n.getId() %>"
                     class="btn btn-danger"
                     onclick="return confirm('Delete this note?')">Delete</a>
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