<%@page import="ddw.vo.MemberVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>로그인 성공 > 관리자</title>
    <link rel="stylesheet" href="<%=request.getContextPath() %>/css/bootstrap.min.css">
    <link rel="stylesheet" href="<%=request.getContextPath() %>/css/style.css">
    <script src="<%=request.getContextPath() %>/js/jquery-3.6.0.min.js"></script>
    <script src="<%=request.getContextPath() %>/js/bootstrap.min.js"></script>
    <script src="<%=request.getContextPath() %>/js/script.js"></script>

</head>

<body class="">
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
<div class="d-flex justify-content-center align-items-center main_wrap">
<%	
	MemberVO loginAdmin = (MemberVO)session.getAttribute("loginMember");
%>
	<div class="container p-3">
		<h2><%=loginAdmin.getMem_name() %> 관리자님 반갑습니다.</h2>		
		<div class="row">
			<a class="col btn text-center m-2 admin_link admin_member" href="jsp/admininfo.jsp">회원 관리</a>
			<%-- <a class="col btn text-center m-2 admin_link admin_member" href="<%=request.getContextPath() %>/adminMemberview.do">회원 관리</a> --%>
			<a class="col btn text-center m-2 admin_link admin_notice" href="<%=request.getContextPath() %>/notice.do">공지사항 관리</a>
		</div>
		<div class="row">		
			<a class="col btn text-center m-2 admin_link admin_faq" href="<%=request.getContextPath() %>/faq.do">고객센터 관리</a>
			<a class="col btn text-center m-2 admin_link admin_store" href="#">상점 관리</a>
		</div>
		<h5 class="mt-4"><a href="<%=request.getContextPath() %>/logout.do">로그아웃</a></h5>		
	</div>
</div>
</body>
</html>