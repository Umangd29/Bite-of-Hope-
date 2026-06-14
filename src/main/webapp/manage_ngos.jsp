<%@ page import="java.util.List" %>
<%@ page import="model.User" %>

<html>
<head>
    <title>Manage NGOs</title>



<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">


</head>

<body class="bg-light">


<nav class="navbar navbar-dark bg-dark px-4">
    <span class="navbar-brand">Admin - Manage NGOs</span>
    <a href="admin.jsp" class="btn btn-light btn-sm">Back</a>
</nav>

<div class="container mt-5">


<div class="card shadow p-4">

    <h3 class="text-center mb-4">NGO Approval Panel </h3>

    <table class="table table-bordered table-striped text-center">

        <thead class="table-dark">
            <tr>
                <th>ID</th>
                <th>Name</th>
                <th>Email</th>
                <th>Action</th>
            </tr>
        </thead>

        <tbody>

        <%
        List<User> list = (List<User>) request.getAttribute("ngos");

        if (list != null && !list.isEmpty()) {
            for (User u : list) {
        %>

            <tr>
                <td><%= u.getId() %></td>
                <td><%= u.getName() %></td>
                <td><%= u.getEmail() %></td>
                

                <td>
                    <a href="verifyNGO?id=<%= u.getId() %>&action=approve" 
                       class="btn btn-success btn-sm">Approve</a>

                    <a href="verifyNGO?id=<%= u.getId() %>&action=reject" 
                       class="btn btn-danger btn-sm">Reject</a>
                </td>
            </tr>

        <%
            }
        } else {
        %>

            <tr>
                <td colspan="5">No NGOs found</td>
            </tr>

        <%
        }
        %>

        </tbody>

    </table>

</div>


</div>

</body>
</html>
