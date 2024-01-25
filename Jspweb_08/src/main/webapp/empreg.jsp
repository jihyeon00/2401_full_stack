<%@page import="utils.DBConfig"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.SQLException"%>
<%@ page import ="utils.DBConfig.*" %>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%
   String empid = request.getParameter("empid");
   String name = request.getParameter("name");
   String job = request.getParameter("job");
   String contact = request.getParameter("contact");
   
   //오라클 DB와 접속
   Connection connection = null;
   PreparedStatement pstmt = null;
   
   // 접속하기
   try {
      // connection = DriverManager.getConnection(JDBC_URL, USER, PASSWORD);
      connection = DBConfig.getConnection();
      out.println("jsp계정 접속성공");
   } catch (Exception e) {
      out.println("jsp계정 접속실패");
   }

   // 폼 정보에서 받은 변수를 empid, name, email, contact 값
   try { // sql 문을 실행할 때 발생할 수 있는 예외들을 처리하기 위한 구문
      String sql = "INSERT INTO EMPLOYEES (EMPLOYEE_ID, LAST_NAME, JOB_ID, PHONE_NUMBER) VALUES (?,?,?,?)";
      pstmt = connection.prepareStatement(sql);
      pstmt.setString(1, empid);
      pstmt.setString(2, name);
      pstmt.setString(3, job);
      pstmt.setString(4, contact);
      
      int result = pstmt.executeUpdate();
      out.println("데이터 입력결과 : " + result);
      
   // 등록 성공 시 => 직원목록화면 emplist.jsp로 이동
      if(result==1) {
        out.println("<script>alert('직원 등록 성공')</script>");
        out.println("<script>location.href='emplist.jsp'</script>");
     } else {
        // 실패하면 다시 직원 등록 화면
        out.println("<script>location.href='empform.jsp'</script>");
     }

   } catch(SQLException se) {
      
   }

%>
   <h1>직원정보처리</h1>
   <p>사원번호 : <%= empid %></p>
   <p>이름 : <%= name %></p>
   <p>메일 : <%= job %></p>
   <p>연락처 : <%= contact %></p>
</body>
</html>