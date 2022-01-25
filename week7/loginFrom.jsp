<%@ page language="java" contentType="text/html" pageEncoding="utf-8"%>

<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
     <link rel="styleSheet" type="text/css" href="week7.css">
    <title>login Format</title>
</head>
<body>
    
    <form action="login.jsp" method="post">   
      <table>
            <tr>
                <td> <input id="id_value" type="text" name="user_id"></td>
            </tr>
            <tr>
                <td><input id="pw_value" type="password" name="user_pw">  </td>
            </tr>
            <tr>
                <td> <input id="long_btton" type="submit" value="로그인"></td>
               
            </tr>
            <tr>
                <td> 
                    <input class="user_td" type="button" value="회원가입" onclick="join()">
                    <input class="user_td" type="button" value="비밀번호 찾기">
                </td>
            </tr>
            <!-- onclick으로 jsp로 연결  -->
        </table>
    </form>

    <script>
        function join(){
            location.href="joinFormat.jsp";
        }
    </script>
</body>
</html>