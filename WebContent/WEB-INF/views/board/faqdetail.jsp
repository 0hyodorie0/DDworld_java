<%@page import="ddw.vo.FaqreVO"%>
<%@page import="java.util.List"%>
<%@page import="ddw.vo.MemberVO"%>
<%@page import="ddw.vo.FaqVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<style>
div.reList{
  back-ground : blue;
}


</style>
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
<body class="sub">
<%
    MemberVO loginUser = (MemberVO)session.getAttribute("loginMember");
	FaqVO vo = (FaqVO)request.getAttribute("vo");	
	List<FaqreVO> faqre = (List<FaqreVO>)request.getAttribute("faqre");
	FaqreVO revo=(FaqreVO)request.getAttribute("revo");
%>
<header>
        <nav class="navbar fixed-top">
            <a class="nav-link" href="<%=request.getContextPath()%>/jsp/main_shs.jsp">Home</a>
        	<a class="nav-link" href="<%=request.getContextPath()%>/jsp/storeMain.jsp">Shop</a>
            <a class="nav-link" href="<%=request.getContextPath()%>/jsp/dotoriStore.jsp">Dotori</a>
            <a class="nav-link" href="/ddWorld/notice.do">Notice</a>
            <a class="nav-link" href="/ddWorld/listDD.do">MiniHome</a>
            <a class="nav-link" href="/ddWorld/faq.do">FAQ</a>
        </nav>
    </header>
    <div class="faq">
    	<div class="container-fluid page_header">
	    	<div class="container d-flex h-100 justify-content-center align-items-center">
	    	<a class="position-absolute header_logo" href="crossGoMain.do"><img alt="" src="<%=request.getContextPath() %>/images/logo/3.jpg"></a>
				<h3 class="text-center page_title">고객센터</h3>
	    	</div>
		    
    	</div>
    	<div class="container-fluid cont_background">
	    	<div class="container py-4 cont_wrap">
				<section>
					<div class="article_info">
						<table class="table table-bordered">
							<tr>
								<th>글 번호</td>
								<td><%=vo.getFaq_num()%></td>
								<th >작성자</td>
								<td><%=vo.getMem_id()%></td>
								
							</tr>
							<tr>
								<th >글 제목</td>
								<td><%=vo.getFaq_title()%></td>
								<th >작성일자</td>
								<td><%=vo.getFaq_date()%></td>
							</tr>
						</table>
					</div>
					
					<div class="article_cont">
					    <!-- 글내용 --> 
						<%=vo.getFaq_con() %> 
					</div>
					<div class="reList reply">
						
					<%
					for(FaqreVO faqrevo : faqre){
					%>
					  <ul class="container">
						  <li class="d-flex justify-content-between">
						  	<span class="reply_writer font-weight-bold"><%=faqrevo.getAdmin_id()%></span>
						  	<span class="reply_date"><%=faqrevo.getFaq_redate() %></span>
						  	
						  </li>
						  <li class="reply_cont my-2 pb-2"> 
						  
						  	<%=faqrevo.getFaq_recon()%>
						  	<%
					   if (loginUser != null) {
						if ( loginUser.getMem_type().equals("관리자")) {
				   %>
					    <div class="text-right">
						  <input type="button" value="댓글수정">
						  <input type="button" value="댓글삭제">
					    </div>
					 <%	
					  }
					 %>
					 		<%
							} %>
						  </li>
					  </ul>
               
                   
							<%
							}							
						%>
					
					      <!-- 댓글 창  관리자일때만 보이게 하고 관리자만 답변달기 ! -->
				    <%
						if (loginUser != null) {
							if (loginUser.getMem_type().equals("관리자")) {
					%>
					    
					    <div class="reply_area ">
					    <!-- 댓글 내용 작성-->
					    <form method="POST" action="/ddWorld/faqreplyinsert.do" class="p-3">
							<textarea cols="50" rows="2" name="faq_recon" placeholder="문의 답변 댓글 달아 주세요"></textarea>
							<!-- 게시글 번호 --> 
							<input type="hidden" name="faq_num" value=<%=vo.getFaq_num()%>> 
							<!-- 작성 아이디 -->
							<input type="hidden" name="admin_id" value=<%=loginUser.getMem_id()%>> 
							<input type="submit" class="btn input_btn" value="등록"> 
						</form>
						<%
								} 
							}							
						%>
					</div>
					</div>
					<div class="container mt-3">
							<%
					 
							if (loginUser != null){ //글작성자 + 관리자만 글 수정 삭제 가능하도록
								if(loginUser.getMem_id().equals(vo.getMem_id()) || loginUser.getMem_type().equals("관리자")) {
					   %>				    
								<input type="button" value="수정" onclick="location.href='<%=request.getContextPath()%>/faqupdate.do?faq_num=<%=vo.getFaq_num()%>'">
						        <input type="button" value="삭제">
						<%
						  } 
						}
						%>
							
					   <a class="btn input_btn h-50" href="<%=request.getContextPath() %>/faq.do">목록</a>
					</div>
				</section>
	    	</div>
	    </div>
     </div>
	<footer>
        <p>Copyright © 2022 DDworld.,Ltd. All rights reserved.</p>
    </footer>
</body>
</html>