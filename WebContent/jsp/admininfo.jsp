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
	 		     code += "<td><input type='button' value='수정'></td> </tr>"; 
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
	 		     code += "<td><input type='button' value='수정'></td> </tr>"; 
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
	
	  

	 	<input type="button" value="회원" id="btn1">

	 	<input type="button" value="비회원" id="btn2">

	 	<input type="button" value="관리자" id="btn3">

	 	
	 	

        <br><br>
		<div id="detail"><!-- 내용나오는공간 --></div> 
 
 
 
 
 
 
 
</div>
</div>
</div>



</body>
</html>