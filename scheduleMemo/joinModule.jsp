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
    //String user_pw_check=request.getparameter("user_pw_check");

    Class.forName("com.mysql.jdbc.Driver");//com,mysql.jdbc.Driver을 사용 할것 이다. 
    //사용할 데이터 베이스를 연결 해주기 
     Connection connect = DriverManager.getConnection("jdbc:mysql://localhost:3306/scheduleDB","schedule","1234");

     if(user_id.equals("") ||user_pw.equals("")||user_pw.equals("")){
        %>
         <script> 
            alert("빈칸이 존재 합니다. 빈칸이 없도록 입력 해주세요!");
            location.href="joinFormat.jsp";
            //회원 가입 페이로 되돌아 가면서 이전에 기입한 정보는 저장되여 있어야 한다. 
         </script>
        <%
        }else{
       
            String sql="INSERT INTO userlist(user_id, user_pw, user_name) VALUES(?,?,?)";
            PreparedStatement query=connect.prepareStatement(sql);
            int user_int_id = Integer.parseInt(user_id);
            query.setInt(1,user_int_id);
            query.setString(2,user_pw);
            query.setString(3,user_name);
            query.executeUpdate();// 사용자가 입력한 것을 데이터 베이스에다 업데이트 할 것이다.
            response.sendRedirect("loginFormat.jsp");//회원 가입이 완료 되면 로그인 페이지로 이동 
        }
%>
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
</head>
<body>
   <script>
        
   </script>

</body>
</html>