<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="model.ItemDetail" %>
<%
    ItemDetail detail = (ItemDetail) request.getAttribute("detail");
%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Update Item Detail</title>
</head>
<body>
    <h2>Update Item Detail</h2>
    <form action="ItemController?action=update-item-detail" method="post">
        <input type="hidden" name="detailId" value="<%=detail.getId()%>">
        
        <label>Description:</label>
        <input type="text" name="description" value="<%=detail.getDescription()%>" required><br><br>
        
        <label>Manufacturer:</label>
        <input type="text" name="manufacturer" value="<%=detail.getManufacturer()%>" required><br><br>
        
        <label>Warranty:</label>
        <input type="text" name="warranty" value="<%=detail.getWarranty()%>" required><br><br>
        
        <button type="submit">Update</button>
    </form>
</body>
</html>
