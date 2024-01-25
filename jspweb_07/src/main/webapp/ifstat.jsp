<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h2>조건문 예제</h2>
	
	<%
		// 사용자의 나이 변수 설정
		int age = 25;
		
		// 조건문을 사용하여 나이에 따른 환영 메세지 출력
		if (age < 18) {
			out.println("<p>안녕하세요! 어린이 여러분!</p>");
		} else if(age >= 18 && age < 30) {
			out.println("<p>안녕하세요! 젊은이 여러분!</p>");
		} else {
			out.println("<p>안녕하세요! 성인 여러분!</p>");
		}
	%>
</body>
</html>