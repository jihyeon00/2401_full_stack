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
	<h2>간단한 연산 결과 출력</h2>

	<!-- 자바 코드 -->
	<%
		int num1 = 32;
		int num2 = 16;
	
		// 더하기, 빼기, 곱하기, 나누기 수행
		double sum = num1 + num2;
		double difference = num1 - num2;
		double product = num1 * num2;
		double quotient = (num2 != 0) ? num1 / num2 : Double.POSITIVE_INFINITY;
	
	%>
	
	<h2>계산 결과:</h2>
    <p><%= num1 %> + <%= num2 %> = <%= sum %></p>
    <p><%= num1 %> - <%= num2 %> = <%= difference %></p>
    <p><%= num1 %> * <%= num2 %> = <%= product %></p>
    <p><%= num1 %> / <%= num2 %> = <%= quotient %></p>
</body>
</html>