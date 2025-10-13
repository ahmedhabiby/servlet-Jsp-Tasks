<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Forget Password</title>

    <style>
        /* ===== General Body Styling ===== */
        body {
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            background: linear-gradient(135deg, #eef2f3, #dfe9f3);
            display: flex;
            justify-content: center;
            align-items: center;
            min-height: 100vh;
            margin: 0;
        }

        /* ===== Container Card ===== */
        .container {
            background: #fff;
            width: 360px;
            padding: 35px 45px;
            border-radius: 12px;
            box-shadow: 0 6px 15px rgba(0,0,0,0.15);
            text-align: center;
            animation: fadeIn 0.6s ease-in-out;
        }

        /* ===== Heading ===== */
        h2 {
            color: #4e73df;
            margin-bottom: 25px;
        }

        /* ===== Labels ===== */
        label {
            display: block;
            text-align: left;
            font-weight: 600;
            color: #333;
            margin-top: 15px;
            margin-bottom: 5px;
        }

        /* ===== Input Fields ===== */
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
            border-color: #4e73df;
            box-shadow: 0 0 5px rgba(78, 115, 223, 0.4);
            outline: none;
        }

        /* ===== Submit Button ===== */
        button {
            margin-top: 20px;
            width: 100%;
            padding: 10px 0;
            background-color: #4e73df;
            border: none;
            color: white;
            font-size: 16px;
            border-radius: 8px;
            cursor: pointer;
            transition: background-color 0.3s ease, transform 0.2s ease;
        }

        button:hover {
            background-color: #2e59d9;
            transform: scale(1.02);
        }

        /* ===== Feedback Messages ===== */
        p {
            margin-top: 15px;
            font-size: 14px;
        }

        p[style*="color:red"] {
            color: #e74a3b !important;
        }

        p[style*="color:green"] {
            color: #1cc88a !important;
        }

        /* ===== Back Link ===== */
        a {
            display: inline-block;
            margin-top: 15px;
            color: #4e73df;
            text-decoration: none;
            font-size: 14px;
            transition: color 0.3s ease;
        }

        a:hover {
            color: #2e59d9;
            text-decoration: underline;
        }

        /* ===== Fade In Animation ===== */
        @keyframes fadeIn {
            from { opacity: 0; transform: translateY(-10px); }
            to { opacity: 1; transform: translateY(0); }
        }
    </style>
</head>

<body>
    <div class="container">
        <h2>Forget Password</h2>
        <form action="AuthController?action=doForgetPassword" method="post">
            <label>Username:</label>
            <input type="text" name="username" required>

            <label>New Password:</label>
            <input type="password" name="newPassword" required>

            <button type="submit">Update Password</button>
        </form>

        <p style="color:red;">${error}</p>
        <p style="color:green;">${success}</p>

        <a href="AuthController?action=loginPage">← Back to Login</a>
    </div>
</body>
</html>
