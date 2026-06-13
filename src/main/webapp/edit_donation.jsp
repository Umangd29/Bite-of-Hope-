<%@ page import="model.Donation" %>
<%@ page import="dao.DonationDAO" %>

<%
String idParam = request.getParameter("id");

Donation d = null;

if (idParam != null) {
int id = Integer.parseInt(idParam);
d = DonationDAO.getDonationById(id);
}


if (d == null) {
response.sendRedirect("donor.jsp");
return;
}
%>

<html>
<head>
    <title>Edit Donation</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
</head>

<body class="bg-light">

<div class="container mt-5">


<div class="card shadow p-4">

    <h3 class="text-center mb-4">Edit Donation</h3>

    <form action="updateDonation" method="post">

        <input type="hidden" name="id" value="<%= d.getId() %>">

        <div class="mb-2">
            <input type="text" name="food" class="form-control" value="<%= d.getFood() %>" required>
        </div>

        <div class="mb-2">
            <textarea name="desc" class="form-control"><%= d.getDescription() %></textarea>
        </div>

        <div class="mb-2">
            <input type="number" name="servings" class="form-control" value="<%= d.getServings() %>" required>
        </div>

        <div class="mb-2">
            <input type="text" name="expiry" class="form-control" value="<%= d.getExpiry() %>" required>
        </div>

        <div class="mb-3">
            <input type="text" name="address" class="form-control" value="<%= d.getAddress() %>" required>
        </div>

        <button class="btn btn-success w-100">Update Donation</button>

    </form>

</div>


</div>

</body>
</html>
