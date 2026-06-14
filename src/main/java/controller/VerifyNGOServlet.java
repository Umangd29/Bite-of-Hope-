package controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;

import dao.UserDAO;
import model.User;

@WebServlet("/verifyNGO")
public class VerifyNGOServlet extends HttpServlet {


protected void doGet(HttpServletRequest request, HttpServletResponse response)
        throws ServletException, IOException {

    // Check admin
    HttpSession session = request.getSession();
    User user = (User) session.getAttribute("user");

    if (user == null || !user.getRole().equals("admin")) {
        response.sendRedirect("login.jsp");
        return;
    }

    // Get parameters
    int id = Integer.parseInt(request.getParameter("id"));
    String action = request.getParameter("action");

    // Update status
    if ("approve".equals(action)) {
        UserDAO.updateStatus(id, "approved");
    } else if ("reject".equals(action)) {
        UserDAO.updateStatus(id, "rejected");
    }

    // Redirect back
    response.sendRedirect("manageNGO");
}


}
