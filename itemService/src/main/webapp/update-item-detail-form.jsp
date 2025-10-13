<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="model.ItemDetail" %>
<%
    ItemDetail detail = (ItemDetail) request.getAttribute("detail");
%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Update Item Detail</title>

    <style>
        /* ===== General Page Layout ===== */
        body {
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            background: linear-gradient(135deg, #eef2f3, #dfe9f3);
            display: flex;
            justify-content: center;
            align-items: center;
            min-height: 100vh;
            margin: 0;
        }

        /* ===== Card Container ===== */
        .container {
            background: #fff;
            width: 400px;
            padding: 40px 45px;
            border-radius: 12px;
            box-shadow: 0 6px 18px rgba(0,0,0,0.15);
            text-align: center;
            animation: fadeIn 0.6s ease-in-out;
        }

        /* ===== Title ===== */
        h2 {
            color: #4e73df;
            margin-bottom: 25px;
        }

        /* ===== Label Styling ===== */
        label {
            display: block;
            text-align: left;
            font-weight: 600;
            color: #333;
            margin-top: 15px;
            margin-bottom: 5px;
        }

        /* ===== Input Fields ===== */
        input[type="text"] {
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
            margin-top: 25px;
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
            transform: scale(1.03);
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

        /* ===== Animation ===== */
        @keyframes fadeIn {
            from { opacity: 0; transform: translateY(-10px); }
            to { opacity: 1; transform: translateY(0); }
        }
    </style>
</head>

<body>
    <div class="container">
        <h2>Update Item Detail</h2>
        <form action="ItemController?action=update-item-detail" method="post">
            <input type="hidden" name="detailId" value="<%=detail.getId()%>">
            
            <label>Description:</label>
            <input type="text" name="description" value="<%=detail.getDescription()%>" required>

            <label>Manufacturer:</label>
            <input type="text" name="manufacturer" value="<%=detail.getManufacturer()%>" required>

            <label>Warranty:</label>
            <input type="text" name="warranty" value="<%=detail.getWarranty()%>" required>

            <button type="submit">Update</button>
        </form>

        <a href="ItemController?action=show-items">← Back to Items</a>
    </div>
</body>
</html>
