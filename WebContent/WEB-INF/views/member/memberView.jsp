<%@page import="java.util.List"%>
<%@page import="ddw.vo.MemberVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>main > 회원정보</title>
<link rel="stylesheet" href="<%=request.getContextPath() %>/css/bootstrap.min.css">
    <link rel="stylesheet" href="<%=request.getContextPath() %>/css/style.css">
	<script src="<%=request.getContextPath() %>/js/jquery-3.6.0.min.js"></script>
	<script src="<%=request.getContextPath() %>/js/bootstrap.min.js"></script>
    <script src="<%=request.getContextPath() %>/js/script.js"></script>
</head>
<body  class="sub">
<%
	MemberVO loginUser = (MemberVO)session.getAttribute("loginMember");
    List<MemberVO> myinfo = (List<MemberVO>)request.getAttribute("myinfo");
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
 	<a class="position-absolute header_logo" href="crossGoMain.do"><img alt="" src="<%=request.getContextPath() %>/images/logo/3.jpg"></a>
<h3 class="text-center page_title">회원정보</h3>
 	</div>
  
	</div>
	<div class="container-fluid cont_background">
 	<div class="container py-4 cont_wrap">
	<h2>회원 정보 상세보기</h2>

	<form id="Form">
		<input type="hidden" id="mem_id" name="mem_id" value="<%=loginUser.getMem_id()%>">
	</form>
	
	<table class="table">
			<tr>
				<td>ID</td>
				<td><%=loginUser.getMem_id() %></td>
			</tr>
			<tr>
				<td>비밀번호</td>
				<td><%=loginUser.getMem_pass() %></td>
			</tr>
			
			<tr>
				<td>이름</td>
				<td><%=loginUser.getMem_name() %></td>
			</tr>
			<tr>
				<td>전화번호</td>
				<td><%=loginUser.getMem_tel()%></td>
			</tr>
			<tr>
				<td>우편번호</td>
				<td><%=loginUser.getMem_zip()%></td>
			</tr>
			<tr>
				<td>주소</td>
				<td><%=loginUser.getMem_add1()%></td>
			</tr>
			<tr>
				<td>회원메일</td>
				<td><%=loginUser.getMem_mail()%></td>
			</tr>
			<tr>
				<td colspan="2" style="text-align:center;">
					<input type="button" id="" value="수정">
					<input type="button" id="" value="아이템">
					<input type="button" id="" value="뒤로가기" onclick='history.back(1)'>
									<!-- <input type="button" value="탈퇴" onclick="location.href='jsp/memberDelete.jsp'"> -->
<!-- Button trigger modal -->

<button type="button" class="" data-toggle="modal" data-target="#exampleModal">
  탈퇴
</button>

		<!-- Modal -->
		<div class="modal fade" id="exampleModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
		  <div class="modal-dialog" role="document">
		    <div class="modal-content">
		      <div class="modal-header">
		        <h5 class="modal-title" id="exampleModalLabel">탈퇴</h5>
		        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
		          <span aria-hidden="true">&times;</span>
		        </button>
		      </div>
		      <div class="modal-body">
		        	탈퇴하시면 미니홈페이지도 같이 삭제가 됩니다 
		        	탈퇴를 계속 진행하시려면 "탈퇴하기" 눌러주세요.
		      </div>
		      <div class="modal-footer">
		        <button type="button" class="btn btn-primary" onclick="location.href='<%=request.getContextPath()%>/memberdelete.do?mem_id=<%=loginUser.getMem_id()%>'">탈퇴하기</button>
		        <button type="button" class="btn btn-secondary" data-dismiss="modal">취소하기</button>
		
		      </div>
		    </div>
		  </div>
		</div>
				</td>
			</tr>
			
			</table>

		</div>
	</div>
</div>
<footer>
        <p>Copyright © 2022 DDworld.,Ltd. All rights reserved.</p>
    </footer>

</body>
</html>