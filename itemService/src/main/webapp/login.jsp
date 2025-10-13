<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
    // ✅ No need to redeclare session — it's already available in JSP by default
    if (session != null && session.getAttribute("loggedUser") != null) {
        response.sendRedirect("ItemController?action=show-items");
        return;
    }
%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Login</title>

    <style>
        body {
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            background: linear-gradient(135deg, #ece9e6, #ffffff);
            display: flex;
            justify-content: center;
            align-items: center;
            min-height: 100vh;
            margin: 0;
        }
        form {
            background-color: #fff;
            padding: 30px 40px;
            border-radius: 12px;
            box-shadow: 0 4px 10px rgba(0, 0, 0, 0.1);
            width: 350px;
            animation: fadeIn 0.6s ease-in-out;
        }
        h2 {
            text-align: center;
            margin-bottom: 25px;
            color: #333;
        }
        label {
            display: block;
            font-weight: 600;
            color: #444;
            margin-bottom: 6px;
        }
        input[type="text"],
        input[type="password"] {
            width: 100%;
            padding: 10px 12px;
            border: 1px solid #ccc;
            border-radius: 8px;
            font-size: 15px;
            margin-bottom: 18px;
            transition: all 0.3s ease;
        }
        input:focus {
            border-color: #007BFF;
            box-shadow: 0 0 5px rgba(0, 123, 255, 0.3);
            outline: none;
        }
        button {
            width: 100%;
            padding: 10px 0;
            background-color: #007BFF;
            border: none;
            color: #fff;
            font-size: 16px;
            border-radius: 8px;
            cursor: pointer;
            transition: background-color 0.3s ease, transform 0.2s ease;
        }
        button:hover {
            background-color: #0056b3;
            transform: scale(1.02);
        }
        p {
            text-align: center;
            margin-top: 10px;
        }
        p[style*="color:red"] { color: #dc3545 !important; }
        p[style*="color:green"] { color: #28a745 !important; }
        a {
            display: inline-block;
            text-align: center;
            color: #007BFF;
            text-decoration: none;
            font-size: 14px;
            margin-top: 10px;
            transition: color 0.3s ease;
        }
        a:hover { color: #0056b3; text-decoration: underline; }
        @keyframes fadeIn {
            from { opacity: 0; transform: translateY(-10px); }
            to { opacity: 1; transform: translateY(0); }
        }
    </style>
</head>
<body>
    <form action="AuthController?action=doLogin" method="post">
        <h2>Login</h2>

        <label>Username:</label>
        <input type="text" name="username" required>

        <label>Password:</label>
        <input type="password" name="password" required>

        <button type="submit">Login</button>

        <p style="color:red;">${error}</p>
        <p style="color:green;">${success}</p>

        <div style="text-align:center; margin-top:15px;">
            <a href="AuthController?action=signupPage">Don't have an account? Sign Up</a><br>
            <a href="AuthController?action=forgetPasswordPage">Forgot Password?</a><br>
            <a href="AuthController?action=deleteAccountPage" style="color:#dc3545;">Delete Account</a>
        </div>
    </form>
</body>
</html>
