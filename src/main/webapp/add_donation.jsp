<%@ page import="model.User" %>

<%
User user = (User) session.getAttribute("user");

if (user == null || !user.getRole().equals("donor")) {
response.sendRedirect("login.jsp");
return;
}
%>

<html>
<head>
    <title>Add Donation</title>


<!-- Bootstrap -->
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">


</head>

<body class="bg-light">

<!-- Navbar -->

<nav class="navbar navbar-dark bg-dark px-4">
    <span class="navbar-brand">Bite of Hope - Donor</span>
    <a href="logout" class="btn btn-danger btn-sm">Logout</a>
</nav>

<div class="container mt-5">


<div class="card shadow p-4 mx-auto" style="max-width:600px;">

    <h3 class="text-center mb-4">Add Donation </h3>

    <form action="addDonation" method="post">

        <div class="mb-3">
            <label class="form-label">Food Name</label>
            <input type="text" name="food" class="form-control" placeholder="Enter food name" required>
        </div>

        <div class="mb-3">
            <label class="form-label">Description</label>
            <textarea name="desc" class="form-control" placeholder="Enter details"></textarea>
        </div>

        <div class="mb-3">
            <label class="form-label">Servings</label>
            <input type="number" name="servings" class="form-control" min="1" required>
        </div>

        <div class="mb-3">
            <label class="form-label">Expiry Time</label>
            <input type="datetime-local" name="expiry" class="form-control" required>
        </div>

        <div class="mb-3">
            <label class="form-label">Address</label>
            <input type="text" name="address" class="form-control" placeholder="Enter pickup location" required>
        </div>

        <button type="submit" class="btn btn-success w-100">
            Add Donation
        </button>

    </form>

</div>


</div>

</body>
</html>
