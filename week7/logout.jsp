<%@ page language="java" contentType="text/html" pageEncoding="utf-8"%>

<%
   //로그 아웃 한다는 것은 저장 클라이언트에 저당 되어 있는 쿠키 정보를 삭제 해주는 것이다. 
    session.invalidate();
    Cookie user=new Cookie("user_id","");//cookie 생성 
            user.setMaxAge(0);//setMaxAge(0)으로 초기화 하면 이 쿠키를 삭제 하겠다 라는 뜻이다. 
            response.addCookie(user);//변겨된 쿠키에 상태를 클라이언트 에에게로 전소해줘야 한다. 
            response.sendRedirect("main.jsp");
            
%>

<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>logoutPage</title>
</head>
<body>
    
</body>
</html>