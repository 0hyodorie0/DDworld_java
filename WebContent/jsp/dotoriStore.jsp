<%@page import="ddw.vo.MemberVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<%
	MemberVO loginMember = (MemberVO)session.getAttribute("loginMember");
%>
<meta charset="UTF-8">
    <title>DD store</title>
    <link rel="stylesheet" href="<%=request.getContextPath() %>/css/bootstrap.min.css">
    <link rel="stylesheet" href="<%=request.getContextPath() %>/css/style.css">
    <script src="<%=request.getContextPath() %>/js/jquery-3.6.0.min.js"></script>
    <script src="<%=request.getContextPath() %>/js/bootstrap.min.js"></script>
    <script src="<%=request.getContextPath() %>/js/script.js"></script>
</head>

<script type="text/javascript">
$(function(){
	$('#spreadhere').on('click','.btn-outline-dark' ,function(){
		alert($(this).attr('id'));
	})

	
	gu = 'P101';
	$.ajax({
  		url			:'/ddWorld/testProdDetail.do',
  		data		: {"lprod_gu" : gu},
  		dataType	:'json',
  		method	    :'get',
  		success	    :function(res){    			
			code = "";
			
			$.each(res,function(i, v){
	  			code += '<div class="col mb-5">';
                code += '<div class="card h-100">';
                code += '<img class="card-img-top" src="../images/storeImages/'
                code += 'dotori.png';
                code += '" alt="MUSIC">';
                code += '<div class="card-body p-4">';
                code += '<div class="text-center">';
                code += '<h5 class="fw-bolder">'
                code += v.prod_con;
                code += '</h5>';
                code += '  ';
                code += v.prod_pa;
                code += ' 원';
                code += '</div></div>'
                code += '<div class="card-footer p-4 pt-0 border-top-0 bg-transparent">'
                code += '<div class="text-center"><a id="'
                code += v.prod_num;
                code += '"class="btn btn-outline-dark mt-auto" href="#">buy now</a></div>';
                code += '</div></div></div>'
		    });
			
			$('#spreadhere').html(code);
			
	    }, 
	    error:function(xhr){
   			alert("상태 : " + xhr.status);		    	
		}
	});//end ajax
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
    	<div class="container-fluid page_header">
	    	<div class="container d-flex h-100 justify-content-center align-items-center">
	    		<a class="position-absolute header_logo" href="<%=request.getContextPath()%>/crossGoMain.do"><img alt="" src="<%=request.getContextPath() %>/images/logo/3.jpg"></a>
				<h3 class="text-center page_title">도토리 상점</h3>
	    	</div>
    	</div>
  
    <div class="store">
    
    	<div class="container-fluid text-center">
    	<%
    	if(loginMember != null){
    	%>
    		<section class="display-inline-block p-1 mywallet">
    			<span class="p-2">나의 지갑 현황 :</span>
    			<span class="p-2"><b><%=loginMember.getMem_name() %></b>님      </span>
    			<span class="p-2">캐시 <b><%=loginMember.getMem_cash() %></b>원  </span>
    			<span class="p-2">도토리 <b><%=loginMember.getMem_dtr() %></b>개   </span>
    		</section>
    		<%} %>
    	</div>
				
		<div class="container-fluid store_list py-4">
			<div class="container">
					
				<section class="py-5">
		            <div class="container px-4 px-lg-5 mt-5">
		                <div id="spreadhere" class="row gx-4 gx-lg-5 row-cols-2 row-cols-md-3 row-cols-xl-5 justify-content-center dtr">
	<!-- ------------------------------------------------------------------------------------------------------- -->	                
	
	<!-- ------------------------------------------------------------------------------------------------------- -->	                     
		                </div>
		            </div>
	        	</section>
			</div>
	    </div>
	</div>
			<!-- Main content END -->

  
	<footer>
        <p>Copyright © 2022 DDworld.,Ltd. All rights reserved.</p>
    </footer>
</body>
</html>