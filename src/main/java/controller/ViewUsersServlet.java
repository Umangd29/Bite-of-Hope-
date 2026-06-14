package controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;

import dao.UserDAO;
import model.User;

@WebServlet("/viewUsers")
public class ViewUsersServlet extends HttpServlet {

    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        // restrict to admin only
        HttpSession session = request.getSession();
        User user = (User) session.getAttribute("user");

        if (user == null || !user.getRole().equals("admin")) {
            response.sendRedirect("login.jsp");
            return;
        }

        // Fetch users from DB
        List<User> list = UserDAO.getAllUsers();

        // Send to JSP
        request.setAttribute("users", list);
        request.getRequestDispatcher("view_users.jsp").forward(request, response);
    }
}