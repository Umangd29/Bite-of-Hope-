<%@ page import="java.util.List" %>
<%@ page import="model.Donation" %>

<html>
<head>
    <title>Available Donations</title>

<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">


</head>

<body class="bg-light">

<div class="container mt-5">


<div class="card shadow p-4">
    
    <h3 class="text-center mb-4">Available Donations</h3>

    <table class="table table-bordered table-striped text-center">

        <thead class="table-dark">
            <tr>
                <th>Food</th>
                <th>Description</th>
                <th>Servings</th>
                <th>Expiry</th>
                <th>Address</th>
                <th>Action</th>
            </tr>
        </thead>

        <tbody>

        <%
        List<Donation> list = (List<Donation>) request.getAttribute("donations");

        if (list != null && !list.isEmpty()) {
            for (Donation d : list) {
        %>

            <tr>
                <td><%= d.getFood() %></td>
                <td><%= d.getDescription() %></td>
                <td><%= d.getServings() %></td>
                <td><%= d.getExpiry() %></td>
                <td><%= d.getAddress() %></td>

                <td>
                    <a href="claim?id=<%= d.getId() %>" 
                       class="btn btn-success btn-sm">
                       Claim
                    </a>
                </td>
            </tr>

        <%
            }
        } else {
        %>

            <tr>
                <td colspan="6" class="text-muted">No donations available</td>
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
