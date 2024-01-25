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
<h2> 학점 계산 예제</h2>
<%
	int score = 83;

	// 조건문을 A,B,C,D,F로 판별하는 코드 구현
	
	// 성적 : 83
	// 학점 : B
	
	if(score >= 90){
		out.println(score +" 점으로 A등급입니다.");
	} else if(score < 90 && score >= 80){
		out.println(score +" 점으로 B등급입니다.");
	} else if(score > 80 && score >= 70){
		out.println(score +" 점으로 C등급입니다.");
	} else if(score > 70 && score >= 60){
		out.println(score +" 점으로 D등급입니다.");
	} else {
		out.println(score +" 점으로 F등급입니다.");
	}
	
%>


</body>
</html>