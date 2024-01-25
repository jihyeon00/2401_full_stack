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
<%
	out.println("<h2>테이블에 데이터를 넣는 예제</h2>");
%>

<%
    // 사용자 리스트 (가정)
    ArrayList<String> userList = new ArrayList<>();
    userList.add("사용자1");
    userList.add("사용자2");
    userList.add("사용자3");

    // 테이블 시작
    out.println("<table border='1'>");

    // 테이블 헤더
    out.println("<tr>");
    out.println("<th>ID</th>");
    out.println("<th>이름</th>");
    out.println("</tr>");

    // 사용자 리스트를 테이블에 추가
    int index = 0;
    for (String user : userList) {
        out.println("<tr>");
        out.println("<td>" + index + "</td>");
        out.println("<td>" + user + "</td>");
        out.println("</tr>");
        index++;
    }

    // 테이블 종료
    out.println("</table>");
%>

</body>
</html>