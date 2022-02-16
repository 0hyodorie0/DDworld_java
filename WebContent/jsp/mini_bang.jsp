<%@page import="ddw.vo.GbookVO"%>
<%@page import="java.util.List"%>
<%@page import="ddw.vo.MemberVO"%>
<%@page import="java.util.Map"%>
<%@page import="ddw.vo.DdVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<%
	Map<String, String> keys = (Map<String, String>)session.getAttribute("keys");
	String keyDdworld = keys.get("keyDdworld");

	List<GbookVO> list = (List<GbookVO>)request.getAttribute("list");
	MemberVO memvo = (MemberVO)session.getAttribute("loginMember");
	DdVO ddvo = (DdVO)session.getAttribute(keyDdworld);
%>
<head>
<meta charset="UTF-8">
<title>미니홈피  > 방명록</title>
    <link rel="stylesheet" href="<%=request.getContextPath() %>/css/bootstrap.min.css">
    <link rel="stylesheet" href="<%=request.getContextPath() %>/css/style.css">

    <script src="<%=request.getContextPath() %>/js/jquery-3.6.0.min.js"></script>
    <script src="<%=request.getContextPath() %>/js/bootstrap.min.js"></script>
    <script src="<%=request.getContextPath() %>/js/script.js"></script>
	
</head>
<body class="inner">
	<input type="hidden" value="" name="gbook_add"><%-- 현재 미니홈피 주소 --%>
	<section class="p-3 menu_top">
		<div class="section_title"><%=ddvo.getMem_name() %>님의 방명록 입니다.</div>
	</section>
	<div class="container-fluid mt-4 mb-2">
		<form action="/ddWorld/insertGbook.do" id="write_gbook" name="writeGbook" method="post">
			<input type="hidden" name="gbook_mem"><%--멤버아이디 --%>
			<div class="form-group">
				<section class="row py-4 write_wrap">
					<div class="col-4">
						<div class="minimi_area">
						<%if(memvo != null) { %>
							<img alt="방명록 미니미" src="<%=request.getContextPath() %>/images/minimi/<%=memvo.getMem_mnm()%>">
						<%}else{%>
							<img alt="방명록 미니미" src="<%=request.getContextPath() %>/images/logo/3.jpg">
						<% } %>	
						</div>
					</div>
					<div class="col-8">
						<%if(memvo != null) { %>
						<div class="write_area">
							<textarea rows="5" cols="30" name="gbook_con"></textarea>
						</div>
						<%}else{%>
						<div class="write_area">
							<textarea rows="5" cols="30" name="gbook_con" disabled="disabled">로그인 후 이용해주세요!</textarea>
						</div>
						<% } %>	
					</div>
					<%if(memvo != null) { %>
					
					<div class="form-check gbook_submit">
						<label class="form-check-label"><input class="form-check-input" type="checkbox">비밀로하기</label>
						<input type="submit" class="btn input_btn" value="확인">
					</div>
					<%}%>
						
				</section>
			</div>
		</form>
	</div>
	
	<!-- 여기가 포문 돌아야 함_김재웅-->
	<%
	if(list != null){
		for(int i = 0; i < list.size(); i++){
			GbookVO gbookvo = list.get(i);
			if (i == 0){%>
	<div class="container-fluid article">
		<section class="p-2 gbook_user_info">
			<span style="display:none" class="guest_no"><%=gbookvo.getGuest_no() %></span>
			No.<span><%=gbookvo.getGuest_no() %></span>
			<a class="font-weight-bold gbook_userser" href=""><%=gbookvo.getMem_name() %></a>
			<span class="date"><%=gbookvo.getGuest_date() %></span> <!-- <span class="time">12:30</span> -->
		</section>
		<div class="gbook_group">
			 <section class="row py-4 ">
				<div class="col-4">
					<div class="minimi_area">
						<img alt="방명록 미니미" src="<%=request.getContextPath() %>/images/minimi/<%=gbookvo.getMem_mnm()%>">
					</div>
				</div>
				<div class="col-8">
					<div class="write_area">
						<%=gbookvo.getGuest_con() %>
					</div>
				</div>
			</section>
			
			<%
			if(memvo!=null && memvo.getMem_id().equals(ddvo.getMem_id())){
			%>
			<form action="/ddWorld/insertGbookRe.do" id="write_gbookre" name="writeGbook" method="post">
				<section class="p-2 reply">
					<textarea placeholder="댓글을 입력해 주세요" name="gbook_recon"></textarea>
					<input type="hidden" name="gbook_no" value=<%=gbookvo.getGuest_no()%>>
					<input type="submit" class="btn input_btn p-2" value="확인">
				</section>
			</form>
			<%
			}
			int recountchange = i;
			boolean flag = true;
			while(flag){
				if(recountchange == i && list.get(recountchange).getGuest_renum() != 0){%>
	 <div class="reList reply">
		  <ul class="container">
		 	<li class="d-flex justify-content-between">
		 	 	<span class="reply_writer font-weight-bold"><%=ddvo.getMem_name()%></span>
		 	 	<span class="reply_date"><%=list.get(recountchange).getGuest_redate() %></span>
		 	</li>
	 		<li class="reply_cont my-2 pb-2"> 			 	 
					<%=list.get(recountchange).getGuest_recon() %>	
				<% /* 댓글 작성한 사람만 수정 삭제 할 수 있도록 */ 
				  if(memvo!=null && memvo.getMem_id().equals(ddvo.getMem_id())) { %>
			  <form action="/ddWorld/deleteGbookRe.do" id="delorup_gbookre" name="delorupGbookre" method="post">
				 <input type="hidden" name="gbookre_no" value=<%=list.get(recountchange).getGuest_renum()%>>
				 <input type ="button" class="delORup uptGre" idx="<%=gbookvo.getGuest_no_1() %>" value="수정">	
				 <input type ="submit" class="delORup delGre" idx="<%=gbookvo.getGuest_no_1() %>" value="삭제">
			  </form>	
				 <% }%>
			 </li>
		   </ul>
	</div>
			<%	}else if(recountchange != i && list.get(recountchange).getGuest_renum() !=0 && list.get(recountchange).getGuest_no_1() == list.get(i).getGuest_no_1()){%>
	<div class="reList reply">
		  <ul class="container">
		 	<li class="d-flex justify-content-between">
		 	 	<span class="reply_writer font-weight-bold"><%=ddvo.getMem_name()%></span>
		 	 	<span class="reply_date"><%=list.get(recountchange).getGuest_redate() %></span>
		 	</li>
	 		<li class="reply_cont my-2 pb-2"> 			 	 
					<%=list.get(recountchange).getGuest_recon() %>	
				<% /* 댓글 작성한 사람만 수정 삭제 할 수 있도록 */ 
				  if(memvo!=null && memvo.getMem_id().equals(ddvo.getMem_id())) { %>
			  <form action="/ddWorld/deleteGbookRe.do" id="delorup_gbookre" name="delorupGbookre" method="post">
				 <input type="hidden" name="gbookre_no" value=<%=list.get(recountchange).getGuest_renum()%>>
				 <input type ="button" class="delORup uptGre" idx="<%=gbookvo.getGuest_no_1() %>" value="수정">	
				 <input type ="submit" class="delORup delGre" idx="<%=gbookvo.getGuest_no_1() %>" value="삭제">
			  </form>	
				 <% }%>
			 </li>
		   </ul>
	</div>
			<%	}
				recountchange++;
				if(recountchange == list.size()){recountchange = list.size()-1; flag = false;}
				if(list.get(i).getGuest_no() != list.get(recountchange).getGuest_no()){
					flag = false;
				}
			}
			%>
		</div>
	</div>
	<%	}
		else if(i > 0 && list.get(i).getGuest_no() != list.get(i-1).getGuest_no()){
	%>		
	<div class="container-fluid article">
		<section class="p-2 gbook_user_info">
			<span style="display:none" class="guest_no"><%=gbookvo.getGuest_no() %></span>
			No.<span><%=gbookvo.getGuest_no() %></span>
			<a class="font-weight-bold gbook_userser" href=""><%=gbookvo.getMem_name() %></a>
			<span class="date"><%=gbookvo.getGuest_date() %></span> <!-- <span class="time">12:30</span> -->
		</section>
		<div class="gbook_group">
			 <section class="row py-4 ">
				<div class="col-4">
					<div class="minimi_area">
						<img alt="방명록 미니미" src="<%=request.getContextPath() %>/images/minimi/<%=gbookvo.getMem_mnm()%>">
					</div>
				</div>
				<div class="col-8">
					<div class="write_area">
						<%=gbookvo.getGuest_con() %>
					</div>
				</div>
			</section>
			
			<%
			if(memvo!=null && memvo.getMem_id().equals(ddvo.getMem_id())){
			%>
			<form action="/ddWorld/insertGbookRe.do" id="write_gbookre" name="writeGbook" method="post">
				<section class="p-2 reply">
					<textarea placeholder="댓글을 입력해 주세요" name="gbook_recon"></textarea>
					<input type="hidden" name="gbook_no" value=<%=gbookvo.getGuest_no()%>>
					<input type="submit" class="btn input_btn p-2" value="확인">
				</section>
			</form>
			<%
			}
			%>
			<%
			int recountchange = i;
			boolean flag = true;
			while(flag){
				if(recountchange == i && list.get(recountchange).getGuest_renum() != 0){%>
	 <div class="reList reply">
		  <ul class="container">
		 	<li class="d-flex justify-content-between">
		 	 	<span class="reply_writer font-weight-bold"><%=ddvo.getMem_name()%></span>
		 	 	<span class="reply_date"><%=list.get(recountchange).getGuest_redate() %></span>
		 	</li>
	 		<li class="reply_cont my-2 pb-2"> 			 	 
					<%=list.get(recountchange).getGuest_recon() %>	
				<% /* 댓글 작성한 사람만 수정 삭제 할 수 있도록 */ 
				  if(memvo!=null && memvo.getMem_id().equals(ddvo.getMem_id())) { %>
			  <form action="/ddWorld/deleteGbookRe.do" id="delorup_gbookre" name="delorupGbookre" method="post">
				 <input type="hidden" name="gbookre_no" value=<%=list.get(recountchange).getGuest_renum()%>>
				 <input type ="button" class="delORup uptGre" idx="<%=gbookvo.getGuest_no_1() %>" value="수정">	
				 <input type ="submit" class="delORup delGre" idx="<%=gbookvo.getGuest_no_1() %>" value="삭제">
			  </form>	
				 <% }%>
			 </li>
		   </ul>
	</div>
			<%	}else if(recountchange != i && list.get(recountchange).getGuest_renum() !=0 && list.get(recountchange).getGuest_no_1() == list.get(i).getGuest_no_1()){%>
	<div class="reList reply">
		  <ul class="container">
		 	<li class="d-flex justify-content-between">
		 	 	<span class="reply_writer font-weight-bold"><%=ddvo.getMem_name()%></span>
		 	 	<span class="reply_date"><%=list.get(recountchange).getGuest_redate() %></span>
		 	</li>
	 		<li class="reply_cont my-2 pb-2"> 			 	 
					<%=list.get(recountchange).getGuest_recon() %>	
				<% /* 댓글 작성한 사람만 수정 삭제 할 수 있도록 */ 
				  if(memvo!=null && memvo.getMem_id().equals(ddvo.getMem_id())) { %>
			  <form action="/ddWorld/deleteGbookRe.do" id="delorup_gbookre" name="delorupGbookre" method="post">
				 <input type="hidden" name="gbookre_no" value=<%=list.get(recountchange).getGuest_renum()%>>
				 <input type ="button" class="delORup uptGre" idx="<%=gbookvo.getGuest_no_1() %>" value="수정">	
				 <input type ="submit" class="delORup delGre" idx="<%=gbookvo.getGuest_no_1() %>" value="삭제">
			  </form>	
				 <% }%>
			 </li>
		   </ul>
	</div>
			<%	}
				recountchange++;
				if(recountchange == list.size()){recountchange = list.size()-1; flag = false;}
				if(list.get(i).getGuest_no() != list.get(recountchange).getGuest_no()){
					flag = false;
				}
			}	
			%>
		</div>
	</div>


	   
	<%		
	}}//방명록+방명록 댓글  통합 리스트 for문 종료
	}else {
	%>	
	<div class="container-fluid gbook_article">
		<section class="p-2 gbook_user_info">
			No.<span>01</span>
			<a class="font-weight-bold gbook_userser" href="">관리자</a>
			<span class="date">2022.01.03</span> <span class="time">15:30</span>
		</section>
		<div class="gbook_group">
			 <section class="row py-4 ">
				<div class="col-4">
					<div class="minimi_area">
					<%-- 이미지 경로 모르겠음 - 손효선 --%>
						<img alt="방명록 미니미" src="<%=request.getContextPath() %>/WebContent/images/minimi_f_2.png">
					</div>
				</div>
				<div class="col-8">
					<div class="write_area">
						안녕하세요! ddworld 관리자입니다.<br>
						즐거운 하루 되세요.
					</div>
				</div>
			</section>
			<section class="p-2 gbook_reply">
				<textarea></textarea>
				<input type="button" class="btn input_btn p-2" value="확인">
			</section>
		</div>
	</div>
	<%	
	}
	%>
	
	
	<!------------------------------------------------------------------------------->
	
	
	
	<ul class="pagination justify-content-center">
    <li class="page-item"><a class="page-link" href="javascript:void(0);">Previous</a></li>
    <li class="page-item"><a class="page-link" href="javascript:void(0);">1</a></li>
    <li class="page-item"><a class="page-link" href="javascript:void(0);">2</a></li>
    <li class="page-item"><a class="page-link" href="javascript:void(0);">Next</a></li>
  </ul>
	
</body>
</html>