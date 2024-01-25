<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="utils.DBConfig" %> <!--  다른 경로의 자바 파일 호출 -->
<%@ page import="java.sql.*" %> <!-- 오라클 쿼리를 동작하기 위한 라이브러리 호출 -->
<%@ page import="vo.BoardVo" %> <!-- 게시글 한개 정보들 -->
    
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

    .container {
      max-width: 800px;
      margin: 50px auto;
      background-color: #fff;
      padding: 20px;
      border-radius: 8px;
      box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
    }

    h2, h3, p {
      color: #333;
    }

    .meta-info {
      margin-bottom: 20px;
    }

    .meta-info span {
      font-weight: bold;
    }

    .content {
      line-height: 1.6;
    }

    .back-link {
      display: flex;
      justify-content: center;
      margin-top: 20px;
    }

    .back-link button {
      background-color: #4caf50;
      color: #fff;
      padding: 10px 15px;
      border: none;
      border-radius: 4px;
      cursor: pointer;
    }

    .back-link button:hover {
      background-color: #45a049;
    }

    .comments-section {
      margin-top: 30px;
      border-top: 1px solid #ccc;
      padding-top: 20px;
    }

    .comment-form {
      margin-bottom: 20px;
    }

    .comment-form textarea {
      width: 100%;
      padding: 10px;
      margin-bottom: 10px;
      border: 1px solid #ccc;
      border-radius: 4px;
    }

    .comment-list {
      list-style: none;
      padding: 0;
    }

    .comment {
      border-bottom: 1px solid #ccc;
      padding: 10px 0;
    }

    .attachment {
      margin-top: 20px;
    }

    .attachment a {
      display: block;
      color: #4caf50;
      text-decoration: none;
      font-weight: bold;
      margin-top: 10px;
    }

    .attachment a:hover {
      text-decoration: underline;
    }

    .delete-button {
      background-color: #f44336;
      color: #fff;
      padding: 10px 15px;
      border: none;
      border-radius: 4px;
      cursor: pointer;
      margin-top: 10px;
    }

    .delete-button:hover {
      background-color: #d32f2f;
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
         System.out.println("디비접속 성공-게시글읽기");
      }catch(Exception e) {
         System.out.println("에러로그: " + e.getMessage());
      }
      
      // 쿼리 실행해서 결과 가져오기
      String num = request.getParameter("num");		// board.jsp에서 번호를 넘겨주는 
      ResultSet resultSet = null;
      PreparedStatement pstmt = null;
      BoardVo board = new BoardVo();
      try {
         String sql = "SELECT NUM, SUBJECT, NAME, TO_CHAR(REGDATE, 'YYYY-MM-DD') AS REGDATE, CONTENT FROM BO_FREE WHERE NUM=?";
         // WHERE 가 추가
         pstmt = connection.prepareStatement(sql);
         // 조건이 있으면 pstmt.setString() 추가
         pstmt.setString(1, num);
         resultSet = pstmt.executeQuery(); // executeQuery: Select 경우
         while(resultSet.next()) {
            // 지역변수 일때만
            board.setNum(resultSet.getInt("NUM"));
            board.setSubject(resultSet.getString("SUBJECT"));
            board.setName(resultSet.getString("NAME"));
            board.setRegdate(resultSet.getString("REGDATE"));
            board.setContent(resultSet.getString("CONTENT"));
         }
      }catch(SQLException se) {
         System.out.println("에러로그: " + se.getMessage());
      }
   %>
   
   <div class="container">
    <h2><%= board.getSubject() %></h2>
    <div class="meta-info">
      <span>작성자:</span><%= board.getName() %><br>
      <span>작성일:</span> 2024-01-14
    </div>
    <div class="content">
      <p>게시글 내용이 여기에 들어갑니다. Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed ac elit sit amet nunc tincidunt facilisis. Nulla facilisi.</p>
    </div>
 <div class="back-link">
      <button onclick="goBack()">목록으로 돌아가기</button>
    </div>

    <!-- 댓글 섹션 시작 -->
    <div class="comments-section">
      <h3>댓글</h3>

      <!-- 댓글 작성 폼 -->
      <div class="comment-form">
        <textarea id="commentText" placeholder="댓글을 작성하세요"></textarea>
        <button onclick="postComment()">댓글 작성</button>
      </div>

      <!-- 댓글 목록 -->
      <ul class="comment-list">
        <li class="comment">댓글 1: 여기에 댓글 내용이 들어갑니다.</li>
        <li class="comment">댓글 2: 다른 사용자의 댓글 내용이 들어갑니다.</li>
      </ul>
    </div>
    <!-- 댓글 섹션 끝 -->

    <!-- 삭제 버튼 -->
    <button class="delete-button" onclick="deletePost()">게시글 삭제</button>

  </div>
  
     <script>
        function goBack() {
           location.href='board.jsp';
        }
     </script>
</body>
</html>