<%@ page import="model.User" %>

<%
User user = (User) session.getAttribute("user");
%>

<html>
<head>
    <title>Bite of Hope</title>

<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">


</head>

<body class="bg-light">


<nav class="navbar navbar-expand-lg navbar-dark bg-dark px-4">
    <div class="container-fluid">
        <span class="navbar-brand fw-bold"> Bite of Hope</span>


    <div class="d-flex align-items-center">

        <%
        if (user == null) {
        %>
            <a href="login.jsp" class="btn btn-outline-light btn-sm me-2">Login</a>
            <a href="register.jsp" class="btn btn-success btn-sm">Register</a>
        <%
        } else {
        %>
            <span class="text-white me-3">Hi, <%= user.getName() %></span>

            <%
            if (user.getRole().equals("donor")) {
            %>
                <a href="donor.jsp" class="btn btn-primary btn-sm me-2">Dashboard</a>
            <%
            } else if (user.getRole().equals("ngo")) {
            %>
                <a href="ngo.jsp" class="btn btn-primary btn-sm me-2">Dashboard</a>
            <%
            } else {
            %>
                <a href="admin.jsp" class="btn btn-primary btn-sm me-2">Dashboard</a>
            <%
            }
            %>

            <a href="logout" class="btn btn-danger btn-sm">Logout</a>
        <%
        }
        %>

    </div>
</div>


</nav>



<div class="container mt-5 text-center">

<h1 class="fw-bold mb-3">Welcome to Bite of Hope </h1>
<p class="lead text-muted">
    Connecting food donors with NGOs to reduce waste and help those in need.
</p>

<div class="mt-4">

    <%
    if (user == null) {
    %>
        <a href="register.jsp" class="btn btn-success btn-lg me-2 px-4">Get Started</a>
        <a href="login.jsp" class="btn btn-primary btn-lg px-4">Login</a>
    <%
    } else {
    %>
        <%
        if (user.getRole().equals("donor")) {
        %>
            <a href="add_donation.jsp" class="btn btn-success btn-lg px-4">Add Donation</a>
        <%
        } else if (user.getRole().equals("ngo")) {
        %>
            <a href="viewDonations" class="btn btn-success btn-lg px-4">View Donations</a>
        <%
        }
        %>
    <%
    }
    %>

</div>

<div class="card shadow mt-5 p-4 mx-auto" style="max-width:600px;">
    <h5 class="mb-3"> Our Mission</h5>
    <p class="text-muted mb-0">
        Reduce food waste and ensure surplus food reaches those who need it most through a simple and efficient system.
    </p>
</div>


</div>

</body>
</html>
