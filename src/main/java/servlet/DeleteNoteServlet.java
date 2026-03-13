package servlet;

import dao.NotesDAO;

import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;

@WebServlet("/deleteNote")
public class DeleteNoteServlet extends HttpServlet {

    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws IOException {

        try {

        
            int id = Integer.parseInt(request.getParameter("id"));

          
            NotesDAO dao = new NotesDAO();

            dao.deleteNote(id);

        } catch (Exception e) {
            e.printStackTrace();
        }

        response.sendRedirect("jsp/viewNotes.jsp");
    }
}