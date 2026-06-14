<%@ page import="model.User" %>
<%@ page import="java.util.List" %>
<%@ page import="model.Donation" %>
<%@ page import="dao.DonationDAO" %>

<%
User user = (User) session.getAttribute("user");

if (user == null) {
response.sendRedirect("login.jsp");
return;
}

// Fetch donations
List<Donation> list = DonationDAO.getDonationsByDonor(user.getId());
%>

<html>
<head>
    <title>Donor Dashboard</title>

<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">


</head>

<body class="bg-light">


<nav class="navbar navbar-dark bg-dark px-4">

    <span class="navbar-brand fw-bold"> Bite of Hope</span>

    <div class="d-flex align-items-center">

        <span class="text-white me-3">
            Welcome, <%= user.getName() %>
        </span>

        <a href="add_donation.jsp" class="btn btn-success btn-sm me-2">
            Add Donation
        </a>

        <a href="index.jsp" class="btn btn-primary btn-sm me-2">
            Home
        </a>

        <a href="logout" class="btn btn-danger btn-sm">
            Logout
        </a>

    </div>

</nav>

<div class="container mt-5">


<%
String msg = request.getParameter("msg");
if ("added".equals(msg)) {
%>
    <div class="alert alert-success text-center">
        Donation Added Successfully 
    </div>
<%
}
%>

<div class="row">

<%
if (list != null && !list.isEmpty()) {
    for (Donation d : list) {
%>

    <div class="col-md-4">
        <div class="card shadow mb-4 p-3">

            <h5><%= d.getFood() %></h5>
            <p><%= d.getDescription() %></p>

            <p><strong>Servings:</strong> <%= d.getServings() %></p>
            <p><strong>Expiry:</strong> <%= d.getExpiry() %></p>
            <p><strong>Address:</strong> <%= d.getAddress() %></p>

            <p>
                <strong>Status:</strong>
                <%
                if ("claimed".equalsIgnoreCase(d.getStatus())) {
                %>
                    <span class="badge bg-danger">Claimed</span>
                <%
                } else {
                %>
                    <span class="badge bg-success">Available</span>
                <%
                }
                %>
            </p>

            <div class="d-flex justify-content-between">

                <%
if (!"claimed".equalsIgnoreCase(d.getStatus())) {
%>
    <a href="edit_donation.jsp?id=<%= d.getId() %>" 
       class="btn btn-primary btn-sm">
       Edit
    </a>
<%
}
%>

                <%
                if (!"claimed".equalsIgnoreCase(d.getStatus())) {
                %>
                    <a href="deleteDonation?id=<%= d.getId() %>" 
                       class="btn btn-danger btn-sm">
                       Delete
                    </a>
                <%
                }
                %>

            </div>

        </div>
    </div>

<%
    }
} else {
%>

    <p class="text-center">No donations yet</p>

<%
}
%>

</div>


</div>

</body>
</html>
