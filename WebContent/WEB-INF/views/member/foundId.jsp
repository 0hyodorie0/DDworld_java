<%@page import="java.util.Map"%>
<%@page import="ddw.vo.MemberVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>아이디 찾기</title>
    <link rel="stylesheet" href="<%=request.getContextPath() %>/css/bootstrap.min.css">
    <link rel="stylesheet" href="<%=request.getContextPath() %>/css/style.css">
    <script src="<%=request.getContextPath() %>/js/jquery-3.6.0.min.js"></script>
    <script src="<%=request.getContextPath() %>/js/bootstrap.min.js"></script>
    <script src="<%=request.getContextPath() %>/js/script.js"></script>

</head>
<%

	String findid = (String)request.getAttribute("findid");
%>
<body class="sub">
<header>
        <nav class="navbar fixed-top">
            <a class="nav-link" href="#">Home</a>
        	<a class="nav-link" href="#">Shop</a>
            <a class="nav-link" href="#">Dotori</a>
            <a class="nav-link" href="#">Notice</a>
            <a class="nav-link" href="#">MiniHome</a>
            <a class="nav-link" href="#">FAQ</a>
        </nav>
    </header>
	<div class="container-fluid page_header">
	   <div class="container d-flex h-100 justify-content-center align-items-center">
	     <a class="position-absolute header_logo" href="<%=request.getContextPath() %>/crossGoMain.do"><img alt="" src="<%=request.getContextPath() %>/images/logo/3.jpg"></a>
		 <h3 class="text-center page_title">아이디를 찾았습니다!</h3>
	   </div>
    </div>
    <div class="container-fluid find_id_pw h-50 cont_background h-75">
    	<div class="container">
			<h2>회원님의 아이디는 <%=findid %> 입니다.</h2>
		<br><br>
		
			<a href="<%=request.getContextPath() %>/crossGoMain.do">
				<input type="button" class="btn" value="로그인">
			</a>
		</div>
	</div>
	<footer>
        <p>Copyright © 2022 DDworld.,Ltd. All rights reserved.</p>
    </footer>
</body>
</html>