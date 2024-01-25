<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h2>폼 데이터 전송화면</h2>
	
	<!-- get 은 파라미터 name과 email의 값을 보낼 경우 사용한다.-->
	<form action="pro_server.jsp" method="get">
		<p>
			<label>이름: </label>
			<input type="text" name="name">
		</p>
	
		<p>
			<label>이메일: </label>
			<input type="text" name="email">
		</p>
		
		<p>
			<input type="submit" value="전송">
		</p>
	
	
	
	</form>
</body>
</html>