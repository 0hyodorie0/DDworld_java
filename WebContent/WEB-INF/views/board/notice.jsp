<%@page import="ddw.vo.MemberVO"%>
<%@page import="ddw.vo.NoticeVO"%>
<%@page import="java.util.List"%>
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

<script type="text/javascript">
$(function(){
	$(document).on('click', '#btn1', function(){
		location.href = "/ddWorld//insertNotice.do";
	})
})

</script>
<body class="sub">

<%
	List<NoticeVO> list = (List<NoticeVO>)request.getAttribute("list");
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
   	<div class="container-fluid page_header">
    	<div class="container d-flex h-100 justify-content-center align-items-center">
    		<a class="position-absolute header_logo" href="crossGoMain.do"><img alt="" src="<%=request.getContextPath() %>/images/logo/3.jpg"></a>
			<h3 class="text-center page_title">공지사항</h3>
    	</div>
	    
   	</div>
    <div class="notice h-100">
    	<div class="container-fluid cont_background h-100">
	    	<div class="container py-4 cont_wrap">
	    	<%
	if(loginUser != null){
		if(loginUser.getMem_type().equals("관리자")){
%>
	<input id="btn1" class="btn input_btn mb-3" type="button" value="글쓰기">
<%
		}else{ }
	}else{ }	
%>
	    		<table class="table table-striped table-hover">
					<thead>
					  <tr>
					    <td>글번호</td><td>제목</td><td>작성자</td><td>조회수</td>
					  </tr>
					</thead>
					<tbody>
				<%	for(int i = 0; i < list.size(); i++) {
						NoticeVO vo = list.get(i); %>
					  <tr>
					  	<td><%=vo.getNotice_num() %></td>
					    <td>
					      <a href="<%=request.getContextPath() %>/noticeDetail.do?no=<%=vo.getNotice_num() %>">
					      <%=vo.getNotice_title() %></a>
					    </td>
				        <td><%=vo.getAdmin_id() %></td>
				        <td><%=vo.getNotice_hit() %></td>
				      </tr>
				<% 	} %>
					</tbody>
				</table>	
				<nav aria-label="Page navigation example">
					  <ul class="pagination justify-content-center">
					    <li class="page-item disabled">
					      <a class="page-link" href="#" tabindex="-1">Previous</a>
					    </li>
					    <li class="page-item"><a class="page-link" href="#">1</a></li>
					    <li class="page-item"><a class="page-link" href="#">2</a></li>
					    <li class="page-item"><a class="page-link" href="#">3</a></li>
					    <li class="page-item">
					      <a class="page-link" href="#">Next</a>
					    </li>
					  </ul>
					</nav>
	    	</div>
		</div>
	</div>


	<footer>
        <p>Copyright © 2022 DDworld.,Ltd. All rights reserved.</p>
    </footer>
	
</body>
</html>