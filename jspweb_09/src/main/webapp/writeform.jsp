<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
      max-width: 600px;
      margin: 50px auto;
      background-color: #fff;
      padding: 20px;
      border-radius: 8px;
      box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
    }

    h2 {
      text-align: center;
      color: #333;
    }

    form {
      display: flex;
      flex-direction: column;
    }

    label {
      margin-bottom: 8px;
      color: #333;
    }

    input, textarea {
      padding: 10px;
      margin-bottom: 16px;
      border: 1px solid #ccc;
      border-radius: 4px;
    }

    textarea {
      resize: vertical;
      height: 100px;
    }

    input[type="file"] {
      margin-bottom: 16px;
    }

    button {
      background-color: #4caf50;
      color: #fff;
      padding: 10px 15px;
      border: none;
      border-radius: 4px;
      cursor: pointer;
    }

    button:hover {
      background-color: #45a049;
    }
  </style>
</head>
<body>


	<!-- 헤더영역 공동부분 -->
	<%@ include file ="header.jsp" %>
	<!-- 헤더영역 공동부분 끝 -->
	
	<div class="container">
	    <h2>게시글 작성 폼</h2>
	    <form action="writepro.jsp" method="GET">
	      <label for="employeeName">이름:</label>
	      <input type="text" id="employeeName" name="employeeName" required>
	
	      <label for="postTitle">제목:</label>
	      <input type="text" id="postTitle" name="postTitle" required>
	
	      <label for="postContent">내용:</label>
	      <textarea id="postContent" name="postContent" required></textarea>
		
	      <button type="submit">게시글 작성</button>
	    </form>
	  </div>
		

</body>
</html>