<%@ page import="model.User" %>

<%
User user = (User) session.getAttribute("user");

if (user == null) {
response.sendRedirect("login.jsp");
return;
}
%>

<html>
<head>
    <title>Admin Dashboard</title>

<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">


</head>

<body class="bg-light">


<nav class="navbar navbar-dark bg-dark px-4">
    <span class="navbar-brand fw-bold">Bite of Hope - Admin</span>
    <a href="logout" class="btn btn-danger btn-sm">Logout</a>
</nav>

<div class="container mt-5">


<!-- Welcome Card -->
<div class="card shadow p-4 mb-4">
    <h3>Welcome, <%= user.getName() %> </h3>
    <p class="mb-0"><strong>Email:</strong> <%= user.getEmail() %></p>
</div>

<!-- Admin Actions -->
<div class="card shadow p-4 text-center">

    <div class="card shadow p-4 text-center">


<h5 class="mb-3">Admin Controls</h5>

<a href="viewUsers" class="btn btn-primary m-2 px-4">
     View All Users
</a>


<a href="manageNGO" class="btn btn-warning m-2 px-4">
     Manage NGOs
</a>




</div>


</div>

</body>
</html>
