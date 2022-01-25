<%@ page language="java" contentType="text/html" pageEncoding="utf-8"%>

<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
     <link rel="styleSheet" type="text/css" href="schedule.css">
    <title>login Format</title>
</head>
<body>
    
    <form action="login.jsp" method="post">   
      <table>
            <tr>
                <td> 
                    <div id="log_id">
                        <img id="id_icon" class="login_icons" src="img/id.png">
                        <input class="user_input" type="text" name="user_id">
                    </div>
                </td>
            </tr>
            <tr>
                <td>
                    <div id="log_pw">
                        <img id="pw_icon" class="login_icons" src="img/pw.png">
                        <input class="user_input" type="password" name="user_pw"> 
                    </div>
                 </td>
            </tr>
            <tr>
                <td> 
                    <div id="log_check">
                        <%-- <img onclick="logCheck()" id="log_check_img" class="login_icons" src="img/loginCheck.png"> --%>
                        <input type="checkbox" name="log_checked" value="true">
                        <span id="long_check_text"> 로그인 유지 </span>
                    </div>
                </td>
            </tr>
             <tr>
                <td> <input id="long_btton" type="submit" value="로그인"></td>
            </tr>
            <tr>
                <td> 
                    <div id="join_link">
                        <a href="joinFormat.jsp">회원가입</a>
                    </div>
                </td>
            </tr>
            <!-- onclick으로 jsp로 연결  -->
        </table>
    </form>

    <script>
    
    </script>
</body>
</html>