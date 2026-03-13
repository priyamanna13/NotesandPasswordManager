package servlet;

import dao.PasswordDAO;
import model.PasswordEntry;

import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;

@WebServlet("/updatePassword")
public class UpdatePasswordServlet extends HttpServlet {

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws IOException {

        int id = Integer.parseInt(request.getParameter("id"));
        String application = request.getParameter("application");
        String username = request.getParameter("username");
        String password = request.getParameter("password");

        PasswordEntry entry = new PasswordEntry();

        entry.setId(id);
        entry.setApplication(application);
        entry.setUsername(username);
        entry.setPassword(password);

        PasswordDAO dao = new PasswordDAO();

        dao.updatePassword(entry);

        response.sendRedirect("jsp/viewPasswords.jsp");
    }
}