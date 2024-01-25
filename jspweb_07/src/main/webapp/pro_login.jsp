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
	String userId = request.getParameter("userId");
	String password = request.getParameter("password");
	
	// 데이터 출력
	out.println("<h2>폼 데이터 출력 결과</h2>");
	out.println("<p>아이디: "+ userId +"</p>");
	out.println("<p>비밀번호: "+ password +"</p>");
	%> 
</body>
</html>