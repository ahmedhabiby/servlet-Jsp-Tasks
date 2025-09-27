<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Delete Account</title>
    <link rel="stylesheet" href="css/style.css">
</head>
<body>
    <h2>Delete Account</h2>
    <form action="AuthController?action=doDeleteAccount" method="post">
        <label>Username:</label>
        <input type="text" name="username" required><br><br>

        <label>Password:</label>
        <input type="password" name="password" required><br><br>

        <button type="submit" style="background:red;color:white;">Delete Account</button>
    </form>

    <p style="color:red;">${error}</p>
    <p style="color:green;">${success}</p>

    <a href="AuthController?action=loginPage">Back to Login</a>
</body>
</html>
