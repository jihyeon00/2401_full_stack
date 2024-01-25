<%@page import="java.util.concurrent.ExecutionException"%>
<%@page import="javax.security.auth.Subject"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="utils.DBConfig" %>
<%@ page import="java.sql.*" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

	<%
		String empName = request.getParameter("employeeName");
		String subject = request.getParameter("postTitle");
		String content = request.getParameter("postContent");
		
		// 디비 접속 (주의사항: import 먼저 해야 사용 가능)
		Connection connection = null;
		try {
			connection = DBConfig.getConnection();
			System.out.println("디비접속 성공- 게시글등록");
		}catch(Exception e) {
			System.out.println("에러로그:" + e.getMessage());
		}
		
		// 쿼리실행
		PreparedStatement pstmt = null;
		int result = 0;
		try {
			String sql = "INSERT INTO BO_FREE (name, subject, content) VALUES (?,?,?)";
			pstmt = connection.prepareStatement(sql);
			pstmt.setString(1, empName);
			pstmt.setString(2, subject);
			pstmt.setString(3, content);
			result = pstmt.executeUpdate();	// 1이면 성공, 0이면 실패
			System.out.println("게시글등록결과: "+ result);
			if(result == 1 ){		//성공시 board.jsp 로 이동
				out.println("<script>location.href ='board.jsp'</script>");
			}else{
				//실패해도 board.jsp로 이동(에러로그 남기고)
				out.println("<script>location.href ='board.jsp'</script>");
			}
		}catch(SQLException se){
			System.out.println("에러로그: " + se.getMessage());
			
		}
			
	%>

</body>
</html>