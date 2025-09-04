<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>First task</title>
</head>
<body>

<%!
	int id=1;
	String name="ahmed";
	
	String concat(int  id, String name){
		return id+" "+name;
	}
%>
<%	
out.print("Result is  "+"<h2>"+concat(id,name)+"</h2>");
 %>
<h2>Result is :<%= concat(id,name) %></h2>
</body>
</html>