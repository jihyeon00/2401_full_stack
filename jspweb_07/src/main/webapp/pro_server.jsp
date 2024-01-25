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
    // 폼 데이터 수신
    String name = request.getParameter("name");
    String email = request.getParameter("email");

    // 폼 데이터 출력
    out.println("<h2>폼 데이터 출력 결과</h2>");
    out.println("<p>이름: " + name + "</p>");
    out.println("<p>Email: " + email + "</p>");
%>
</body>
</html>