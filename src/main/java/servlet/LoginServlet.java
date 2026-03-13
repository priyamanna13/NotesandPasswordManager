package servlet;

import dao.UserDAO;
import model.User;
import util.PasswordUtil;   // NEW IMPORT

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;

@WebServlet("/login")
public class LoginServlet extends HttpServlet {

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String email = request.getParameter("email");
        String password = request.getParameter("password");

        // Encrypt password before checking database
        String encryptedPassword = PasswordUtil.hashPassword(password);

        UserDAO dao = new UserDAO();

        // Pass encrypted password to DAO
        User user = dao.login(email, encryptedPassword);

        if (user != null) {

            HttpSession session = request.getSession();
            session.setAttribute("user", user);

            response.sendRedirect("jsp/dashboard.jsp");

        } else {

            response.sendRedirect("jsp/login.jsp?error=1");
        }
    }
}