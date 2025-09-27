<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="model.Item"%>
<%@ page import="model.ItemDetail"%>
<%@ page import="java.util.List"%>
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
    table {
      width: 100%;
      border-collapse: collapse;
      background: #fff;
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
    }
    .btn-update { background: #1cc88a; }
    .btn-delete { background: #e74a3b; }
    .btn-detail { background: #36b9cc; }
  </style>
</head>
<body>
<%
  List<Item> i1 = (List<Item>) request.getAttribute("items1");
  String error = request.getParameter("error");
  if ("details_exist".equals(error)) {
%>
  <p style="color:red;">You must delete the item details before deleting the item!</p>
<% } %>

<h1>Items</h1>
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
      <td><%=item1.getId()%></td>
      <td><%=item1.getName()%></td>
      <td>$<%=item1.getPrice()%></td>
      <td><%=item1.getTotal()%></td>
      <td>
        <% 
          ItemDetail detail = item1.getItemDetail();
          if (detail == null) { 
        %>
          <!-- لو مفيش تفاصيل، نضيف تفاصيل جديدة للـ Item -->
          <a class="btn-detail" href="add-item-detail-form.jsp?itemId=<%=item1.getId()%>">Add Details</a>
        <% 
          } else { 
        %>
          <!-- لو فيه تفاصيل، نستخدم detailId للتحديث أو الحذف -->
          <a class="btn-detail" href="ItemController?action=show-item-detail&detailId=<%=detail.getId()%>">
            Update Details
          </a>
          <a class="btn-delete" href="ItemController?action=delete-item-detail&detailId=<%=detail.getId()%>"
             onclick="return confirm('Are you sure you want to delete this detail?')">Delete Details</a>
        <% } %>
      </td>
      <td>
        <a class="btn-update" href="ItemController?action=show-item&id=<%=item1.getId()%>">Update</a>
        <a class="btn-delete" href="ItemController?action=delete-item&id=<%=item1.getId()%>"
           onclick="return confirm('Are you sure you want to delete this item?')">Delete</a>
      </td>
    </tr>
<% } %>

  </tbody>
</table>
<br>
<a href="add-data.html" style="background:#4e73df; padding:10px; color:white; border-radius:5px;">Add New Item</a>
</body>
</html>
