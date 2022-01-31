<%@ page language="java" contentType="text/html" pageEncoding="utf-8"%>
<%@ page import="java.sql.Connection"%>
<%@ page import="java.sql.PreparedStatement"%>
<%@ page import="java.sql.DriverManager"%>
<%@ page import="java.sql.ResultSet"%>
<%@ page import="java.util.*"%>


<%   
    request.setCharacterEncoding("utf-8");
    String id="";
    String user_msg="";
    int size=0;
    ArrayList<ArrayList<String>> datas = new ArrayList<ArrayList<String>>();
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

    //db를 연결 하고  데이터 베이스에 있는 것을 가져와서 출력 해줄 것이다. 
    Class.forName("com.mysql.jdbc.Driver");//com,mysql.jdbc.Driver을 사용 할것 이다. 
    //사용할 데이터 베이스를 연결 해주기 
    Connection connect = DriverManager.getConnection("jdbc:mysql://localhost:3306/scheduleDB","schedule","1234");

    String sql= "SELECT * FROM memolist";
    PreparedStatement query=connect.prepareStatement(sql);//연결한 데이터 베이스에다 sql을 보낸다.
    ResultSet result=query.executeQuery();//결과를 가져 오겠다 

    while(result.next()){
        // 1차원 배열을 먼저 넣어 주고 
        ArrayList<String> one_data = new ArrayList<String>();
        String number= String.valueOf(result.getInt(1));
        one_data.add("'" + number + "'");
        one_data.add("'" + result.getString(2) + "'");
        one_data.add("'" + result.getString(3) + "'");  // jsp에서 정의된 자료형을 js에서는 알아볼 수 없기 때문에, 강제로 따옴표를 통해 String 처리를 해준다.
                                                    
        // 2차원 배열에 1차원 배열을 넣어 준다. 
        datas.add(one_data);
        size++;
    }
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
            </div>
            <img class="header_icons"  src="img/logout.png" onclick="logoutFun()">
            <span><%=id%><%=user_msg%></span>
        </div>
    
    </header>

    <main id="main">

        <nav id="main_nav">
            <form action="memoAddpage.jsp" method="post">
                <%-- <img onclick="selectDeate()" src="img/add.png"> --%>
                <div id="main_div_input">
                    <input id="user_select_date" type="date" name="user_select_date">
                    <input id="user_select_time" type="time" name="user_select_time"> 
                </div>
                <input id="main_div_sumit" type="submit" value="+">
             </form>    

        </nav>
       
        <form id="Delet_form" action="memoDelet.jsp" method="post">
           
            <div id="main_div">
              <%-- 동적으로 추가 해주기 --%>
              <%-- <input name="test" value="test"> --%>
        
            </div>
        </form>    
    
    </main>
    
    <script>
        window.onload = function() {   // 데이터베이스에서 jsp를 통해 가져온 값을 처음에 화면에 뿌려주는 역할

            var list = <%=datas%>;

            for(var i=0; i<<%=size%>; i++){   // jsp 변수를 string 타입으로 사용하고 싶을 때만 ""을 붙여주면 된다.
          
                var cnt=[];
                var result=document.getElementById("main_div");
                //동적 div 생성
                var newDiv=document.createElement("div");//div 생성
                // console.log(newDiv);
                newDiv.id="main_div_div";
                newDiv.style.backgroundColor="yellow";
                newDiv.style.width="500px";
                newDiv.style. height="100px";
                newDiv.innerHTML=list[i];
                result.appendChild(newDiv);

                //main_div 인 곳에다 생성
                var deletButton=document.createElement("input");
                deletButton.type="button";
                deletButton.value="delet";
                deletButton.className="delet_button";

                // 기초과정에서는 원래 비동기 처리까지 배우진 않지만, 아래 용법은 addEventListner가 비동기처리라서 발생하는 문제
                // 반복문과 비동기처리를 같이 사용하다 보니깐, 반복문이 다 지나가고 나서 그제서야 위 list 변수를 참조하게 된다.
                // 이미 그 시점에는 list를 끝까지 다 돌고 더이상 데이터가 남아있지 않기 때문에, 중간에 tmpNum이라는 변수를 만들어서 중간 값을 저장해 두는 형태이다.

                // var tmp로 했을 때, 마지막 값만 계속해서 출력되는 이유는 js의 호이스팅 문제 때문이다.
                // 호이스팅은 원래, 개발자들이 쉽게 개발을 하라고 만들어 둔 기능이지만, 결국 이것 때문에 유지보수가 개판이 된다.
                // 따라서, var tmp가 반복문의 밖에 선언이 되게 되고, for의 결과 가장 마지막 값이 저장되게 된다.
                // addEventListner는 비동기 처리로, 가장 마지막에 처리가 되다 보니, 가장 마지막 값이 저장된 tmp로 이벤트를 처리하게 된다.
                // 그에따라, 호이스팅을 막아주는 const 혹은 let으로 처리하면 문제없이 돌아간다.

                const tmp=list[i];//var은 호
                deletButton.addEventListener('click', function(){
                    deleFun(tmp[0])
                });
                
                // deletButton.attachEvent("onclick",function(){deleFun("deleFun");});
                newDiv.appendChild(deletButton);
            }


            
        }

        function logoutFun(){
            location.href="logout.jsp";
        }

        function deleFun(temp){
            console.log(temp);
            
            // var temp=document.getElementById("main_div_div").value;//값을 넘겨 받고 

            var newForm=document.createElement("form");
            newForm.id="fromName";
            newForm.action="memoDelet.jsp";
            newForm.method="post";

            var newInput=document.createElement("input");
            newInput.type="hidden";
            newInput.name="memo_num";
            newInput.value=temp;
        


           // document.getElementById("fromName").submit();//fromName 이라는 form으로 값을 넘기겠다.
        }

    </script>
</body>
</html>