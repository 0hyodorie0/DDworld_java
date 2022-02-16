<%@page import="ddw.vo.MemberVO"%>
<%@page import="java.util.List"%>
<%@page import="ddw.vo.NoticeVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
	<title>main > 공지사항</title>
	<link rel="stylesheet" href="<%=request.getContextPath() %>/css/bootstrap.min.css">
    <link rel="stylesheet" href="<%=request.getContextPath() %>/css/style.css">
	<script src="<%=request.getContextPath() %>/js/jquery-3.6.0.min.js"></script>
	<script src="<%=request.getContextPath() %>/js/bootstrap.min.js"></script>
    <script src="<%=request.getContextPath() %>/js/script.js"></script>
</head>
<body class="sub">
<%
	NoticeVO vo = (NoticeVO)request.getAttribute("vo");
    MemberVO loginUser = (MemberVO)session.getAttribute("loginMember");
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
    <div class="notice">
    	<div class="container-fluid page_header">
	    	<div class="container d-flex h-100 justify-content-center align-items-center">
	    	<a class="position-absolute header_logo" href="<%=request.getContextPath()%>/jsp/main_shs.jsp"><img alt="" src="<%=request.getContextPath() %>/images/logo/3.jpg"></a>
				<h3 class="text-center page_title">공지사항</h3>
	    	</div>
		    
    	</div>
    	<div class="container-fluid cont_background">
	    	<div class="container py-4 cont_wrap">
				<section>
					<div class="article_info">
						<table class="table table-bordered">
							<tr>
								<th>글 번호</th>
								<td style="width:450px">
								<%=vo.getNotice_num() %> <input value="<%=vo.getAdmin_id() %>" type="hidden"/>
								</td>
								<th>작성일자</th>
								<td>2021.02.14</td>
							</tr>
							<tr>
								<th>글 제목</th>
								<td colspan="3"><%=vo.getNotice_title() %></td>							
							</tr>
							
						</table>
						
						
	  
							
						</ul>
					</div>
					<div class="article_cont">
						<%=vo.getNotice_con() %>
					</div>  	
				</section>
	    	</div>
			<div class="container mt-3">
				<%
					if(loginUser != null){
						if(loginUser.getMem_type().equals("관리자")){
				%>
				        <input type="button" value="수정" onclick="location.href='<%=request.getContextPath()%>/noticeupdate.do?notice_num=<%=vo.getNotice_num()%>'">
				        <input type="button" value="삭제">
				<%
						}else{ }
					}else{ }	
				%>				
				<a class="btn input_btn h-50" href="<%=request.getContextPath() %>/notice.do">목록</a>
			</div>
	    </div>

	<footer>
        <p>Copyright © 2022 DDworld.,Ltd. All rights reserved.</p>
    </footer>
</body>
</html>