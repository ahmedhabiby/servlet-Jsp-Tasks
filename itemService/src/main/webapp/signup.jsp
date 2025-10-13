<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Sign Up</title>

    <!-- Embedded CSS -->
    <style>
        /* General Page Styles */
        body {
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            background: linear-gradient(135deg, #ece9e6, #ffffff);
            display: flex;
            justify-content: center;
            align-items: center;
            min-height: 100vh;
            margin: 0;
        }

        /* Container (form card) */
        form {
            background-color: #fff;
            padding: 30px 40px;
            border-radius: 12px;
            box-shadow: 0 4px 10px rgba(0, 0, 0, 0.1);
            width: 350px;
            animation: fadeIn 0.6s ease-in-out;
        }

        /* Headings */
        h2 {
            text-align: center;
            margin-bottom: 25px;
            color: #333;
        }

        /* Labels and Inputs */
        label {
            display: block;
            font-weight: 600;
            color: #444;
            margin-bottom: 6px;
        }

        input[type="text"],
        input[type="email"],
        input[type="password"] {
            width: 100%;
            padding: 10px 12px;
            border: 1px solid #ccc;
            border-radius: 8px;
            font-size: 15px;
            margin-bottom: 18px;
            transition: all 0.3s ease;
        }

        input[type="text"]:focus,
        input[type="email"]:focus,
        input[type="password"]:focus {
            border-color: #007BFF;
            box-shadow: 0 0 5px rgba(0, 123, 255, 0.3);
            outline: none;
        }

        /* Buttons */
        button {
            width: 100%;
            padding: 10px 0;
            background-color: #28a745;
            border: none;
            color: #fff;
            font-size: 16px;
            border-radius: 8px;
            cursor: pointer;
            transition: background-color 0.3s ease, transform 0.2s ease;
        }

        button:hover {
            background-color: #218838;
            transform: scale(1.02);
        }

        /* Messages */
        p {
            text-align: center;
            margin-top: 10px;
        }

        p[style*="color:red"] {
            color: #dc3545 !important;
            font-weight: 500;
        }

        p[style*="color:green"] {
            color: #28a745 !important;
            font-weight: 500;
        }

        /* Links */
        a {
            display: inline-block;
            text-align: center;
            color: #007BFF;
            text-decoration: none;
            font-size: 14px;
            margin-top: 10px;
            transition: color 0.3s ease;
        }

        a:hover {
            color: #0056b3;
            text-decoration: underline;
        }

        /* Animation */
        @keyframes fadeIn {
            from { opacity: 0; transform: translateY(-10px); }
            to { opacity: 1; transform: translateY(0); }
        }

        /* Responsive */
        @media (max-width: 400px) {
            form {
                width: 90%;
                padding: 25px;
            }
        }
    </style>
</head>

<body>
    <form action="AuthController?action=doSignup" method="post">
        <h2>Sign Up</h2>

        <!-- Username -->
        <label for="username">Username:</label>
        <input type="text" id="username" name="username" placeholder="Enter your username" required>

        <!-- Email -->
        <label for="email">Email:</label>
        <input type="email" id="email" name="email" placeholder="Enter your email" required>

        <!-- Password -->
        <label for="password">Password:</label>
        <input type="password" id="password" name="password" placeholder="Enter your password" required>

        <!-- Submit Button -->
        <button type="submit">Sign Up</button>

        <!-- Feedback Messages -->
        <p style="color:red;">${error}</p>
        <p style="color:green;">${success}</p>

        <!-- Link to Login -->
        <div style="text-align:center; margin-top:15px;">
            <a href="AuthController?action=loginPage">Already have an account? Login</a>
        </div>
    </form>
</body>
</html>
