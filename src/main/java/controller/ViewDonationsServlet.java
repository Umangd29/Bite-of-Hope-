package controller;

import java.io.IOException;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;

import dao.DonationDAO;
import model.Donation;
import model.User;

@WebServlet("/viewDonations")
public class ViewDonationsServlet extends HttpServlet {

protected void doGet(HttpServletRequest request, HttpServletResponse response)
        throws ServletException, IOException {

    HttpSession session = request.getSession();
    User user = (User) session.getAttribute("user");

    // Only NGO can access
    if (user == null || !user.getRole().equals("ngo")) {
        response.sendRedirect("login.jsp");
        return;
    }

    List<Donation> list = DonationDAO.getAllDonations();

    request.setAttribute("donations", list);
    request.getRequestDispatcher("view_donations.jsp").forward(request, response);
}


}
