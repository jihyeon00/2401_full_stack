<%@ page import="java.util.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h2>jsp를 사용하여 테이블 구현</h2>
	<%
		ArrayList<String> name = new ArrayList<>();
		name.add("김상완");
		name.add("배승재");
		name.add("승지우");
		ArrayList<String> departName = new ArrayList<String>();
		departName.add("기획팀");
		departName.add("개발팀");
		departName.add("보안팀");
		
		out.println("<table border='1'>");
		out.println("<tr>");
		out.println("<th>직원명</th>");
		out.println("<th>부서명</th>");
		out.println("<tr>");
		
		// 배열에서는 length를 사용하지만
		// 자바에서는 객체라는 개념을 많이 사용하여 size()를 사용한다.
		for(int i=0;i<name.size();i++){
		out.println("<tr>");
		out.println("<td>"+ name.get(i) + "</td>");
		out.println("<td>"+ departName.get(i) + "</td>");
		out.println("<tr>");
		}
		
		out.println("</table>");
		
	%>
</body>
</html>