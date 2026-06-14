package controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;

import dao.UserDAO;
import model.User;

@WebServlet("/manageNGO")
public class ManageNGOServlet extends HttpServlet {

protected void doGet(HttpServletRequest request, HttpServletResponse response)
        throws ServletException, IOException {

    // Restrict to admin
    HttpSession session = request.getSession();
    User user = (User) session.getAttribute("user");

    if (user == null || !user.getRole().equals("admin")) {
        response.sendRedirect("login.jsp");
        return;
    }

    // Get all NGOs
    List<User> list = UserDAO.getAllNGOs();

    // Send to JSP
    request.setAttribute("ngos", list);
    request.getRequestDispatcher("manage_ngos.jsp").forward(request, response);
}


}
