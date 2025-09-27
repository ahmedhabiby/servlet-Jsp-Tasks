<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Sign Up</title>
</head>
<body>
    <h2>Sign Up</h2>
    <form action="AuthController?action=doSignup" method="post">
        <label>Username:</label>
        <input type="text" name="username" required><br><br>

        <label>Email:</label>
        <input type="email" name="email" required><br><br>

        <label>Password:</label>
        <input type="password" name="password" required><br><br>

        <button type="submit">Sign Up</button>
    </form>

    <p style="color:red;">${error}</p>
    <p style="color:green;">${success}</p>

    <a href="AuthController?action=loginPage">Already have an account? Login</a>
</body>
</html>
