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
      margin: 0;
      padding: 0;
      background-color: #f4f4f4;
    }

    .top-menu {
      background-color: #333;
      color: #fff;
      padding: 10px 20px;
      display: flex;
      justify-content: space-between;
      align-items: center;
    }

    .logo {
      font-size: 24px;
      font-weight: bold;
    }

    .login-menu {
      display: flex;
      align-items: center;
    }
    .login-menu li {
        display: inline-block;
        margin: 5px;
    }

    .login-menu a {
      color: #fff;
      text-decoration: none;
      margin-left: 20px;
      font-weight: bold;
    }

    .login-menu button {
      background-color: #4caf50;
      color: #fff;
      border: none;
      padding: 8px 15px;
      border-radius: 4px;
      cursor: pointer;
    }

    .login-menu button:hover {
      background-color: #45a049;
    }
  </style>
</head>
<body>

	<div class="top-menu">
	    <div class="logo">휴먼교육(주)</div>
	    <div class="login-menu">
		      <li><a href="#">Home</a></li>
		      <li><a href="#">About</a></li>
		      <li><a href="board.jsp">Board</a></li>
		      <li><button onclick="showLoginModal()">로그인</button></li>
	    </div>
	  </div>
	  
	  <script>
	  	function showLoginModal() {
	  		location.href ='loginform.jsp';
	  	}

	  </script>
	  
	  	  
	  

</body>
</html>