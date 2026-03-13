package servlet;

import dao.NotesDAO;
import model.Note;

import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;
import java.io.IOException;

@WebServlet("/updateNote")
public class UpdateNoteServlet extends HttpServlet {

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws IOException {

        int id = Integer.parseInt(request.getParameter("id"));
        String title = request.getParameter("title");
        String content = request.getParameter("content");

        Note note = new Note();
        note.setId(id);
        note.setTitle(title);
        note.setContent(content);

        NotesDAO dao = new NotesDAO();

        dao.updateNote(note);

        response.sendRedirect("jsp/viewNotes.jsp");
    }
}