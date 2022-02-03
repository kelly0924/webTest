%@ page language="java" contentType="text/html" pageEncoding="utf-8"%>
<%@ page import="java.sql.Connection"%>
<%@ page import="java.sql.PreparedStatement"%>
<%@ page import="java.sql.DriverManager"%>
<%@ page import="java.sql.ResultSet"%>
<%@ page import="java.util.*"%>


<%   
    request.setCharacterEncoding("utf-8");
    String tmpNumber=request.getParameter("memo_mum");//수정할 count 값을 받아 온다. 
    String modifyMemo=request.getParameter("modifyMemoInput");//수정할 count 값을 받아 온다. 
    int memoNum=Integer.parsInt(tmpNumber);

    //db를 연결 하고  데이터 베이스에 있는 것을 가져와서 출력 해줄 것이다. 
    Class.forName("com.mysql.jdbc.Driver");//com,mysql.jdbc.Driver을 사용 할것 이다. 
    //사용할 데이터 베이스를 연결 해주기 
    Connection connect = DriverManager.getConnection("jdbc:mysql://localhost:3306/scheduleDB","schedule","1234");

    String sql= "SELECT memo FROM memolist WHERE count=?";
    PreparedStatement query=connect.prepareStatement(sql);//연결한 데이터 베이스에다 sql을 보낸다.
    ResultSet result=query.executeQuery();//결과를 가져 오겠다 
    int userSelectNum=result.getInt(1,memoNum);//불러온 count 값과 같은 memo 를 불러 오겠다. 

    String upsql=" UPDATE memolist SET memo=? WHERE count =?";
    PreparedStatement query=connect.prepareStatement(upsql);//연결한 데이터 베이스에다 sql을 보낸다.
            query.setString(1,modifyMemo);
            query.executeUpdate();
            response.sendRedirect("showMemo.jsp");



  
%>