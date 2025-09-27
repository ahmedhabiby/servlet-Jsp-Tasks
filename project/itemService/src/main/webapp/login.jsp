<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Login</title>
</head>
<body>
    <h2>Login</h2>
    <form action="AuthController?action=doLogin" method="post">
        <label>Username:</label>
        <input type="text" name="username" required><br><br>

        <label>Password:</label>
        <input type="password" name="password" required><br><br>

        <button type="submit">Login</button>
    </form>

    <!-- رسالة الخطأ -->
    <p style="color:red;">
        ${error}
    </p>

    <!-- رسالة نجاح بعد إنشاء الحساب -->
    <p style="color:green;">
        ${success}
    </p>

    <a href="AuthController?action=signupPage">Don't have an account? Sign Up</a><br>
    <a href="AuthController?action=forgetPasswordPage">Forgot Password?</a> |<br>
   <a href="AuthController?action=deleteAccountPage">Delete Account</a>
    
</body>
</html>
