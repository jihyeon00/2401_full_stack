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
   <h2>사용자 인증 처리</h2>
   <%
      String empid = request.getParameter("employeeId");
      String userpw = request.getParameter("userPw");
      
      Connection connection = null;    		  // DB 접속 성공 시 접속 정보 저장
      // PreparedStatement pstmt = null;  	  // 쿼리를 실행하기 위한 객체 정보
      PreparedStatement ps = null;   		  // 쿼리를 실행하기 위한 객체 정보
      ResultSet rs = null;            		  // select 결과를 저장하는 정보
      
      // DB 접속
      try {
    	 connection = DBConfig.getConnection();
         System.out.println("접속 성공");
      } catch(Exception se) {
         System.out.println("접속 실패");
      }
      
      // 아이디 비밀번호 체크 코드
      int result = 0;
      try {
         String sql = "SELECT COUNT(*) AS CNT FROM EMPLOYEES WHERE EMPLOYEE_ID=? AND USER_PW=?";
         ps = connection.prepareStatement(sql);
         ps.setInt(1, Integer.valueOf(empid));
         ps.setString(2, userpw);
         rs = ps.executeQuery();   // executeQuery: Select 경우
         
         while(rs.next()) {
            result = rs.getInt("CNT");
            System.out.println("결과 result: " + result);   // 1이면 id/pw가 존재, 아니면 존재하지 않음
         }
         
         if(result == 1){	// 로그인 성공 -> main.jsp
        	 out.println("<script>location.href='main.jsp' </script>");
         } else {	// 로그인 실패 => loginform.jsp
        	 out.println("<script>location.href='loginform.jsp' </script>");
         }
      } catch(SQLException se) {
         
      }
      
   %>
   
   <% //System.out.println("empid = "+ empid); %>
   <br>
   <% //System.out.println("userpw = "+ userpw); %>
</body>
</html>