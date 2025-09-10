<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.ArrayList" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%
    ArrayList<String> items = (ArrayList<String>) session.getAttribute("items");

    if (items == null) {
        items = new ArrayList<String>();
        session.setAttribute("items", items);
    }
    String order=request.getParameter("food");
    if(order!=null){
    items.add(order);
    }    
    
    for(String f1:items){
    	out.println(f1);
    	out.println("<br><br>");
    }
%>



</body>
</html>
