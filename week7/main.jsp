<%@ page language="java" contentType="text/html" pageEncoding="utf-8"%>

<%
    String id="";
    String user_msg="";
    Cookie[] ck=request.getCookies();//서버에서 보낸 쿠기를 배열로 받아 옴  

    if(ck !=null){
            for(int i=0;i<ck.length;i++){ 
                if(ck[i].getName().equals("user_id")){ //저장된 쿠키 이름이 "user_id" 인 경우
                    id = ck[i].getValue(); //쿠키값을 가져 온다. 이 쿠키 값 
                    //session.setAttribute("id",id);//세션 아이디 생성 쿠키 값을  값으로 가지는 세션 생성 
                    user_msg="님 반갑습니다.";
                    break;
                }
		    }
    }

    //세션 값 가져 오기 
   // String session_id =(String)session.getAttribute("id");//이름이 id 세션을 불러 오겠다.

%>

<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="styleSheet" type="text/css" href="week7.css">
    <title>mainPage</title>
</head>
<body>

    <div class="main_div">
        <p><%=id%><%=user_msg%></p>
        <%-- <%=session_id%>님 로그인 되엇습니다. --%>
        <input class="main_logButton" type="button" value="로그인" onclick="login()">
        <input class="logout_botton" type="button" value="로그 아웃" onclick="logout()">
    </div>

    
    <script>
        // var userInfor= document.getElementByid("user_id_div");
        function login(){
            location.href="loginFrom.jsp";
        }
        function logout(){
            location.href="logout.jsp";
        }

        //    window.onload=function(){
        //        if(id==null){
        //            alert("로그인이 필요합니다.");
        //         }else{
        //             alert("<%=id%>님 반갑습니다.");
        //         }
        //    }

        // var user_id="<%=id%>";//id 값을 가져온다. 
        // if(user_id==null){
        //     document.getElementByid("user_id").innerHTML="로그인 해주세요";
        // }else{
        //     //document.getElementByid("user_id").innerHTML=user_id + "님 반갑습니다.";
         
        // }


    </script>
</body>
</html>