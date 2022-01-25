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
    <link rel="styleSheet" type="text/css" href="showMemo.css">
    <title>mainPage</title>
</head>
<body>
    <header id="header">
        <div class="header_div">
            <img class="header_icons" src="img/view.png">
            <div>
                2022
            <div>
            <img class="header_icons"  src="img/logout.png">
        </div>
    
    </header>

    <main id="main">
        <nav id="main_nav">
            <img onclick="selectDeate()" src="img/add.png">
            <div>
                <input id="user_select_date" type="date">
            </div>
        </nav>
        
        <div id="main_div">
        </div>
    
    </main>
    
    <script>
        function selectDeate() {//사용자가 날짜를 선택하고  + 아이콘을 누르면 이 함수가 실행 되기--> 새로운 div 하나 추가(날짜, 수정, 추가 아이콘 )
            var result=document.getElementById("main_div");
            var tempDate=document.getElementById("user_select_date");
            var userSelect=tempDate.value;
            console.log(userSelect);
            //동적 div 생성
            var newDiv=document.createElement("div");//div 생성
            console.log(newDiv);
            newDiv.id="date_memo";
            newDiv.style.backgroundColor="yellow";
            newDiv.style.width="500px";
            newDiv.style. height="100px";
            var spanDate=document.createElement("span");//div 생성
            spanDate.innerHTML=userSelect;
            newDiv.appendChild(spanDate);
            //main_div 인 곳에다 생성
            result.appendChild(newDiv);
                        
            
        }
    

    </script>
</body>
</html>