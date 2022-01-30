<%@ page language="java" contentType="text/html" pageEncoding="utf-8"%>
<%@ page import="java.sql.Connection"%>
<%@ page import="java.sql.PreparedStatement"%>
<%@ page import="java.sql.DriverManager"%>
<%@ page import="java.sql.ResultSet"%>
<%@ page import="java.util.*"%>

<%!
    //클래스 선언 부분
    public class myMemo{
       private int memoCnt=0;
       private String memoText="";
       private String memeWriteDate="";
       private String userID="";

       public void setCnt(int cnt){
           memoCnt=cnt;
        }
        public void setMemoText(String Text){
            memoText=Text;
        }
        public void setWriteDate(String memoData){
            memeWriteDate=memoData;
        }
        public void setUserID(String Id){
            userID=Id;
        }
        public int getCnt(){
                return memoCnt;
        }
        public String getMemoText(){
            return memoText;
        }
        public String getWriteDate(){
            return memeWriteDate;
        }
        public String getUserID(){
            return userID;
        }
    }
%>

<%   
    request.setCharacterEncoding("utf-8");
    String id="";
    String user_msg="";
    List<myMemo> memos = new ArrayList<myMemo>();// 만든 객체 타입으로 리스트를 만들 것이다. 
    List<String> resultMemo=new ArrayList<String>();
    List<String> resultDate=new ArrayList<String>();
    List<Integer> resultNumber=new ArrayList<Integer>();
    int size=0;
    int index=0;

    int forJsIndex = 0;

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
        myMemo viewMemo = new myMemo();//객체 생성  
        //만든 객체에다 디비에서 불러온 값은 셋팅 해준다. 
        viewMemo.setCnt(result.getInt(1));
        viewMemo.setMemoText(result.getString(2));
        viewMemo.setWriteDate(result.getString(3));
        viewMemo.setUserID(result.getString(4));
        //리스트에 추가 
        memos.add(viewMemo);
        size++;
        index++;
    }
    
    for(myMemo memo : memos){//for(int i=0; i<memos.lenght)
        resultMemo.add(memo.getMemoText()); 
        resultDate.add(memo.getWriteDate());
        resultNumber.add(memo.getCnt());
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
       
        <%-- <form action="memoDelet.jsp" method="post"> --%>
            <div id="main_div">
              <%-- 동적으로 추가 해주기 --%>
              <%-- <input name="test" value="test"> --%>
             
            </div>
        <%-- </form>     --%>
    
    </main>
    
    <script>
        window.onload = function() {   // 데이터베이스에서 jsp를 통해 가져온 값을 처음에 화면에 뿌려주는 역할

            for(var j=0; j<<%=size%>; j++){   // jsp 변수를 string 타입으로 사용하고 싶을 때만 ""을 붙여주면 된다.
            
                var cnt=[];
                var result=document.getElementById("main_div");
                //동적 div 생성
                var newDiv=document.createElement("div");//div 생성
                console.log(newDiv);
                newDiv.id="main_div_div";
                newDiv.style.backgroundColor="yellow";
                newDiv.style.width="500px";
                newDiv.style. height="100px";
                result.appendChild(newDiv);

                //불러온 데이터를 넣어 줄 태그 생성 과 넣어 주기 
                
                var spanNum=document.createElement("input");//메모를 넣을 태그
                spanNum.id="main_div_number";
                spanNum.value="<%=resultNumber.get(forJsIndex)%>";
                // cnt[0]=("<%=resultNumber.get(forJsIndex)%>");
                //spanNum.value = cnt;// 변수 인식 하는 방법 찾아 보기
                newDiv.appendChild(spanNum);
                //사용자에게 보여 질 필요가 없다고 생각
                
                var spanMemo=document.createElement("span");//메모를 넣을 태그
                spanMemo.id="main_div_memo_span";
                newDiv.appendChild(spanMemo);
                spanMemo.innerHTML="<%=resultMemo.get(forJsIndex)%>";// 변수 인식 하는 방법 찾아 보기 
            
                var spanDate=document.createElement("span");//메모를 넣은 날짜를 넣을 태그
                newDiv.appendChild(spanDate);
                spanDate.innerHTML="<%=resultDate.get(forJsIndex)%>";//0 대신 변수 넣기// 변수를 넣으면 변수를 알아 못먹음 

                //main_div 인 곳에다 생성
                var deletButton=document.createElement("input");
                deletButton.type="button";
                deletButton.value="delet";
                deletButton.className="delet_button";
                deletButton.onclick=deleFun;
                newDiv.appendChild(deletButton);

                <%=forJsIndex += 1%>;
            }
        }

        function logoutFun(){
            location.href="logout.jsp";
        }

        function deleFun(){
            console.log("deleFunc() 호출");
            /*
            var temp=document.getElementById("main_div_number").value;//값을 넘겨 받고 
            var newForm=document.createElement("form");
            newForm.name="fromName";
            newForm.action="memoDelet.jsp";
            newForm.method="post";
            var newInput=document.createElement("input");
            newInput.type="hidden";
            newInput.name="memo_num";
            newInput.value=temp;
            document.fromName.submit();//fromName 이라는 form으로 값을 넘기겠다.
            */
        }

        //var target=document.getElementsByClassName("delet_button")[0]; 
        //console.log(target);
        // function deleFun(){//
        //     console.log("함수 호출");
        //     var temp=document.getElementById("main_div_number").value;//값을 넘겨 받고 
        //     var newForm=document.createElement("form");
        //     newForm.name="fromName";
        //     newForm.action="memoDelet.jsp";
        //     newForm.method="post";
        //     var newInput=document.createElement("input");
        //     newInput.type="hidden";
        //     newInput.name="memo_num";
        //     newInput.value=temp;
        //     document.fromName.submit();//fromName 이라는 form으로 값을 넘기겠다.
        // }
        //console.log(target);
    </script>
</body>
</html>