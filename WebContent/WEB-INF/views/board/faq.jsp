<%@page import="ddw.vo.FaqVO"%>
<%@page import="ddw.vo.MemberVO"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>

<html>

<head>
	<meta charset="UTF-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
	<title>main >고객센터</title>
	<link rel="stylesheet" href="<%=request.getContextPath() %>/css/bootstrap.min.css">
    <link rel="stylesheet" href="<%=request.getContextPath() %>/css/style.css">
	<script src="<%=request.getContextPath() %>/js/jquery-3.6.0.min.js"></script>
	<script src="<%=request.getContextPath() %>/js/bootstrap.min.js"></script>
    <script src="<%=request.getContextPath() %>/js/script.js"></script>
</head>
<body class="sub">

<%
	List<FaqVO> faqlist = (List<FaqVO>)request.getAttribute("faqlist");
	MemberVO loginUser = (MemberVO)session.getAttribute("loginMember");
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
   	<div class="container-fluid page_header">
    	<div class="container d-flex h-100 justify-content-center align-items-center">
    	<a class="position-absolute header_logo" href="crossGoMain.do"><img alt="" src="<%=request.getContextPath() %>/images/logo/3.jpg"></a>
			<h3 class="text-center page_title">고 객 센 터</h3>
    	</div>
	    
   	</div>
    <div class="faq ">
    	<div class="container-fluid  ">
	    	<div class="container py-4 cont_wrap">
	    			
		<!-- 글쓰기는 회원만/ 답변글은 관리자만!  -->
<%
			if(loginUser != null){
				if(loginUser.getMem_type().equals("회원")){
%>
			<input id="btn1" class="btn input_btn mb-3" type="button" value="글쓰기" onclick="location.href='<%=request.getContextPath()%>/faqInsert.do'"> 
<%
				}else{ }
			}else{ }	
%> 
	    	
	    	
	    	
	    		<table class="table table-striped table-hover">
					<thead>
					  <tr>
					    <td>글번호</td><td>제목</td><td>작성자</td><td>작성일</td>
					  </tr>
					</thead>
					<tbody>
				<%	for(int i = 0; i < faqlist.size(); i++) {
						FaqVO vo = faqlist.get(i); %>
					  <tr>
					  	<td><%=vo.getFaq_num() %></td>
					    <td>
					      <a href="<%=request.getContextPath() %>/faqDetail.do?faq_num=<%=vo.getFaq_num()%>"> 
					      <%=vo.getFaq_title() %></a>
					    </td>
				        <td><%=vo.getMem_id() %></td>
				        <td><%=vo.getFaq_date() %></td>
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