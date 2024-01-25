<%@page import="utils.DBConfig"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!-- DB 접속 -->    
<%@ page import ="java.sql.*" %>
<%@ page import ="utils.DBConfig.*" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

	<% 
		// 웹서버에 jsp로 클라이먼트 폼정보를 받는 기둥
		String departid = request.getParameter("departid");
		String name = request.getParameter("name");
		String location = request.getParameter("location");
		String contact = request.getParameter("contact");
		
		// 오라클 DB와 접속
	    Connection connection = null;
		PreparedStatement pstmt = null;

		
		// 접속하기
       try {
          connection = DBConfig.getConnection();
          out.println("jsp계정 접속성공");
       	} catch (Exception e) {
          out.println("jsp계정 접속실패");
        }
		
		// 폼정보에서 받은 변수는 departid, name, location, contact 값
		try{ // sql문을 실행할 때 발생할 수 있는 예외들을 처리하기 위한 구문
			String sql = "INSERT INTO DEPARTMENTS(DEPART_ID, DEPART_NAME, LOCATION, PHONE_NUMBER) VALUES(?,?,?,?)";
			pstmt = connection.prepareStatement(sql);
			pstmt.setString(1, departid);
			pstmt.setString(2, name);
			pstmt.setString(3, location);
			pstmt.setString(4, contact);
			
			int result = pstmt.executeUpdate();
			out.println("데이터입력 결과: " + result);
			
			  // 등록 성공 시 => 직원목록화면 emplist.jsp로 이동
		      if(result==1) {
		        out.println("<script>alert('부서 등록 성공')</script>");
		        out.println("<script>location.href='departList.jsp'</script>");
		     } else {
		        // 실패하면 다시 직원 등록 화면
		        out.println("<script>location.href='departform.jsp'</script>");
		     }

		   } catch(SQLException se) {
		      
		   }
		
		
	%>

   <h1>부서정보처리</h1>
   <p>부서번호 : <%= departid %></p>
   <p>부서명 : <%= name %></p>
   <p>거주지 : <%= location %></p>
   <p>연락처 : <%= contact %></p>
	
	

		

</body>
</html>