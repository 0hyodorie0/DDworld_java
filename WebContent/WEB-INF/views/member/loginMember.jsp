
<%@page import="ddw.vo.MainVO"%>
<%@page import="ddw.vo.MemberVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>DD world</title>
    <link rel="stylesheet" href="<%=request.getContextPath() %>/css/bootstrap.min.css">
    <link rel="stylesheet" href="<%=request.getContextPath() %>/css/style.css">
    <script src="<%=request.getContextPath() %>/js/jquery-3.6.0.min.js"></script>
    <script src="<%=request.getContextPath() %>/js/bootstrap.min.js"></script>
    <script src="<%=request.getContextPath() %>/js/script.js"></script>


</head>
<body>
<%
	MemberVO loginMember = (MemberVO)session.getAttribute("loginMember");
	MainVO myAllData = (MainVO)session.getAttribute("myAllData");
%>
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
    <div class="row main_wrap">
        <section class="col-4 main_section main_user">
            <div class="form-group">
                <h1 class="logo">
                    <a href="" class="logo_img"><img src="<%=request.getContextPath() %>/images/logo/2.png" alt=""></a>
                </h1>
                <div class="row justify-content-center">
                <h4 class="user_welcome">디디월드 미니홈피에 오신 것을 환영합니다</h4>
	                <section class="col-6 user_l">
	                	<div class="user_pic_wrap">
	                		<img alt="회원미니미사진" src="<%=request.getContextPath()%>/images/minimi/<%=myAllData.getMem_mnm()%>">
	                	</div>
	                </section>
	                <section class="col-6 user_r">
		                <p><h2 class="user_name_lg"><%=loginMember.getMem_name() %></h2>님</p>
		                <ul class="user_link">
		                	<li><a class="white_link" href="<%=request.getContextPath() %>/myinfo.do">내 정보 수정하기</a></li>
		                	<li><a class="white_link" href="<%=request.getContextPath()%>/ilchon.do?id=<%=loginMember.getMem_id() %>">일촌 <%=myAllData.getOne_count() %>명</a></li>
		                	<li>도토리 <a class="white_link" href=""><%=myAllData.getMem_dtr() %></a>개</li>
		                	<li>
		                		<ul>
		                			<li>TODAY <span><%=myAllData.getToday() %></span></li>
		                			<li>TOTAL <span><%=myAllData.getTotal() %></span></li>
		                		</ul>
		                	</li>
		                </ul>
	                </section>
                </div>
                <a class="btn white_btn my-3" target="_blank" href="<%=request.getContextPath() %>/goDD.do?id=<%=loginMember.getMem_id() %>">내 미니홈피 바로가기</a>
                <a class="white_link" href="<%=request.getContextPath() %>/logout.do">로그아웃</a>
            </div>
        </section>
        <section class="col-8 main_section main_cont">
            <div class="card_area card_area_lg">
                <div class="card">
                    <div class="card-body">
                        <h5 class="card-title">상점</h5>
                        <h6 class="card-subtitle mb-2 text-muted">Card subtitle</h6>
                        <p class="card-text"></p>
                        <a href="<%=request.getContextPath() %>/jsp/storeMain.jsp" class="card-link">상점 가기</a>
                        
                    </div>
                </div>
            </div>
            <div class="card_area">
                <div class="card">
                    <div class="card-body">
                        <h5 class="card-title">도토리</h5>
                        <h6 class="card-subtitle mb-2 text-muted">Card subtitle</h6>
                        <p class="card-text"></p>
                        <a href="<%=request.getContextPath() %>/jsp/dotoriStore.jsp" class="card-link">도토리 가기</a>
                        <!-- <a href="#" class="card-link">Another link</a> -->
                    </div>
                </div>
            </div>
            <div class="card_area">
                <div class="card">
                    <div class="card-body">
                        <h5 class="card-title">미니홈피 가기</h5>
                        <h6 class="card-subtitle mb-2 text-muted">Card subtitle</h6>
                        <p class="card-text"></p>
                        <a href="/ddWorld/listDD.do" class="card-link">미니홈피 리스트</a>
                        
                    </div>
                </div>
            </div>
            <div class="card_area card_area_lg">
                <div class="card">
                    <div class="card-body">
                        <h5 class="card-title">고객센터</h5>
                        <h6 class="card-subtitle mb-2 text-muted">Card subtitle</h6>
                        <p class="card-text"></p>
                        <a href="<%=request.getContextPath() %>/faq.do" class="card-link">고객센터 가기</a>
                        <!-- <a href="#" class="card-link">Another link</a> -->
                    </div>
                </div>
            </div>
            <div class="card_area card_area_full">
                <div class="card">
                    <div class="card-body">
                        <h5 class="card-title">공지사항</h5>
                        <h6 class="card-subtitle mb-2 text-muted">Card subtitle</h6>
                        <p class="card-text"></p>
                        <a href="/ddWorld/notice.do" class="card-link">공지사항</a>
                        <!-- <a href="#" class="card-link">Another link</a>  -->
                    </div>
                </div>
            </div>
        </section>
    </div>
    <footer>
        <p>Copyright © 2022 DDworld.,Ltd. All rights reserved.</p>
    </footer>
</body>

</html>