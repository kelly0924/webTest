<%@ page language="java" contentType="text/html" pageEncoding="utf-8"%>
<%@ page import="java.sql.Connection"%>
<%@ page import="java.sql.PreparedStatement"%>
<%@ page import="java.sql.DriverManager"%>
<%@ page import="java.sql.ResultSet"%>
<%@ page import="java.util.*"%>

<%
    request.setCharacterEncoding("utf-8");
    //String temp=request.getParameterValues("main_input")[0];
    String temp=request.getParameter("memo_num");
    int deleNum=Integer.parseInt(temp);
    //디비에 추가 저장 하기 -- >로그인 된 사용자에게  메모를 저장 한다. 날짜, 메모 텍스트 
        //db를 연결 하고  데이터 베이스에 있는 것을 가져와서 출력 해줄 것이다. 
    Class.forName("com.mysql.jdbc.Driver");//com,mysql.jdbc.Driver을 사용 할것 이다. 
        //사용할 데이터 베이스를 연결 해주기 
    Connection connect = DriverManager.getConnection("jdbc:mysql://localhost:3306/scheduleDB","schedule","1234");
    String sql= "DELETE FROM memolist WHERE count=?";
    PreparedStatement query=connect.prepareStatement(sql);//연결한 데이터 베이스에다 sql을 보낸다.
    query.setInt(1,deleNum);
    query.executeUpdate();
  
    response.sendRedirect("showMemo.jsp");
   
%>

<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="styleSheet" type="text/css" href="showMemo.css">
    <title>mainPage</title>
</head>
<body>
    <script>

    </script>
</body>
</html>