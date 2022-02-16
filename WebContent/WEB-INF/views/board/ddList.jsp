<%@page import="ddw.vo.MemberVO"%>
<%@page import="ddw.vo.DdVO"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<%
	MemberVO loginmember = (MemberVO)session.getAttribute("loginMember");
	List<DdVO> ddlist = (List<DdVO>)request.getAttribute("list");
%>

<head>
	<meta charset="UTF-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
	<title>main > 일촌</title>
	<link rel="stylesheet" href="<%=request.getContextPath() %>/css/bootstrap.min.css">
    <link rel="stylesheet" href="<%=request.getContextPath() %>/css/style.css">
	<script src="<%=request.getContextPath() %>/js/jquery-3.6.0.min.js"></script>
	<script src="<%=request.getContextPath() %>/js/bootstrap.min.js"></script>
    <script src="<%=request.getContextPath() %>/js/script.js"></script>
</head>

<script type="text/javascript">
<!-- data-toggle="modal" data-target="#myModal" -->
$(function(){
	$('.modal').hide();
	$('#ok').hide();
	$('#yes, #no').show();
	
	$(document).on('click', '#yes', function(){
		var onename = $('#onename').val();
		var requestId = $('#reqId').val();
		var responseId = $('#resId').val();
		console.log(requestId + " / " + responseId + " / " + onename);
		
		//이미 일촌인지 검사------------------------------
		/* 신청한 사람 아이디 = requestId */
		/* 신청당한 사람 아이디 = responseId*/
		newcode = "";
		
		$.ajax({
			url		  : '/ddWorld/checkOne.do',
			data	  : {"requestId"  : requestId,
						 "responseId" : responseId,
						 "onename" 	  : onename},
			type	  : 'get',
			success   : function(res){
				if(res.sw == "성공"){
					newcode += "<span style='color:blue; font-size:1.5em; font-weight:bold;'>'"
					newcode += name;
					newcode += "'</span> 님께<br>"
					newcode += "일촌 신청했습니다!"
				}else if(res.sw == "일촌"){
					newcode += "<span style='color:blue; font-size:1.5em; font-weight:bold;'>'"
					newcode += name;
					newcode += "'</span> 님은<br>"
					newcode += "이미 일촌입니다!"
				}else if(res.sw == "대기"){
					newcode += "<span style='color:blue; font-size:1.5em; font-weight:bold;'>'"
					newcode += name;
					newcode += "'</span> 님께<br>"
					newcode += "이미 신청하셨습니다. 수락을 기다려주세요!"
				}else{
					alert(res.sw);
				}
				$('.modal-body').html(newcode);
			},
			error	  : function(xhr){
			},
			dataType  : 'json'
		})
		//------------------------------이미 일촌인지 검사
		
		
			//이미 일촌이면 그냥 종료
			
			//일촌 아니면 일촌 신청 서블렛 실행 후 종료
		
		
		$('.modal-body').empty();
		$('.modal-body').html(newcode);
		$('#ok').show();
		$('#yes, #no').hide();
		
		
		//$('.modal').hide();
		//alert("일촌신청 되었습니다.(실제로는 안됨)");
	})
	
	
	$('#ok, #no').on('click', function(){
		$('.modal').hide();
	})
	
	
	
	$('.request').on('click',function(){
		
	<% 
	if(loginmember == null){
	%>
		alert("로그인이 필요합니다.");
	<%
	}else{
	%>
		requestId = "<%=loginmember.getMem_id() %>";
		responseId = $(this).attr('id');
		console.log(requestId + " / " + responseId);
		
		name = $(this).attr('name');
		
		code ="";
		code += "<span style='color:blue; font-size:1.5em; font-weight:bold;'>'"
		code += name;
		code += "'</span> 님께<br><hr><br>"
		code += "신청하실 일촌명을 입력 해주세요!<br><br>"
		code += "일촌명 <input id='onename' type='text'>"
		code += "<input type='hidden' id='resId' value='" + responseId + "'> "
		code += "<input type='hidden' id='reqId' value='" + requestId + "'> "
		$('.modal-body').html(code);
		
		$("#myModal").show();
		$('#yes, #no').show();
		$('#ok').hide();
	<%
	}
	%>
	
	
	})
})

</script>

<body class="sub">
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
    <div class="ddlist">
    	<div class="container-fluid page_header">
	    	<div class="container d-flex h-100 justify-content-center align-items-center">
	    		<a class="position-absolute header_logo" href="crossGoMain.do"><img alt="" src="<%=request.getContextPath() %>/images/logo/3.jpg"></a>
				<h3 class="text-center page_title">미니홈피 리스트</h3>
	    	</div>
		    
    	</div>
    	<div class="container-fluid cont_background">
		    	<div class="container py-4 cont_wrap">
					<table class="table table-striped table-hover">
						<thead>
						  <tr>
						    <td>
						    	<div class="form-check d-flex justify-content-center align-items-center">
          							<input class="form-check-input" type="checkbox" value="" id="flexCheckDefault" />
        						</div>
        					</td>
        					<td>이름</td>
        					<td>미니홈피 제목</td>
        					<td>일촌신청</td>
						  </tr>
						</thead>
						<tbody>
					<%	for(int i = 0; i < ddlist.size(); i++) {
							DdVO vo = ddlist.get(i); %>
						  <tr>
						  	<td>
						    	<div class="form-check d-flex justify-content-center align-items-center">
          							<input class="form-check-input" type="checkbox" value="" id="flexCheckDefault" />
        						</div>
        					</td>
						  	<td><%=vo.getMem_name() %></td>
						    <td>
						      <a href="<%=request.getContextPath() %>/goDD.do?id=<%=vo.getMem_id() %>" target="_blank">
						      <%=vo.getDd_title() %></a>
						    </td>
					        <td>
						<% 
							if(loginmember != null && vo.getMem_id().equals(loginmember.getMem_id())){
						%>		
							<input class="btn border_btn request" type="button" value="본인" disabled="disabled">
						<%		
							}else{
						%>
					        <input class="btn border_btn request" type="button" value="일촌신청"
					        id="<%=vo.getMem_id() %>" name="<%=vo.getMem_name() %>">
					    <% } %>
					      </td>   
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
    	
<!-- The Modal -->
  <div class="modal" id="myModal">
    <div class="modal-dialog">
      <div class="modal-content">
      
        <!-- Modal Header -->
        <div class="modal-header" style="text-align: center;">
          <h4 class="modal-title">일촌신청</h4>
          <!-- <button type="button" class="close" data-dismiss="modal">&times;</button> -->
        </div>
        
        <!-- Modal body -->
       	<form  id="ff" method="post" enctype="multipart/form-data" action="#">
	        <div class="modal-body">
	        	
	        </div>
	        
	        <!-- Modal footer -->
	        <div class="modal-footer">
	          <button id="yes" type="button" class="btn btn-danger">신청</button>
	          <button id="no" type="button" class="btn btn-danger" data-dismiss="modal">취소</button>
	          
	          <button id="ok" type="button" class="btn btn-danger">확인</button>
	        </div>
        </form>
      </div>
    </div>
  </div>
<!-- The Modal END -->
<footer>
        <p>Copyright © 2022 DDworld.,Ltd. All rights reserved.</p>
    </footer>
</body>
</html>