package controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;

import dao.DonationDAO;
import model.User;

@WebServlet("/claim")
public class ClaimDonationServlet extends HttpServlet {

protected void doGet(HttpServletRequest request, HttpServletResponse response)
        throws ServletException, IOException {

    HttpSession session = request.getSession();
    User user = (User) session.getAttribute("user");

    // Only NGO can claim
    if (user == null || !user.getRole().equals("ngo")) {
        response.sendRedirect("login.jsp");
        return;
    }

    int donationId = Integer.parseInt(request.getParameter("id"));

    boolean status = DonationDAO.claimDonation(donationId, user.getId());

    if (status) {
        response.sendRedirect("viewDonations");
    } else {
        response.getWriter().println("Claim Failed!");
    }
}


}
