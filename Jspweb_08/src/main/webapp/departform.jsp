<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
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
    .department-form {
        background-color: #fff;
        padding: 20px;
        border-radius: 5px;
        box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
    }
    form {
        display: flex;
        flex-direction: column;
    }
    label {
        margin-bottom: 5px;
    }
    input {
        padding: 8px;
        margin-bottom: 10px;
        border: 1px solid #ccc;
        border-radius: 3px;
    }
    button {
        background-color: #3498db;
        color: #fff;
        padding: 10px;
        border: none;
        border-radius: 3px;
        cursor: pointer;
    }
    button:hover {
        background-color: #217dbb;
    }
</style>
</head>
<body>
   <div class="department-form">
    <h2>부서 정보 등록</h2>
    <form id="departmentForm" action="departreg.jsp">
      <label for="departid">부서번호:</label>
        <input type="text" id=departid name="departid" required>
      
        <label for="name">부서명:</label>
        <input type="text" id="name" name="name" required>

        <label for="location">거주지:</label>
        <input type="text" id="location" name="location" required>

        <label for="contact">연락처:</label>
        <input type="text" id="contact" name="contact" required>

        <button type="submit">등록</button>
    </form>
    <script src="js/jquery-3.7.1.min.js"></script>
    <script>
       $(document).ready(function () {
       // 폼 제출 이벤트 처리
       $('#departmentForm').submit(function (event) {
         //  event.preventDefault();
   
           // 입력된 값 가져오기
           var departid = $('#departid').val();
           var name = $('#name').val();
           var location = $('#location').val();
           var contact = $('#contact').val();
   
           // 간단하게 콘솔에 출력 (실제로는 서버에 전송하거나 다른 작업 수행)
           console.log('부서번호:', departid);
           console.log('부서이름이름:', name);
           console.log('거주지:', location);
           console.log('연락처:', contact);
          });
      });
</script>
</div>
</body>
</html>