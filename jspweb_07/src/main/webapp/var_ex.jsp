<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ page import="java.util.*" %>  
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%-- 문자열 출력 --%>
    <h1>Hello, JSP!</h1>

    <%-- 숫자 출력 --%>
    <% 
        int number = 123;
        out.println("<p>Number: " + number + "</p>");
    %>
</body>
</html>