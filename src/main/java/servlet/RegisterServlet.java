package servlet;

import dao.UserDAO;
import model.User;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;
import util.PasswordUtil;

@WebServlet("/register")
public class RegisterServlet extends HttpServlet {

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String email = request.getParameter("email");
        String password = request.getParameter("password");

        User user = new User();

        user.setEmail(email);
        String encrypted = PasswordUtil.hashPassword(password);
        user.setPassword(encrypted);

        UserDAO dao = new UserDAO();

        boolean status = dao.register(user);

        if(status){
            response.sendRedirect("jsp/login.jsp");
        }else{
            response.sendRedirect("jsp/register.jsp?error=1");
        }
    }
}
