<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="model.Item, model.ItemDetail, java.util.List" %>

<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <title>Show Items</title>

  <style>
    body {
      font-family: Arial, sans-serif;
      background: #f8f9fc;
      padding: 20px;
    }

    h1 {
      text-align: center;
      color: #4e73df;
    }

    p.message {
      text-align: center;
      font-weight: bold;
    }

    table {
      width: 100%;
      border-collapse: collapse;
      background: #fff;
      margin-top: 20px;
    }

    table, th, td {
      border: 1px solid #ddd;
    }

    th {
      background: #4e73df;
      color: white;
      padding: 10px;
    }

    td {
      padding: 8px;
      text-align: center;
    }

    a {
      text-decoration: none;
      padding: 5px 10px;
      border-radius: 5px;
      margin: 2px;
      color: white;
      font-size: 14px;
      display: inline-block;
    }

    .btn-update { background: #1cc88a; }
    .btn-delete { background: #e74a3b; }
    .btn-detail { background: #36b9cc; }

    .btn-main {
      background: #4e73df;
      color: white;
      text-decoration: none;
      padding: 10px 15px;
      border-radius: 6px;
      display: inline-block;
      margin-top: 20px;
    }

    .btn-main:hover {
      background: #2e59d9;
    }
  </style>
</head>

<body>

<%
  // Retrieve the list of items from the request
  List<Item> i1 = (List<Item>) request.getAttribute("items1");
  String error = request.getParameter("error");

  if ("details_exist".equals(error)) {
%>
  <p class="message" style="color:red;">You must delete the item details before deleting the item!</p>
<% } %>

<h1>Items</h1>

<%
  // Handle case when no items exist or attribute is missing
  if (i1 == null || i1.isEmpty()) {
%>
  <p class="message" style="color:gray;">No items available.</p>
<%
  } else {
%>

  <table>
    <thead>
      <tr>
        <th>ID</th>
        <th>NAME</th>
        <th>PRICE</th>
        <th>TOTAL</th>
        <th>DETAILS</th>
        <th>ACTIONS</th>
      </tr>
    </thead>
    <tbody>
    <% for (Item item1 : i1) { %>
      <tr>
        <td><%= item1.getId() %></td>
        <td><%= item1.getName() %></td>
        <td>$<%= item1.getPrice() %></td>
        <td><%= item1.getTotal() %></td>
        <td>
          <%
            ItemDetail detail = item1.getItemDetail();
            if (detail == null) {
          %>
            <!-- No details yet — allow adding -->
            <a class="btn-detail" href="add-item-detail-form.jsp?itemId=<%= item1.getId() %>">Add Details</a>
          <%
            } else {
          %>
            <!-- Existing details — allow updating or deleting -->
            <a class="btn-detail" href="ItemController?action=show-item-detail&detailId=<%= detail.getId() %>">Update Details</a>
            <a class="btn-delete" href="ItemController?action=delete-item-detail&detailId=<%= detail.getId() %>"
               onclick="return confirm('Are you sure you want to delete this detail?')">Delete Details</a>
          <%
            }
          %>
        </td>
        <td>
          <a class="btn-update" href="ItemController?action=show-item&id=<%= item1.getId() %>">Update</a>
          <a class="btn-delete" href="ItemController?action=delete-item&id=<%= item1.getId() %>"
             onclick="return confirm('Are you sure you want to delete this item?')">Delete</a>
        </td>
      </tr>
    <% } %>
    </tbody>
  </table>

<% } %>

<div style="text-align:center;">
  <a href="add-data.html" class="btn-main">Add New Item</a>
</div>

</body>
</html>
