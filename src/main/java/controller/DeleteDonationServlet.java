package controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;

import dao.DonationDAO;

@WebServlet("/deleteDonation")
public class DeleteDonationServlet extends HttpServlet {

    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        int id = Integer.parseInt(request.getParameter("id"));

        DonationDAO.deleteDonation(id);

        response.sendRedirect("donor.jsp");
    }
}