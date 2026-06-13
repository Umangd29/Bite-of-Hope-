package controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;

import dao.DonationDAO;
import model.Donation;
import model.User;

@WebServlet("/addDonation")
public class AddDonationServlet extends HttpServlet {


protected void doPost(HttpServletRequest request, HttpServletResponse response)
        throws ServletException, IOException {

    HttpSession session = request.getSession();
    User user = (User) session.getAttribute("user");

    // Only donor allowed
    if (user == null || !user.getRole().equals("donor")) {
        response.sendRedirect("login.jsp");
        return;
    }

    String food = request.getParameter("food");
    String desc = request.getParameter("desc");
    int servings = Integer.parseInt(request.getParameter("servings"));
    String expiry = request.getParameter("expiry");
    String address = request.getParameter("address");

    Donation d = new Donation();
    d.setDonorId(user.getId());   // IMPORTANT (we fix if missing)
    d.setFood(food);
    d.setDescription(desc);
    d.setServings(servings);
    d.setExpiry(expiry);
    d.setAddress(address);

    boolean status = DonationDAO.addDonation(d);

    if (status) {
    	response.sendRedirect("donor.jsp?msg=added");
    } else {
    	response.sendRedirect("donor.jsp?msg=Not_added");
    }
}


}
