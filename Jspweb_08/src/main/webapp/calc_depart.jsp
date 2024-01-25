<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import ="java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	
<h2>jsp에서 오라클에 접속하는 예제</h2>

   <%
      // 1 라이브러리 드라이버를 호출
      try {
         Class.forName("oracle.jdbc.driver.OracleDriver");
         out.println("라이브러리 로드성공");
      }catch(Exception e) {
         out.println("라이브러리 로드실패");
      }
   		
   	   out.println("<br>");
       // 라이브러리가 추가되면 서버를 보통 재기동
       
       // 접속관련 정보 저장
       Connection connection = null;
       Statement statement = null;
       ResultSet resultSet = null;
       
       // 2 접속
       // Oracle 데이터베이스 연결 정보 설정
       final String JDBC_URL = "jdbc:oracle:thin:@localhost:1521:orcl";
       final String USER = "jsp";
       final String PASSWORD = "123456";
       // 접속하기 
       try {
         connection = DriverManager.getConnection(JDBC_URL, USER, PASSWORD);
          out.println("jsp계정 접속성공");
       }catch(Exception e) {
          out.println("jsp계정 접속실패");
          
       }
       
       // SQL 쿼리 실행
       try {
          String sqlQuery = "select count(*) as CNT FROM DEPARTMENTS";
          statement = connection.createStatement();
          resultSet = statement.executeQuery(sqlQuery);
          
          while (resultSet.next()) {
        	   String total = resultSet.getString("CNT");

        	   out.println("<h2>총갯수: "+total+ "</h2>");
        	}
          }catch(SQLException e) {
    	   
    	   
          
       }
       
       
       
   %>

</body>
</html>