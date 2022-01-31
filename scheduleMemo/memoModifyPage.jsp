<%@ page language="java" contentType="text/html" pageEncoding="utf-8"%>
<%@ page import="java.sql.Connection"%>
<%@ page import="java.sql.PreparedStatement"%>
<%@ page import="java.sql.DriverManager"%>
<%@ page import="java.sql.ResultSet"%>

<%
   request.setCharacterEncoding("utf-8");
   String temp=request.getParameter("memo_num");
   String userSelectDate=request.getParameter("memo_date");
   String userSelectTime=request.getParameter("user_select_time");
   String id="";

    Cookie[] ck=request.getCookies();//서버에서 보낸 쿠기를 배열로 받아 옴  
    if(ck !=null){
            for(int i=0;i<ck.length;i++){ 
                if(ck[i].getName().equals("user_id")){ //저장된 쿠키 이름이 "user_id" 인 경우
                    id = ck[i].getValue(); //쿠키값을 가져 온다. 이 쿠키 값 
                    break;
                }
		    }
    }

    //db를 연결 하고  데이터 베이스에 있는 것을 가져와서 출력 해줄 것이다. 
    Class.forName("com.mysql.jdbc.Driver");//com,mysql.jdbc.Driver을 사용 할것 이다. 
    //사용할 데이터 베이스를 연결 해주기 
    Connection connect = DriverManager.getConnection("jdbc:mysql://localhost:3306/scheduleDB","schedule","1234");

    String sql= "SELECT * FROM memolist ";
    PreparedStatement query=connect.prepareStatement(sql);//연결한 데이터 베이스에다 sql을 보낸다.
    ResultSet result=query.executeQuery();//결과를 가져 오겠다 

%>
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="styleSheet" type="text/css" href="memoAdd_and_memoDelet.css">
    <title>mainPage</title>
</head>
<body>
    <header id="header">
        <div class="header_div">
            <img class="header_icons" src="img/view.png">
            <div>
                2022
            <div>
            <span><%=id%></span>
            <img class="header_icons"  src="img/logout.png">
        </div>
    
    </header>

    <main id="main">       
        <nav id="main_nav">
            
        </nav>

        <div id="main_center_div">
           <%-- 동적으로 추가 해주기 --%>

            <form action="memoAddDB.jsp" method="post">
                <input name="writeDate" value="<%=userSelectDate%>">
                <input name="user_id" value= "<%=id%>"> <!-- 이 값은 스타일로 안보이게 할것이다. -->
                <%-- <img src="img/memoadd.png" onclick="addMemo()"> --%>
                <hr>
                    <div id="main_from_div">
                        <input type="text" id="new_input" name="newMemoInput">
                        <input type="image" src="img/save.png"><!--image 타입은 submit 과 같이 이미지를 눌렀을때 서버에 내용을 보내준다. -->
                    </div>
                    <%-- <input type="submit" value=""> --%>
                   
            </form>
        </div>    
    </main>
    <script>
        function addMemo(){//+  버튼을 눌렀을때 input 태그가 생기고 사용자가 입력 할 수 있게 만들어 준다. 
            console.log("addmemo event ");
            
        }
    </script>
    
   </body>
</html>