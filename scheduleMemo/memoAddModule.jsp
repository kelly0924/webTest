<%@ page language="java" contentType="text/html" pageEncoding="utf-8"%>
<%@ page import="java.sql.Connection"%>
<%@ page import="java.sql.PreparedStatement"%>
<%@ page import="java.sql.DriverManager"%>
<%@ page import="java.sql.ResultSet"%>

<%
    request.setCharacterEncoding("utf-8");
    String newMemo=request.getParameter("newMemoInput");//사용자가 입력한 입력값
    String newDate=request.getParameter("writeDate");
    String wirteUser=request.getParameter("user_id");
   
   if(newDate!=null && wirteUser != null){
        //디비에 추가 저장 하기 -- >로그인 된 사용자에게  메모를 저장 한다. 날짜, 메모 텍스트 
         //db를 연결 하고  데이터 베이스에 있는 것을 가져와서 출력 해줄 것이다. 
        Class.forName("com.mysql.jdbc.Driver");//com,mysql.jdbc.Driver을 사용 할것 이다. 
            //사용할 데이터 베이스를 연결 해주기 
            Connection connect = DriverManager.getConnection("jdbc:mysql://localhost:3306/scheduleDB","schedule","1234");

            String sql= "INSERT INTO memolist(memo, writeDate,userID) VALUES(?,?,?)";
            PreparedStatement query=connect.prepareStatement(sql);//연결한 데이터 베이스에다 sql을 보낸다.
            query.setString(1,newMemo);
            query.setString(2,newDate);
            query.setString(3,wirteUser);
            query.executeUpdate();

            response.sendRedirect("showMemo.jsp");

    }
   

%>