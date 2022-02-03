<%@ page language="java" contentType="text/html" pageEncoding="utf-8"%>




<%
    String id="";
    String pw="";
    //String user_msg="";
    Cookie[] ck=request.getCookies();//서버에서 보낸 쿠기를 배열로 받아 옴  
    if(ck !=null){
            for(int i=0;i<ck.length;i++){ 
                if(ck[i].getName().equals("user_id")){ //저장된 쿠키 이름이 "user_id" 인 경우
                    id = ck[i].getValue(); //쿠키값을 가져 온다. 이 쿠키 값 
                    //session.setAttribute("id",id);//세션 아이디 생성 쿠키 값을  값으로 가지는 세션 생성 
                    //user_msg="님 반갑습니다."
                }
                /*if(ck[i].getName().equals("user_pw")){
                    pw=ck[i].getValue();
                }*/
		    }
    }
%>

<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
     <link rel="styleSheet" type="text/css" href="memo_css_file/schedule.css">
    <title>login Format</title>
</head>
<body>
    
    <form action="login.jsp" method="post">   
      <table>
            <tr>
                <td> 
                    <div id="log_id">
                        <img id="id_icon" class="login_icons" src="img/id.png">
                        <input id="log_id_input" class="user_input" type="text" name="user_id">
                    </div>
                </td>
            </tr>
            <tr>
                <td>
                    <div id="log_pw">
                        <img id="pw_icon" class="login_icons" src="img/pw.png">
                        <input id="log_pw_input" class="user_input" type="password" name="user_pw"> 
                    </div>
                 </td>
            </tr>
            <!--<tr>
                <td> 
                    <div id="log_check">
                        <%-- <img onclick="logCheck()" id="log_check_img" class="login_icons" src="img/loginCheck.png"> --%>
                        <input type="checkbox" name="log_checked" value="true">
                        <span id="long_check_text"> 로그인 유지 </span>
                    </div>
                </td>
            </tr> -->
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
        if("<%=id%>" !=null && "<%=pw%>" !=null){
            document.getElementById("log_id_input").value="<%=id%>";
            //document.getElementById("log_pw_input").value="<%=pw%>";
        }
    </script>
</body>
</html>