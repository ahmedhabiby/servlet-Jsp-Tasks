<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Add Item Detail</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background: #f4f4f4;
            padding: 20px;
        }
        form {
            max-width: 400px;
            margin: auto;
            background: #fff;
            padding: 20px;
            border: 1px solid #ddd;
            border-radius: 8px;
        }
        input[type="text"], textarea {
            width: 100%;
            padding: 8px;
            margin-bottom: 10px;
            border: 1px solid #ccc;
            border-radius: 5px;
        }
        button {
            background: #4e73df;
            color: white;
            padding: 10px;
            border: none;
            border-radius: 5px;
            cursor: pointer;
        }
        button:hover {
            background: #2e59d9;
        }
    </style>
</head>
<body>
    <h2 style="text-align:center;">Add Item Details</h2>
    <form action="ItemController?action=add-item-detail" method="post">
        <input type="hidden" name="itemId" value="<%= request.getParameter("itemId") %>" />

        <label>Description:</label>
        <textarea name="description" required></textarea>

        <label>Manufacturer:</label>
        <input type="text" name="manufacturer" required />

        <label>Warranty:</label>
        <input type="text" name="warranty" required />

        <button type="submit">Save Details</button>
    </form>
</body>
</html>
