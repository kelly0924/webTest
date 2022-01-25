<%@ page language="java" contentType="text/html" pageEncoding="utf-8"%>
<%@ page import="java.sql.Connection"%>
<%@ page import="java.sql.PreparedStatement"%>
<%@ page import="java.sql.DriverManager"%>
<%@ page import="java.sql.ResultSet"%>

<%
 /*
    request.setCharacterEncoding("utf-8");
    Class.forName("com.mysql.jdbc.Driver");//com,mysql.jdbc.Driver을 사용 할것 이다. 
    //사용할 데이터 베이스를 연결 해주기 
     Connection connect = DriverManager.getConnection("jdbc:mysql://localhost:3306/stagusDB","stageus","1234");
     //userlist라는 테이블에 user_id를 다 가져 올 것이다.
     String selectSql="SELECT user_id FROM userlist";//데이터 베이스에서 사용자 아이디 컬럼을 불러오기 
     PreparedStatement getQuery=connect.prepareStatement(selectSql);
     ResultSet result=getQuery.executeQuery();//데이터를 받아 온다. 받아온 데이터를 저장하는 객체 

     String targetId="";//db에 있는 사용자 아이디를 불러와서 담을 변수 
     //targetId=result.getString(1);// 첫번째 column을 불러 올 것이다. 
    
    //질문 html javascrip, jsp 한 파일에 사용 할때 가장 파일을 열면 가장 먼저 실행 되는 언어 순서?
 */
%>

<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="styleSheet" type="text/css" href="schedule.css">
    <title>join page</title>
</head>
<body>

    <form action="userlist.jsp" method="post">
        <div id="form_div">
            <div id="div_table">
                <table>
                        <tr>
                            <td>이름 : </td> 
                            <td> <input class="join_input" type="text" name="user_name"> </td>
                        </tr>
                        <tr>
                            <td>아이디:</td>
                            <td> <input class="join_input" type="text" name="user_id"></td>
                            <td><input id="user_id_check_button" type="button" value="중복확인">
                        </tr>
                        <tr>    
                            <td>비밀번호:</td>
                            <td><input class="join_input" id="pw" type="password" name="user_pw"></td>
                        </tr>
                        <tr>    
                            <td>비밀번호 확인:</td>
                            <td><input class="join_input" id="pw_check" type="text" name="user_pw_check"></td>
                            <td><input id="user_pw_check_button" type="button" value="확인" onclick="pwCheck()">
                        </tr>
                </table>
            </div>
            <div id="join_div"> 
                <input id="join" type="submit" value="가입">
                <input id="cancel" type="button" value="취소" onclick="userCancel()">  
            </div>
        </div>
    </form>

    <script>
        function userCancel(){
           location.href="joinFormat.jsp";//취소 버튼을 누르면 다시 회원 가입 폼으로 돌아 오기 
        }
        console.log("targetId");

        function pwCheck(){//비밀 번화 확인 하기 
            var pw=document.getElementById("pw").value;
            var pw_check=document.getElementById("pw_check").value;
            if(pw != pw_check){
                alert("비밀 번호가 틀립니다.");
                location.href="joinFormat.jsp";
            }else{
                alert("일치 합니다.");
            }
        }

        
    </script>
</body>
</html>