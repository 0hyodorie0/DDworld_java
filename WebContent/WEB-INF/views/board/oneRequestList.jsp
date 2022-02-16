<%@page import="java.util.Map"%>
<%@page import="ddw.controller.CheckOne"%>
<%@page import="ddw.vo.OneVO"%>
<%@page import="ddw.vo.DdVO"%>
<%@page import="java.util.List"%>
<%@page import="ddw.vo.MemberVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<%
	MemberVO loginmember = (MemberVO)session.getAttribute("loginMember");

	List<OneVO> list = (List<OneVO>)request.getAttribute("list");
	List<OneVO> list2 = (List<OneVO>)request.getAttribute("list2");
	List<OneVO> onelist = (List<OneVO>)request.getAttribute("onelist");
	
	//Map<String, String> keys = (Map<String, String>)session.getAttribute("keys");
	//String keyOnelist = keys.get("keyOnelist");
	//List<DdVO> ddlist = (List<DdVO>)request.getAttribute("list");
	//List<CheckOne> checklist = (List<CheckOne>)request.getAttribute("list");
%>

<head>
	<meta charset="UTF-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
	<title>main > 일촌수락 목록</title>
	<link rel="stylesheet" href="<%=request.getContextPath() %>/css/bootstrap.min.css">
    <link rel="stylesheet" href="<%=request.getContextPath() %>/css/style.css">
	<script src="<%=request.getContextPath() %>/js/jquery-3.6.0.min.js"></script>
	<script src="<%=request.getContextPath() %>/js/bootstrap.min.js"></script>
    <script src="<%=request.getContextPath() %>/js/script.js"></script>
</head>

<script>
$(function(){
	$('.modal').hide();
	$('#ok, #end').hide();
	
	selectiontype = "";
	pickid = "";
	acceptonename = "";
	
	
	$('.selection').on('click', function(){
		
		selectiontype = $(this).attr('name');
		pickid = $(this).attr('idx');
		code = "";
		if(selectiontype == 'yes'){
			$('#ok, #end').show();
			code += "신청받으실 일촌명을 입력 해주세요!<br><br>"
			code += "일촌명 <input id='resonename' type='text'><br><br>"
				
			$('.modal-body').html(code);
			$("#myModal").show();
		}else if(selectiontype == 'cancel'){
			$('#ok, #end').show();
			code += "<br>일촌신청을 취소하시겠습니까?<br><br>"
			$('.modal-body').html(code);
			$("#myModal").show();
		}else{
			$('#ok, #end').show();
			code += "<br>일촌신청을 거절하시겠습니까?<br><br>"
			$('.modal-body').html(code);
			$("#myModal").show();
		}
	})

	
	$('#ok').on('click', function(){
		acceptonename = $('#resonename').val();
		$('.modal').hide();
		location.href = "/ddWorld/acceptDenialOne.do?type="+selectiontype+"&id="+pickid+"&logid=<%=loginmember.getMem_id() %>&onename="+acceptonename+"";
	})
	
	$('#end').on('click', function(){
		$('.modal').hide();
	})
})


</script>


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
    <div class="ddlist">
    	<div class="container-fluid page_header">
	    	<div class="container d-flex h-100 justify-content-center align-items-center">
	    		<a class="position-absolute header_logo" href="crossGoMain.do"><img alt="" src="<%=request.getContextPath() %>/images/logo/3.jpg"></a>
				<h3 class="text-center page_title">'<%=loginmember.getMem_name() %>'님의 일촌 현황</h3>
	    	</div>
    	</div>
    	
    	<div class="container-fluid cont_background">
		    	<div class="container py-4 cont_wrap">
					<ul class="nav nav-tabs" role="tablist">
					    <li class="nav-item">
					      <a class="nav-link active" data-toggle="tab" href="#menu0">내가 한 일촌신청 목록</a>
					    </li>
					    <li class="nav-item">
					      <a class="nav-link" data-toggle="tab" href="#menu1">나에게 온 일촌신청 목록</a>
					    </li>
					    <li class="nav-item">
					      <a class="nav-link" data-toggle="tab" href="#menu2">내 일촌 목록</a>
					    </li>
				    </ul>
				<div class="tab-content">
					<div class="container tab-pane active" id="menu0">
							<table class="table table-striped table-hover" >
								<thead>
								  <tr>
								    <td>
								    	<div class="form-check d-flex justify-content-center align-items-center">
		          							<input class="form-check-input" type="checkbox" value="" id="flexCheckDefault" />
		        						</div>
		        					</td>
		        					<td>이름</td>
		        					<td>일촌명 </td>
		        					<td>홈피 가보기</td>
		        					<td>신청취소</td>
								  </tr>
								</thead>
								<tbody>
								<% 
									for(int i = 0; i < list2.size(); i++){
										OneVO vo = list2.get(i);	
								%>
									<tr>
										<td>
											<div class="form-check d-flex justify-content-center align-items-center">
													<input class="form-check-input" type="checkbox" value="" id="" />
											</div>
										</td>
										<td>
											<span id="onename"><%=vo.getMem_name() %></span>
										</td>
										<td class="reqonename">
											<%=vo.getOne_name() %>
										</td>
										<td>
											<a href="<%=request.getContextPath()%>/goDD.do?id=<%=vo.getMem_id2()%>"><%=vo.getDd_title() %></a>
										</td>
										<td>
											<input idx="<%=vo.getMem_id2() %>" class="selection" type="button" name="cancel" value="신청취소">
											<%
												} 
											%>
										</td>
									</tr>
								</tbody>
							</table>
						</div>
						<div class="container tab-pane fade" id="menu1">
							<table class="table table-striped table-hover" >
								<thead>
								  <tr>
								    <td>
								    	<div class="form-check d-flex justify-content-center align-items-center">
		          							<input class="form-check-input" type="checkbox" value="" id="flexCheckDefault" />
		        						</div>
		        					</td>
		        					<td>이름</td>
		        					<td>일촌명 </td>
		        					<td>홈피 가보기</td>
		        					<td>수락해주세요!</td>
								  </tr>
								</thead>
								<tbody>
								<% 
									for(int i = 0; i < list.size(); i++){
										OneVO vo = list.get(i);	
								%>
									<tr>
										<td>
											<div class="form-check d-flex justify-content-center align-items-center">
													<input class="form-check-input" type="checkbox" value="" id="flexCheckDefault" />
											</div>
										</td>
										<td>
											<span id="onename"><%=vo.getMem_name() %></span>
										</td>
										<td class="reqonename">
											<%=vo.getOne_name() %>
										</td>
										<td>
											<a href="<%=request.getContextPath()%>/goDD.do?id=<%=vo.getMem_id()%>"><%=vo.getDd_title() %></a>
										</td>
										<td>
											<input idx="<%=vo.getMem_id() %>" class="selection" type="button" name="yes" value="수락">
											<input idx="<%=vo.getMem_id() %>" class="selection" type="button" name="no" value="거절">
											<%
												} 
											%>
										</td>
									</tr>
								</tbody>
							</table>
						</div>
						<div id="menu2" class="container tab-pane fade">
							<table  class="table table-striped table-hover" >
								<thead>
								  <tr>
								    <td>
								    	<div class="form-check d-flex justify-content-center align-items-center">
		          							<input class="form-check-input" type="checkbox" value="" id="" />
		        						</div>
		        					</td>
		        					<td>이름</td>
		        					<td>일촌명 </td>
		        					<td>홈피 가보기</td>
								  </tr>
								</thead>
								<tbody>
									<%
										for(int i = 0; i < onelist.size(); i++){
											OneVO onevo = onelist.get(i);	
									%>
									
									<tr>
										<td>
											<div class="form-check d-flex justify-content-center align-items-center">
													<input class="form-check-input" type="checkbox" value="" id="flexCheckDefault" />
											</div>
										</td>
										<td>
											<span id="onename"><%=onevo.getMem_name() %></span>
										</td>
										<td>
											<%=onevo.getOne_name() %>
										</td>
										<td>
											<a href="<%=request.getContextPath()%>/goDD.do?id=<%=onevo.getMem_id2()%>"><%=onevo.getDd_title() %></a>
										</td>
									</tr>
									
									<%
										}
									%>
								</tbody>
							</table>
						</div>
					</div>
				</div>
		</div>
	</div>
	
<!-- The Modal -->
  <div class="modal" id="myModal">
    <div class="modal-dialog">
      <div class="modal-content">
      
        <!-- Modal Header -->
        <div class="modal-header" style="text-align: center;">
          <h4 class="modal-title">일촌수락</h4>
          <!-- <button type="button" class="close" data-dismiss="modal">&times;</button> -->
        </div>
        
        <!-- Modal body -->
       	<form  id="ff" method="post" enctype="multipart/form-data" action="#">
	        <div class="modal-body">
	        	
	        </div>
	        
	        <!-- Modal footer -->
	        <div class="modal-footer">
	          <button id="ok" type="button" class="btn btn-danger">확인</button>
	          <button id="end" type="button" class="btn btn-danger">취소</button>
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