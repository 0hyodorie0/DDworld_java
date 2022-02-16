<%@page import="ddw.vo.MemberVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<%
	MemberVO loginUser = (MemberVO)session.getAttribute("loginMember");
%>
<head>
	<meta charset="UTF-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
	<title>main > 고객센터</title>
	<link rel="stylesheet" href="<%=request.getContextPath() %>/css/bootstrap.min.css">
    <link rel="stylesheet" href="<%=request.getContextPath() %>/css/style.css">
	<script src="<%=request.getContextPath() %>/js/jquery-3.6.0.min.js"></script>
	<script src="<%=request.getContextPath() %>/js/bootstrap.min.js"></script>
    <script src="<%=request.getContextPath() %>/js/script.js"></script>
</head>

<style>
	#title, #con{
		width: 800px;
	}

	#con{
		height: 500px;
	}
</style>



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
   <div class="notice">
   	<div class="container-fluid page_header">
    	<div class="container d-flex h-100 justify-content-center align-items-center">
    	<a class="position-absolute header_logo" href="crossGoMain.do"><img alt="" src="<%=request.getContextPath() %>/images/logo/3.jpg"></a>
			<h3 class="text-center page_title">고객센터</h3>
    	</div>
	    
   	</div>
   	<div class="container-fluid cont_background">
    	<div class="container py-4 cont_wrap">
  

	<h2>문의글 작성</h2>
	<h4>문의글 작성 해주시면은 관리자가 답변해드립니다</h4>
	<br><hr><br>
	<form action="/ddWorld/faqInsert.do?mem_id=<%=loginUser.getMem_id() %>" method="post">
		<table border="1">
		  <tr>
		  	<td>제목</td>
		  	<td><input id="title" type="text" name="faq_title"> </td>
		  </tr>
		  <tr>
		  	<td>작성자</td>
		  	<td><%=loginUser.getMem_id()%></td>
		  </tr>
		  <tr>
		  	<td>내용</td>
		  	<td><input id="con" type="textarea" name="faq_con"></td>
		  </tr>
		  <tr>
		  	<td colspan="2"><input type="submit" value="등록"> </td>
		  </tr>
		</table>
		<hr>
		<a href="/ddWorld/faq.do"><span>목록</span></a>
	</form>
	</div>
	</div>
	</div>
<footer>
        <p>Copyright © 2022 DDworld.,Ltd. All rights reserved.</p>
    </footer>
	
</body>
</html>