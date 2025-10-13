<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Delete Account</title>

    <style>
        body {
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            background: linear-gradient(135deg, #f9f9f9, #e3e3e3);
            display: flex;
            justify-content: center;
            align-items: center;
            min-height: 100vh;
            margin: 0;
        }

        .container {
            background: #fff;
            padding: 35px 45px;
            border-radius: 12px;
            box-shadow: 0 5px 15px rgba(0,0,0,0.15);
            width: 360px;
            text-align: center;
            animation: fadeIn 0.5s ease-in-out;
        }

        h2 {
            color: #e74a3b;
            margin-bottom: 20px;
        }

        label {
            display: block;
            text-align: left;
            font-weight: 600;
            color: #444;
            margin-top: 15px;
            margin-bottom: 5px;
        }

        input[type="text"],
        input[type="password"] {
            width: 100%;
            padding: 10px 12px;
            border: 1px solid #ccc;
            border-radius: 8px;
            font-size: 15px;
            transition: border-color 0.3s ease, box-shadow 0.3s ease;
        }

        input:focus {
            border-color: #e74a3b;
            box-shadow: 0 0 5px rgba(231, 74, 59, 0.4);
            outline: none;
        }

        button {
            margin-top: 20px;
            width: 100%;
            padding: 10px 0;
            background-color: #e74a3b;
            border: none;
            color: white;
            font-size: 16px;
            border-radius: 8px;
            cursor: pointer;
            transition: background-color 0.3s ease, transform 0.2s ease;
        }

        button:hover {
            background-color: #c0392b;
            transform: scale(1.02);
        }

        p {
            margin-top: 15px;
            font-size: 14px;
        }

        p[style*="color:red"] {
            color: #e74a3b !important;
        }

        p[style*="color:green"] {
            color: #2ecc71 !important;
        }

        a {
            display: inline-block;
            margin-top: 15px;
            color: #007BFF;
            text-decoration: none;
            font-size: 14px;
            transition: color 0.3s ease;
        }

        a:hover {
            color: #0056b3;
            text-decoration: underline;
        }

        @keyframes fadeIn {
            from { opacity: 0; transform: translateY(-10px); }
            to { opacity: 1; transform: translateY(0); }
        }
    </style>
</head>

<body>
    <div class="container">
        <h2>Delete Account</h2>
        <form action="AuthController?action=doDeleteAccount" method="post">
            <label>Username:</label>
            <input type="text" name="username" required>

            <label>Password:</label>
            <input type="password" name="password" required>

            <button type="submit">Delete Account</button>
        </form>

        <p style="color:red;">${error}</p>
        <p style="color:green;">${success}</p>

        <a href="AuthController?action=loginPage">← Back to Login</a>
    </div>
</body>
</html>
