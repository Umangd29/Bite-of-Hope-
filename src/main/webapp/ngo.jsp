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

// Fetch ALL donations
List<Donation> list = DonationDAO.getAllDonations();
%>

<html>
<head>
    <title>NGO Dashboard</title>


<!-- Bootstrap -->
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">


</head>

<body class="bg-light">

<!-- Navbar -->

<nav class="navbar navbar-dark bg-dark px-4">


<!-- LEFT: Brand -->
<span class="navbar-brand fw-bold">Bite of Hope - NGO</span>

<!-- RIGHT: User + Logout -->
<div class="d-flex align-items-center ms-auto">

    <!-- USER NAME -->
    <span class="text-white me-3 fw-semibold">
        <%= user.getName() %>
    </span>

    <!-- LOGOUT -->
    <a href="logout" class="btn btn-danger btn-sm">
        Logout
    </a>

</div>


</nav>


<div class="container mt-5">


<!-- Donation Cards -->
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

            <!-- STATUS -->
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

            <!-- CLAIM BUTTON -->
            <%
            if (!"claimed".equalsIgnoreCase(d.getStatus())) {
            %>
                <a href="claim?id=<%= d.getId() %>" 
                   class="btn btn-success btn-sm">
                   Claim
                </a>
            <%
            } else {
            %>
                <button class="btn btn-secondary btn-sm" disabled>
                    Already Claimed
                </button>
            <%
            }
            %>

        </div>
    </div>

<%
    }
} else {
%>

    <p class="text-center">No donations available</p>

<%
}
%>

</div>


</div>

</body>
</html>
