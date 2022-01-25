<%@ page language="java" contentType="text/html" pageEncoding="utf-8" %>
<%@ page import="java.sql.Connection"%>
<%@ page import="java.sql.PreparedStatement"%>
<%@ page import="java.sql.DriverManager"%>
<%@ page import="java.sql.ResultSet"%>

<%
    request.setCharacterEncoding("utf-8");
    String user_id=request.getParameter("user_id");//로그인 버튼을 누른후 넘겨 지는 값을 가져오기 
    String user_pw=request.getParameter("user_pw");//사용자가 입력 한 값을 전송 받은 값을 저장 하는 변수 
    String log_check=request.getParameter("log_checked");//체크 박스가 체크 되였는지 확인 하기 위새 받아 오기 
    //데이터 베이스 등록 -> 어떤 디비를 쓸지 등록
   
    Class.forName("com.mysql.jdbc.Driver");//com,mysql.jdbc.Driver을 사용 할것 이다. 
    //사용할 데이터 베이스를 연결 해주기 
     Connection connect = DriverManager.getConnection("jdbc:mysql://localhost:3306/scheduleDB","schedule","1234");

    String sql= "SELECT * FROM userlist WHERE user_id=? and user_pw=?";
    PreparedStatement query=connect.prepareStatement(sql);//연결한 데이터 베이스에다 sql을 보낸다.
    query.setString(1,user_id);//위에서 만든 변수 
    query.setString(2,user_pw);

    ResultSet result=query.executeQuery();//결과를 가져 오겠다 

    String targetId="";//여기 부터 column의 순서대로 읽은 것 즉 데이터 베이스에서 읽어온 사용자 id 
    String targetPw="";//데이터 베이스에서 읽어온 사용자 비밀 번호를 저장 할 변수 
    String targetName="";
    if(result.next()){//예외 처리 해줘서 로그인 이 안되면 빈 값 아니면 로그인  비여 있지 않으면  맞는지 등 다양한 처리 가능 
        targetId=result.getString(1);//여기 부터 column의 순서대로 읽은 것 
        targetPw=result.getString(2);//데이터 베이스에서 사용자 비밀 번호와 아이디를  읽어 온것이다.
        targetName=result.getString(3);
        
        if(targetId.equals(user_id) && targetPw.equals(user_pw)){//데이터 베이스에서 가져온 아이디와 유저가 입력한 아디가 같은 경우 즉  로그인 성공시 
            session.setAttribute("id", user_id);//사용자 입력을 받은 아이디로 이름이 id 이고 값이 user_id인 세션 생성
		    session.setAttribute("pw", user_pw);
           // String session_id =(String)session.getAttribute("id");//이름이 id 세션을 불러 오겠다.
         if(log_check!= null){//체크 한경우 
                Cookie userId=new Cookie("user_id",user_id);//cookie 세션 아이디를 넣어 서 생성 한다. 
                response.addCookie(userId);//생성한 쿠키를 클라이언트로 응답해 줄겠다. 
               
            }
            response.sendRedirect("showMemo.jsp");//로그인 성공시 일정페이지로 돌아 가기 

        }
    }else{
        response.sendRedirect("loginFormat.jsp");//로그인을 실패 했을때 페이지를 돌려 준다. response 돌려 주겠다. 
    }


%>


