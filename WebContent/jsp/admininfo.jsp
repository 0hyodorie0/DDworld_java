<%@page import="ddw.vo.DdVO"%>
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
<script>
$(function(){
	pickid = "";
	dotoriqty = "";
	pickname = "";
	$(document).on('click', '.givedotori', function(){
		pickid = $(this).attr('idx');
		pickname = $(this).attr('name');
		code = '<span style="font-size:30px; color:blue; font-weight:bold;">';
		code += pickname + '</span>님에게<br>';
		code += '증정하실 도토리를 입력해주세요.<br><br>';
		code += '<input type="text" id="dotoriqty"><br>';
		
		$('.modal-body').html(code);
		
		$('#dotoriModal').show();
	})
	
	$('#plus').on('click', function(){
		dotoriqty = $('#dotoriqty').val();
		
		$.ajax({
     		url:'/ddWorld/giveDotori.do',
     		data:{'pickid' : pickid,
     			  'dotoriqty': dotoriqty}, 
     		method:'get',
     		success:function(res){    			
     			
	        }, 
	         error:function(xhr){
	        	alert(pickid + '님에게 도토리 ' + dotoriqty +'개를 증정했습니다.');    	
   			}
		});//end ajax
		
		$('#dotoriModal').hide();
		
		$.ajax({
     		url:'/ddWorld/adminMemberview.do',
     		dataType:'json', 
     		method:'get',
     		success:function(res){    			
    			
   			 code = "<table class='table'>";
	   			 code += "<thead>";
				 code += "<tr>";
				 code += "<th>아이디</th>";
				 code +=  "<th>이름</th>";
				 code +=   "<th>전화번호</th>";
				 code +=   "<th>우편번호</th>";
				 code +=   "<th>주소</th>";
				 code +=   "<th>메일</th>";
				 code +=   "<th>도토리 </th>";
				 code +=   "<th>타입</th>";		
				 code +=   "<th></th>";		
				 code +=" </tr>";
				 code +=" </thead>";
				 
   			$.each(res,function(i, v){
   			 code += "<tr>";
	 		     code += "<td>"+ v.id +"</td>";
	 		     code += "<td>"+ v.name +"</td>"; 
	 		     code += "<td>"+ v.tel +"</td>" ;
	 		     code += "<td>"+ v.zip +"</td>" ;
	 		     code += "<td>"+ v.add1 +"</td>" ;
	 		     code += "<td>"+ v.mail +"</td>"; 
	 		     code += "<td>"+ v.dtr +"</td>" ;
	 		     code += "<td>"+ v.type +"</td>";
	 		     code += "<td><input type='button' class='givedotori'";
	 		     code += "idx=";
	 		     code += v.id;
	 		     code += " name="+v.name+" value='수정'></td> </tr>"; 
   		     });
                code += "</table>"
			     
   		     $('#detail').html(code);
	         }, 
	         
	         error:function(xhr){
      			  alert("상태 : " + xhr.status);		    	
   			 }
		});//end ajax
	})
	
	$('#end').on('click', function(){
		$('#dotoriModal').hide();
	})
	
	$('#btn1').on('click', function () {
     	  $.ajax({
     		url:'/ddWorld/adminMemberview.do',
     		dataType:'json', 
     		method:'get',
     		success:function(res){    			
    			
   			 code = "<table class='table'>";
	   			 code += "<thead>";
				 code += "<tr>";
				 code += "<th>아이디</th>";
				 code +=  "<th>이름</th>";
				 code +=   "<th>전화번호</th>";
				 code +=   "<th>우편번호</th>";
				 code +=   "<th>주소</th>";
				 code +=   "<th>메일</th>";
				 code +=   "<th>도토리 </th>";
				 code +=   "<th>타입</th>";		
				 code +=   "<th></th>";		
				 code +=" </tr>";
				 code +=" </thead>";
				 
   			$.each(res,function(i, v){
   			 code += "<tr>";
	 		     code += "<td>"+ v.id +"</td>";
	 		     code += "<td>"+ v.name +"</td>"; 
	 		     code += "<td>"+ v.tel +"</td>" ;
	 		     code += "<td>"+ v.zip +"</td>" ;
	 		     code += "<td>"+ v.add1 +"</td>" ;
	 		     code += "<td>"+ v.mail +"</td>"; 
	 		     code += "<td>"+ v.dtr +"</td>" ;
	 		     code += "<td>"+ v.type +"</td>";
	 		     code += "<td><input type='button' class='givedotori'";
	 		     code += "idx=";
	 		     code += v.id;
	 		     code += " name="+v.name+" value='수정'></td> </tr>"; 
   		     });
                code += "</table>"
			     
   		     $('#detail').html(code);
	         }, 
	         
	         
	         
	         error:function(xhr){
      			  alert("상태 : " + xhr.status);		    	
   			 }
		});//end ajax
	});//end btn1
	
	$('#btn2').on('click', function () {
     	  $.ajax({
     		url:'/ddWorld/adminMemberview1.do',
     		dataType:'json', 
     		method:'get',
     		success:function(res){    			
    			
   			 code = "<table class='table'>";
	   			 code += "<thead>";
				 code += "<tr>";
				 code += "<th>아이디</th>";
				 code +=  "<th>이름</th>";
				 code +=   "<th>전화번호</th>";
				 code +=   "<th>우편번호</th>";
				 code +=   "<th>주소</th>";
				 code +=   "<th>메일</th>";
				 code +=   "<th>도토리 </th>";
				 code +=   "<th>타입</th>";		
				 code +=   "<th></th>";		
				 code +=" </tr>";
				 code +=" </thead>";
				 
   			$.each(res,function(i, v){
   			 code += "<tr>";
	 		     code += "<td>"+ v.id +"</td>";
	 		     code += "<td>"+ v.name +"</td>"; 
	 		     code += "<td>"+ v.tel +"</td>" ;
	 		     code += "<td>"+ v.zip +"</td>" ;
	 		     code += "<td>"+ v.add1 +"</td>" ;
	 		     code += "<td>"+ v.mail +"</td>"; 
	 		     code += "<td>"+ v.dtr +"</td>" ;
	 		     code += "<td>"+ v.type +"</td>";
	 		     code += "<td><input type='button' value='확인'></td> </tr>"; 
	 		     
   		     });
                code += "</table>"
			     
   		     $('#detail').html(code);
	         }, 
	         
	         error:function(xhr){
      			  alert("상태 : " + xhr.status);		    	
   			 }
		});//end ajax
	});//end btn2
	
	$('#btn3').on('click', function () {
     	  $.ajax({
     		url:'/ddWorld/adminMemberview2.do',
     		 dataType:'json', 
     		method:'get',
     		success:function(res){    			
    			
   			 code = "<table class='table table-hover'>";
	   			 code += "<thead>";
				 code += "<tr>";
				 code += "<th>아이디</th>";
				 code +=  "<th>이름</th>";
				 code +=   "<th>전화번호</th>";
				 code +=   "<th>우편번호</th>";
				 code +=   "<th>주소</th>";
				 code +=   "<th>메일</th>";
				 code +=   "<th>도토리 </th>";
				 code +=   "<th>타입</th>";		
				 code +=   "<th></th>";		
				 code +=" </tr>";
				 code +=" </thead>";
				 
   			$.each(res,function(i, v){
   			 code += "<tr>";
	 		     code += "<td>"+ v.id +"</td>";
	 		     code += "<td>"+ v.name +"</td>"; 
	 		     code += "<td>"+ v.tel +"</td>" ;
	 		     code += "<td>"+ v.zip +"</td>" ;
	 		     code += "<td>"+ v.add1 +"</td>" ;
	 		     code += "<td>"+ v.mail +"</td>"; 
	 		     code += "<td>"+ v.dtr +"</td>" ;
	 		     code += "<td>"+ v.type +"</td>";
	 		     code += "<td><input type='button' value='수정'></td> </tr>"; 
   		     });
                code += "</table>"
			     
   		     $('#detail').html(code);
	         }, 
	         
	         error:function(xhr){
      			  alert("상태 : " + xhr.status);		    	
   			 }
		});//end ajax
	});//end btn3
});//end function

</script>    
    
    
    
    
</head>
<body>
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
<div class="">
	<div class="container-fluid page_header">
 	<div class="container d-flex h-100 justify-content-center align-items-center">
 		<a class="position-absolute header_logo" href="<%=request.getContextPath()%>/crossGoMain.do"><img alt="" src="<%=request.getContextPath() %>/images/logo/3.jpg"></a>
    	<h3 class="text-center page_title">회원관리</h3>
 	</div>
  
	</div>
	<div class="container-fluid cont_background">
 	<div class="container py-4 cont_wrap">	
	
	  <div class="d-flex justify-content-around align-items-center p-3">

		 	<input type="button" value="회원" id="btn1" class="col-4 btn m-2">
	
		 	<input type="button" value="비회원" id="btn2" class="col-4 btn m-2">
	
		 	<input type="button" value="관리자" id="btn3" class="col-4 btn m-2">
		</div>
	 	
	 	

        <br><br>
		<div id="detail"><!-- 내용나오는공간 --></div> 
 
<!-- The Modal -->
  <div class="modal" id="dotoriModal">
    <div class="modal-dialog">
      <div class="modal-content">
      
        <!-- Modal Header -->
        <div class="modal-header" style="text-align: center;">
          <h4 class="modal-title">도토리를 증정하시겠습니까?</h4>
          <!-- <button type="button" class="close" data-dismiss="modal">&times;</button> -->
        </div>
        
        <!-- Modal body -->
       	<form  id="ff" method="post" enctype="multipart/form-data" action="#">
	        <div class="modal-body">
	        	
	        </div>
	        
	        <!-- Modal footer -->
	        <div class="modal-footer">
	          <button id="plus" type="button" class="btn btn-danger">도토리 증정</button>
	          <button id="end" type="button" class="btn btn-danger">취소</button>
	        </div>
        </form>
      </div>
    </div>
  </div>
<!-- The Modal END -->
 
 
 
 
 
</div>
</div>
</div>



</body>
</html>