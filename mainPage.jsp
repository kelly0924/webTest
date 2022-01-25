
<%@ page language="java" contentType="text/html" pageEncoding="utf-8"%>
<%@ page import="java.sql.Connection"%>
<%@ page import="java.sql.PreparedStatement"%>
<%@ page import="java.sql.DriverManager"%>
<%@ page import="java.sql.ResultSet"%>

<%
    request.setCharacterEncoding("utf-8");//한글이 깨지지 않도록 하는것
    String id=request.getParameter("sendId");//form태그에서 보내오 ㄴ데이터를 저장 하는 방법
    String pw=request.getParameter("sendPw");

    //어떤 디비를 사용할지 등록 해줘야 한다. 
    Class.forName("com.mysql.jdbc.Driver");
    //디비 연결
    Connection connect = DriverManager.getConnection("jdbc:mysql://localhost:3306/stagusDB","stageus","1234");//http://와 같은 느낌으로 jdbc.mysql://서버주소를 시작
    //그다음 동일한 ip:port 의 형태로 구성 
    //코드파일의 이름이 나와야 할 부분에 deatabase 의 이름 사용
    //stageus 데이터 베이스에 계정이름  계정 비밀 번호 

    //query 구성 
    String sql="SELECT *FROM user WHERE id=? and pw=?";
    PreparedStatement query=connect.prepareStatement(sql);
    query.setString(1,id);//위에서 만든 변수 
    query.setString(2,pw);

    //query 전달 해주기 (select 명령어 일때 ) sql 문을 전달하고 결과를 얻어 와야 하니까ㅏ
    ResultSet result = query.executeQuery();//받아온 값이 저장 된다. 
    //받아 온 값 분석,
    /*result.next();//읽어온 데이터의 다음 row의 이동하는 명령어 
    String targetId=result.getString(1);//여기 부터 column의 순서대로 읽은 것 
    String targetPw=result.getString(2);
    */
    //query insert, update, delete 할때는 
   // query.executeUpdate();

    String targetId="";//여기 부터 column의 순서대로 읽은 것 
    String targetPw="";
    if(result.next()){//예외 처리 해줘서 로그인 이 안되면 빈 값 아니면 로그인  비여 있지 않으면  맞는지 등 다양한 처리 가능 
        targetId=result.getString(1);//여기 부터 column의 순서대로 읽은 것 
        targetPw=result.getString(2);
    }else{
        response.sendRedirect("index.html");//로그인을 실패 했을때 페이지를 돌려 준다. response 돌려 주겠다. 
    }

%>

<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
</head>
<body>
    <h1>main Page</h1>
    <!-- jsp는 값을 받을 수가 있다. idvalue와 pw 값을 받을 수 가 있다.  -->
    <p>아이디 : <%=id%></p>
    <p>비밀번호 : <%=pw%></p>
    <!-- <%=id%>jsp의 변수를 가져다 쓰는 방법   -->
    <p>결과 : <%=targetId%><%=targetPw%></p>

</body>
</html>