<%@ page language="java" contentType="text/html" pageEncoding="utf-8"%>
<%@ page import="java.sql.Connection"%>
<%@ page import="java.sql.PreparedStatement"%>
<%@ page import="java.sql.DriverManager"%>
<%@ page import="java.sql.ResultSet"%>

<%

    request.setCharacterEncoding("utf-8");
    String user_id=request.getParameter("user_id");
    String user_pw=request.getParameter("user_pw");
    String user_name=request.getParameter("user_name");
    String user_phone=request.getParameter("user_phone");
    String user_email=request.getParameter("user_email");
    String user_home=request.getParameter("user_home");
    
    int user_int_id=Integer.parseInt(user_id);
    int user_int_pw=Integer.parseInt(user_pw);

    Class.forName("com.mysql.jdbc.Driver");//com,mysql.jdbc.Driver을 사용 할것 이다. 
    //사용할 데이터 베이스를 연결 해주기 
     Connection connect = DriverManager.getConnection("jdbc:mysql://localhost:3306/stagusDB","stageus","1234");

     String sql="INSERT INTO userlist(user_id, user_pw, user_name,user_phone,user_email,user_home) VALUES(?,?,?,?,?,?)";
     PreparedStatement query=connect.prepareStatement(sql);
     query.setInt(1,user_int_id);
     query.setInt(2,user_int_pw);
     query.setString(3,user_name);
     query.setString(4,user_phone);
     query.setString(5,user_email);
     query.setString(6,user_home);
     query.executeUpdate();// 사용자가 입력한 것을 데이터 베이스에다 업데이트 할 것이다. 
    
    response.sendRedirect("loginFrom.jsp");//회원 가입이 완료 되면 로그인 페이지로 이동 


%>
