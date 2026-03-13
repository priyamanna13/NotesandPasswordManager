package servlet;

import dao.PasswordDAO;
import model.PasswordEntry;
import model.User;
import util.PasswordUtil;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;

@WebServlet("/addPassword")
public class PasswordServlet extends HttpServlet {

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        HttpSession session = request.getSession();

        User user = (User) session.getAttribute("user");

        if(user == null){
            response.sendRedirect("jsp/login.jsp");
            return;
        }

        String application = request.getParameter("application");
        String username = request.getParameter("username");
        String password = request.getParameter("password");

        PasswordEntry entry = new PasswordEntry();

        entry.setApplication(application);
        entry.setUsername(username);
        entry.setPassword(password);
        entry.setUserId(user.getId());

        PasswordDAO dao = new PasswordDAO();

        boolean status = dao.addPassword(entry);

        if(status){
            response.sendRedirect("jsp/dashboard.jsp");
        }else{
            response.sendRedirect("jsp/addPassword.jsp?error=1");
        }
    }
}
