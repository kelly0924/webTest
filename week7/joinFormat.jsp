<%@ page language="java" contentType="text/html" pageEncoding="utf-8"%>

<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="styleSheet" type="text/css" href="week7.css">
    <title>join page</title>
</head>
<body>

    <form action="userlist.jsp" method="post">
      <table>
            <tr>
                <td>아이디:</td>
                <td> <input class="user_inpout" type="text" name="user_id"></td>
            </tr>
            <tr>    
                <td>비밀번호:</td>
                <td><input class="user_inpout" type="text" name="user_pw"></td>
            </tr>
            <tr>
                <td>이름 : </td> 
                <td> <input class="user_inpout" type="text" name="user_name"> </td>
            </tr>
            <tr>    
                <td>전화 번호: </td>
                <td> <input class="user_inpout" type="text" name="user_phone"></td>
            </tr>
            <tr>
                <td> 이메일: </td>
                <td> <input class="user_inpout" type="text" name="user_email"> </td>
            </tr>
            <tr>
                <td> 주소: </td>
                <td> <input class="user_inpout" type="text" name="user_home"></td>
            <tr>   
        </table>

        <div id="join_div"> 
            <input id="join" type="submit" value="가입">
            <input id="cancel" type="button" value="취소" onclick="userCancel()">  
        </div>
       
    </form>

    <script>
        function userCancel(){
           location.href="joinFormat.jsp";//취소 버튼을 누르면 다시 회원 가입 폼으로 돌아 오기 
        }
    </script>
</body>
</html>