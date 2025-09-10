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
  	String s1=request.getParameter("fav");
 if(s1!=null){
 	Cookie c1=new Cookie("items",s1);
 	c1.setMaxAge(30);
	 response.addCookie(c1);
	 }
  
	    Cookie[] cookies = request.getCookies();
        for(Cookie c:cookies){
        	if(c.getName().equals("items")){
        		out.print(c.getValue()+"<br><br>");
            	break;
        	}
        }
 %>
</body>
</html>