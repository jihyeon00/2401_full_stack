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
	<h2>간단한 연산 예제</h2>
	<%
		int apples = 232; // 갯수
		int cntperbox = 20; // 사과 박스에 20개씩 담을 수 있음
		// 사과박스 몇 개 필요한가?
		int totalBox = apples / cntperbox;
		// 남는 사과의 갯수는 몇개인가?
		int mod = apples % cntperbox;
				
	%>
	
	<p>총 사과 갯수 : <%= apples %> 개</p>
	<p>박스 갯수 : <%= totalBox %> 개</p>
	<p>남은 사과 갯수 : <%= mod %> 개</p>

</body>
</html>