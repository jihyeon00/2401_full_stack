<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="utils.DBConfig" %> <!--  다른 경로의 자바 파일 호출 -->
<%@ page import="java.sql.*" %> <!-- 오라클 쿼리를 동작하기 위한 라이브러리 호출 -->
<%@ page import="vo.BoardVo" %> <!-- 게시글 한개 정보들 -->
<%@ page import="java.util.*" %>  <!-- 게시글 목록 ArrayList -->      
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f4f4f4;
            margin: 0;
            padding: 0;
        }

        .board-container {
            max-width: 800px;
            margin: 20px auto;
            background-color: #fff;
            padding: 20px;
            border-radius: 8px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
        }

        .board-item {
            border-bottom: 1px solid #ddd;
            padding: 10px 0;
            display: flex;
            justify-content: space-between;
            align-items: center;
        }

        .board-item:last-child {
            border-bottom: none;
        }

        .board-item a {
            text-decoration: none;
            color: #333;
        }

        .board-item .bbshead {
            text-align: center;
            background-color: #333;
            font-weight: bold;
            color: white;
            padding: 10px;
        }
        .board-item .bbshead a{
            color: white;
        }
        .board-item .number {
            flex: 1;
            text-align: center;
        }

        .board-item .title {
            flex: 4;
        }

        .board-item .author {
            flex: 2;
            text-align: center;
        }

        .board-item .views {
            flex: 1;
            text-align: center;
        }

        .add-button {
            display: block;
            margin: 20px auto;
            padding: 10px;
            background-color: #4caf50;
            color: #fff;
            text-decoration: none;
            text-align: center;
            border-radius: 4px;
        }

        .add-button:hover {
            background-color: #45a049;
        }
    </style>
</head>
<body>
   <!-- 헤더영역 공통부분 -->
   <%@ include file="header.jsp" %>
   <!-- 헤더영역 공통부분 끝 -->
   
   <%
      // 디비접속 (주의사항: import 먼저해야 사용가능)
      Connection connection = null;
      try {
         connection = DBConfig.getConnection();
         System.out.println("디비접속 성공-게시글목록");
      }catch(Exception e) {
         System.out.println("에러로그: " + e.getMessage());
      }
      
      // 게시판(BO_FREE) 데이터 검색
      ResultSet resultSet = null;
      PreparedStatement pstmt = null;
      ArrayList<BoardVo> boardList = new ArrayList<>();
      try {
         String sql = "SELECT NUM, SUBJECT, NAME, HIT FROM BO_FREE ORDER BY NUM DESC";
         // WHERE 가 추가
         pstmt = connection.prepareStatement(sql);
         // 조건이 있으면 pstmt.setString() 추가
         resultSet = pstmt.executeQuery(); // executeQuery: Select 경우
         while(resultSet.next()) {
            BoardVo board = new BoardVo();
            board.setNum(resultSet.getInt("NUM"));
            board.setSubject(resultSet.getString("SUBJECT"));
            board.setName(resultSet.getString("NAME"));
            board.setHit(resultSet.getInt("HIT"));
            boardList.add(board); // 전체목록
         }
      }catch(SQLException se) {
         System.out.println("에러로그: " + se.getMessage());
      }
   %>
   
   <div class="board-container">
    <h2>게시판 목록</h2>
   
       <div class="board-item">
           <div class="bbshead number">번호</div>
           <div class="bbshead title"><a href="#">제목</a></div>
           <div class="bbshead author">작성자</div>
           <div class="bbshead views">조회수</div>
       </div>
       
       <!-- 반복내용 -->
       <%
       for(int i=0; i<boardList.size(); i++) {
          BoardVo boardTemp = boardList.get(i);
       %>
       <div class="board-item">
           <div class="number"><%= boardTemp.getNum() %></div>
           <div class="title"><a href="readbbs.jsp?num=<%= boardTemp.getNum() %>"><%= boardTemp.getSubject() %></a></div>
           <div class="author"><%= boardTemp.getName() %></div>
           <div class="views"><%= boardTemp.getHit() %></div>
       </div>   
       <%
       }
       %>    
       <!-- 추가적인 게시물 목록은 필요에 따라 반복해서 추가 -->
   
       <a href="writeform.jsp" class="add-button">새 게시물 작성</a>
   </div>
</body>
</html>