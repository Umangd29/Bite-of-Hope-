<html>
<head>
    <title>Register</title>


<!-- Bootstrap CSS -->
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">

</head>

<body class="bg-light">

<div class="container mt-5">


<div class="card shadow mx-auto p-4" style="max-width:500px;">
    
    <h3 class="text-center mb-4">User Registration</h3>

    <form action="register" method="post">

        <div class="mb-3">
            <label class="form-label">Name</label>
            <input type="text" name="name" class="form-control" placeholder="Enter your name" required>
        </div>

        <div class="mb-3">
            <label class="form-label">Email</label>
            <input type="email" name="email" class="form-control" placeholder="Enter your email" required>
        </div>

        <div class="mb-3">
            <label class="form-label">Password</label>
            <input type="password" name="password" class="form-control" placeholder="Enter password" required>
        </div>

        <div class="mb-3">
            <label class="form-label">Role</label>
            <select name="role" class="form-select">
                <option value="donor">Donor</option>
                <option value="ngo">NGO</option>
            </select>
        </div>

        <button type="submit" class="btn btn-success w-100">Register</button>

    </form>

    <p class="text-center mt-3">
        Already have an account? 
        <a href="login.jsp">Login</a>
    </p>

</div>


</div>

</body>
</html>
