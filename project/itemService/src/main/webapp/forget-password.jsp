<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Forget Password</title>
    <link rel="stylesheet" href="css/style.css">
</head>
<body>
    <h2>Forget Password</h2>
    <form action="AuthController?action=doForgetPassword" method="post">
        <label>Username:</label>
        <input type="text" name="username" required><br><br>

        <label>New Password:</label>
        <input type="password" name="newPassword" required><br><br>

        <button type="submit">Update Password</button>
    </form>

    <p style="color:red;">${error}</p>
    <p style="color:green;">${success}</p>

    <a href="AuthController?action=loginPage">Back to Login</a>
</body>
</html>
