package controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;

import dao.DonationDAO;
import model.Donation;

@WebServlet("/updateDonation")
public class UpdateDonationServlet extends HttpServlet {

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        int id = Integer.parseInt(request.getParameter("id"));

        Donation d = new Donation();
        d.setId(id);
        d.setFood(request.getParameter("food"));
        d.setDescription(request.getParameter("desc"));
        d.setServings(Integer.parseInt(request.getParameter("servings")));
        d.setExpiry(request.getParameter("expiry"));
        d.setAddress(request.getParameter("address"));

        DonationDAO.updateDonation(d);

        response.sendRedirect("donor.jsp");
    }
}