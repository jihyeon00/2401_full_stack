<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<style>
	table {
		text-align: center;
	}
	#headTr{
		background-color: skyblue;
	}
</style>
<body>
	<h1>구구단</h1>
	<%
		out.println("<table border ='1'>");
		
		out.println("<tr id='headTr'>");
		for(int i = 2; i<=9;i++){
				out.println("<td>"+ i +"단</td>");
			}
		out.println("</tr>");
		out.println("<tr>");
		for(int i = 1; i<=9;i++){
			out.println("<tr>");
			for(int j=2;j<=9;j++){
				out.println("<td>"+ j + "*" + i + "=" + i*j +"</td>");
			}
			out.println("</tr>");
		}
		out.println("</tr>");
		
		
		out.println("</table>");
	%>
</body>
</html>