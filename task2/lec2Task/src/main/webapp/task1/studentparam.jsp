<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
first solve
<br> <br>
 your name is :
 ${param.name}
 <br> <br>
 your age is :
 ${param.age}
 <br> <br><br> <br><br> <br>
 second solve
 <br> <br>
 <%
    String name=request.getParameter("name");
 	String age=request.getParameter("age");
 	
 	out.println("your name is : "+name);
 	out.println("<br> <br>");
 	out.println("your age is : "+age);
 %>
 
</body>
</html>