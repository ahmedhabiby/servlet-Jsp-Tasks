<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%
String name = request.getParameter("fullName");
String password = request.getParameter("password");
String age = request.getParameter("age");
String radio = request.getParameter("addressRadio");
String checkbox = request.getParameter("addressSelect");

out.println("Name is : " + name + "<br>");
out.println("Password is : " + password + "<br>");
out.println("Age is  : " + age + "<br>");
out.println("Radio is : " + radio + "<br>");
out.println("Checkbox is : " + checkbox + "<br>");
%>
</body>
</html>
