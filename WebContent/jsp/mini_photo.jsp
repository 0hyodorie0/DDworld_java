<%@page import="ddw.vo.PhotoreVO"%>
<%@page import="ddw.vo.PhotoVO"%>
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

	MemberVO memvo = (MemberVO)session.getAttribute("loginMember");
	DdVO ddvo = (DdVO)session.getAttribute(keyDdworld);
	
	
	List<PhotoVO> list = (List<PhotoVO>)request.getAttribute("list");	
    List<PhotoreVO> photore = (List<PhotoreVO>)request.getAttribute("photore");

%>

<head>
<meta charset="UTF-8">
<title>(대기중)미니홈피  > 사진첩</title>
	<link rel="stylesheet" href="<%=request.getContextPath() %>/css/bootstrap.min.css">
    <link rel="stylesheet" href="<%=request.getContextPath() %>/css/style.css">

    <script src="<%=request.getContextPath() %>/js/jquery-3.6.0.min.js"></script>
    <script src="<%=request.getContextPath() %>/js/bootstrap.min.js"></script>
    <script src="<%=request.getContextPath() %>/js/script.js"></script>


</head>


<script type="text/javascript">
$(function () {
	$('.delORup').on('click', function(){
		alert($(this).val()+'기능 개발중 / 댓글번호 : '+$(this).attr('idx'));
	})
	
	$('#ff').on('submit', function(){
		
		var form = new FormData();
        form.append( "chooseFile", $("#chooseFile")[0].files[0] );
		
		var filename = $('#chooseFile').get(0).files[0].name;
		var filecon = $('#con').val()
		
		$.ajax({
			url		: '/ddWorld/temp01.do',
			method	: 'get',
			data 	: {'photo_pt' : filename, 'photo_con' : filecon},
			success : function(res){
				code = "<span>갔다옴</span>";
				
				$('#result').html(code);
			},
			error : function(xhr){
				alert("상태 : " + xhr.status);
			}
		})	
	})	
})
</script>

<body>
	<section class="p-3 menu_top">
		<div class="section_title"><%=ddvo.getMem_name() %>님의 사진첩 입니다.</div>
			<%
				if(memvo!=null && memvo.getMem_id().equals(ddvo.getMem_id())){
			%>
				<input id="btn1" class="btn" type="button" value="사진등록" data-toggle="modal" data-target="#myModal" onchange="loadFile(this)">	
			<%	} %>		
	</section>
	<section class="">
		<div id="here">
		<%
			for(int i = 0; i < list.size(); i++){
				PhotoVO photovo = list.get(i);
		%>
		<div class="article">
			<div class="p-1 d-flex justify-content-between photo_info">
				<div class="pl-2">No.<%=photovo.getPhoto_no() %></div>
				<div class="pr-2"><%=photovo.getPhoto_date() %></div> 
			</div>
			<div class="mb-4 photo_con">
			<%
				if(memvo!=null && memvo.getMem_id().equals(ddvo.getMem_id())){
			%>
				<div class="d-flex justify-content-end">
					<a class="p-2" href="">수정</a>
					<a class="p-2" href="">삭제</a>
				</div>
			<%} %>
				<img alt="" src="<%=request.getContextPath() %>/images/photo/<%=photovo.getPhoto_pt() %>">
				<p><%=photovo.getPhoto_con() %></p>
			</div>
			
                <!--  댓글 찍는 부분 : box 처리 하기 -->
			 <div class="reList reply">  
				<% if(photovo.getPhotoreList() != null && photovo.getPhotoreList().size()>0){
					for(PhotoreVO revo : photovo.getPhotoreList()){
				  %>
			 	<ul class="container">
			 	  <li class="d-flex justify-content-between">
			 	 <span class="reply_writer font-weight-bold"><%=revo.getMem_name()%></span>
			 	 <span class="reply_date"><%=revo.getPhoto_redate() %></span>
			 	 </li>
		 			<li class="reply_cont my-2 pb-2"> 			 	 
						<%=revo.getPhoto_recon() %>	
					<% /* 댓글 작성한 사람만 수정 삭제 할 수 있도록 */ 
					  if(memvo!=null && memvo.getMem_id().equals(revo.getMem_id())) { %>
					 <input type ="button" class="delORup" idx="<%=revo.getPhoto_renum() %>" value="수정">	
					 <input type ="button" class="delORup" idx="<%=revo.getPhoto_renum() %>" value="삭제">	
					<% }
					 /* 미니홈피 주인만 댓글 삭제 할 수 있도록 */ 
					 else if(memvo!=null && memvo.getMem_id().equals(ddvo.getMem_id()) ){
					%>
					<input type ="button" class="delORup" idx="<%=revo.getPhoto_renum() %>" value="삭제">	
					<% 
					}					
					%>
					</li>
				</ul>
					
			<% 		} 
				}
			 %>	
			    
			 </div>   
			    		 	
 		   <%
 			    /* 로그인안 회원만 댓글 달수 있도록 조건 ! */
				if (memvo != null) {
			%>
			
			<section class="p-2 reply">
				<label>댓글달기</label>
				<form method="POST" action="/ddWorld/photoreplyinsert.do">
				<textarea placeholder="댓글을 입력해 주세요" name="photo_recon"></textarea>
				<!-- 사진첩 글번호 -->
				<input type="hidden" name="photo_no" value=<%=photovo.getPhoto_no()%>>
				<!-- 작성 아이디 -->
				<input type="hidden" name="mem_id" value=<%=memvo.getMem_id()%>>
				<input type="submit" class="btn input_btn p-2" value="등록">
				</form>
				
			</section>	
		<%		
 				}
 		%>
		</div>		
 		<%	
				 } // 사진첩 시작 for문 end; 
		%>
		</div>
	</section>
	
	<div class="modal" id="myModal">
    <div class="modal-dialog">
      <div class="modal-content">
      
        <!-- Modal Header -->
        <div class="modal-header">
          <h4 class="modal-title">새 사진 등록하기</h4>
          <button type="button" class="close" data-dismiss="modal">&times;</button>
        </div>
        
        <!-- Modal body -->
       	<form  id="ff" method="post" enctype="multipart/form-data" action="/ddWorld/temp01.do">
	        <div class="modal-body">
	        		내용<br><br>
	        		<input id="con" name="imgcon" type="textarea" style="width:450px; height: 300px;">
	        		<br><br>
				    <input type="file" id="chooseFile" name="chooseFile" accept="image/*">
	        </div>
	        
	        
	        <!-- Modal footer -->
	        <div class="modal-footer">
	          <button type="submit" class="btn btn-danger">등록</button>
	        </div>
        </form>
        
      </div>
    </div>
  </div>
  
  <div id="result">
  </div>
	
	
</body>
</html>







