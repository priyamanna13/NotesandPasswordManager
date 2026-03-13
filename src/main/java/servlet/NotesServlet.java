package servlet;

import dao.NotesDAO;
import model.Note;
import model.User;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;

@WebServlet("/addNote")
public class NotesServlet extends HttpServlet {

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        HttpSession session = request.getSession();

        User user = (User) session.getAttribute("user");

        if(user == null){
            response.sendRedirect("jsp/login.jsp");
            return;
        }

        String title = request.getParameter("title");
        String content = request.getParameter("content");

        Note note = new Note();

        note.setTitle(title);
        note.setContent(content);
        note.setUserId(user.getId());

        NotesDAO dao = new NotesDAO();

        boolean status = dao.addNote(note);

        if(status){
            response.sendRedirect("jsp/dashboard.jsp");
        }else{
            response.sendRedirect("jsp/addNote.jsp?error=1");
        }
    }
}
