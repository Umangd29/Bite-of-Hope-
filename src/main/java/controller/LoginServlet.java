package controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;

import dao.UserDAO;
import model.User;

@WebServlet("/login")
public class LoginServlet extends HttpServlet {


protected void doPost(HttpServletRequest request, HttpServletResponse response)
        throws ServletException, IOException {

    String email = request.getParameter("email");
    String password = request.getParameter("password");

    User user = UserDAO.loginUser(email, password);

    if (user != null) {

        HttpSession session = request.getSession();
        session.setAttribute("user", user);

        // ROLE BASED REDIRECT
        if (user.getRole().equals("admin")) {
            response.sendRedirect("admin.jsp");
        } else if (user.getRole().equals("donor")) {
            response.sendRedirect("donor.jsp");
        } else {
            response.sendRedirect("ngo.jsp");
        }

    } else {
        response.getWriter().println("Invalid Email or Password!");
    }
}


}
