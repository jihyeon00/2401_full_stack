<%@page import="java.util.ArrayList"%>
<%@page import="utils.DBConfig"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<!-- DB 접속 -->    
<%@ page import ="java.sql.*" %>
<%@ page import ="utils.DBConfig.*" %>
<%@ page import ="java.util.*" %>
<%@ page import ="vo.DepartVo" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>

	/* 직원 목록 */
   body {
      font-family: Arial, sans-serif;
      background-color: #f2f2f2;
      margin: 0;
      padding: 0;
      display: flex;
      justify-content: center;
      align-items: center;
      height: 100vh;
   }
   .department-list {
      background-color: #fff;
      padding: 20px;
      border-radius: 5px;
      box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
   }

   table {
      width: 100%;
      border-collapse: collapse;
      margin-top: 20px;
   }

   th, td {
      border: 1px solid #ddd;
      padding: 10px;
      text-align: left;
   }

   th {
      background-color: #3498db;
      color: #fff;
   }


</style>
</head>
<body>
		<%
	      // 오라클 디비와 접속
	      Connection connection = null;      
	      // 접속하기 
	      try {
	        //connection = DriverManager.getConnection(JDBC_URL, USER, PASSWORD);
	          connection = DBConfig.getConnection();
	          System.out.println("jsp계정 접속성공");
	      }catch(Exception e) {
	          out.println("jsp계정 접속실패");        
	      }   
	      
	      // 직원정보 목록을 가져오는 쿼리 실행
	      PreparedStatement pstmt = null;
	      ResultSet resultSet = null; 		// select 된 결과를 저장하는 배열
	      ArrayList<DepartVo> departList = new ArrayList<>(); // 상단에 @ page import ="java.util.*"
	      
	      
	      try{
	    	  String sql = "SELECT DEPART_ID, DEPART_NAME, LOCATION, PHONE_NUMBER FROM DEPARTMENTS";
	    	  pstmt = connection.prepareStatement(sql);
	    	  resultSet = pstmt.executeQuery();	 
	    	 
	    	  while(resultSet.next()){
	    		  DepartVo departvo = new DepartVo(); //  @ page import ="vo.*"	
	    		  departvo.setDepart_id(resultSet.getString("depart_id"));
	    		  departvo.setDepart_name(resultSet.getString("depart_name"));
	    		  departvo.setLocation(resultSet.getString("location"));
	    		  departvo.setPhone_number(resultSet.getString("phone_number"));
	    		 
	    		  departList.add(departvo);

	    	  }
	    	  
	      	  System.out.println("총갯수: " + departList.size());
	     }catch(SQLException se){
	    	  System.out.println("에러로그:부서목록== >" + se.getMessage());  
	     }
	      
	   %>
	   
 <div class=department-list>
        <h2>부서 목록</h2>
        <button onclick="handleAddButtonClick()">부서 등록</button> <!-- 등록 버튼 추가 -->
        <table>
            <thead>
            <tr>
            <th>부서번호</th>
                <th>부서명</th>
                <th>거주지</th>
                <th>연락처</th>
                <th>동작</th> <!-- 새로운 열 추가 -->
                
            </tr>
            </thead>
            <tbody>
            <%
            	for(int i = 0; i<departList.size(); i++){
            		DepartVo temp = departList.get(i);
            %>
            <tr>
            	<td><%= temp.getDepart_id() %></td>
                <td><%= temp.getDepart_name() %></td>
                <td><%= temp.getLocation() %></td>
                <td><%= temp.getPhone_number() %></td>
                <td><button onclick="handleButtonClick(0)">수정 처리</button> <!-- 버튼 추가 -->
                <button onclick="handleButtonClick(0)">삭제 처리</button><!-- 버튼 추가 -->
                
                </td> <!-- 상세보기 버튼 추가 -->
                    
                 <!-- 상세보기 버튼 추가 -->
                
            </tr>
            <%
            	 	}
            %>
            <!-- 다른 부서들의 정보도 추가할 수 있습니다. -->
            </tbody>
        </table>
    </div>
    
    <script>
      function handleAddButtonClick() {
           location.href="departform.jsp";
       }
   </script>

</body>
</html>