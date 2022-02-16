<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
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
	$('.btn btn-outline-dark mt-auto').on('click', function(){
		alert($(this).attr('id'));
	})
	
	$('.nav-link').on('click', function(){
		gu = $(this).attr('id')
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
	                if(v.lprod_gu == "P301"){
	                	code += 'music.png';
	                }else{
	                	code += v.prod_nm;
	                }
	                code += '" alt="MUSIC">';
	                code += '<div class="card-body p-4">';
	                code += '<div class="text-center">';
	                code += '<h5 class="fw-bolder">'
	                code += v.prod_con;
	                code += '</h5>';
	                code += '도토리 ';
	                code += v.prod_pa;
	                code += ' 개';
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
})
</script>

<body>
  <header>
        <nav class="navbar fixed-top">
            <a class="nav-link" href="#">Dotori Shop</a>
            <a class="nav-link" href="#">Notice</a>
            <a class="nav-link" href="#">MiniHome</a>
            <a class="nav-link" href="#">FAQ</a>
        </nav>
  </header>
  
    <div class="store">
    	<div class="container-fluid page_header">
	    	<div class="container d-flex h-100 justify-content-center align-items-center">
				<h3 class="text-center page_title">상점</h3>
	    	</div>
    	</div>
				
		<div class="container-fluid store_list py-4">
		<div class="container">
			<ul class="nav nav-pills py-3 justify-content-center align-items-center" id="pills-tab" role="tablist">
			  <li class="nav-item">
			    <a class="nav-link active" id="showall-tab" data-toggle="pill" href="#showall" role="tab" aria-controls="showall" aria-selected="true">전체보기</a>
			  </li>
			  <li class="nav-item">
			    <a class="nav-link" id="P201" data-toggle="pill" href="#" role="tab" aria-controls="skin" aria-selected="false">배경스킨</a>
			  </li>
			  <li class="nav-item">
			    <a class="nav-link" id="P301" data-toggle="pill" href="#" role="tab" aria-controls="music" aria-selected="false">배경음악</a>
			  </li>
			  <li class="nav-item">
			    <a class="nav-link" id="P401" data-toggle="pill" href="#" role="tab" aria-controls="minimi" aria-selected="false">미니미</a>
			  </li>
			  <li class="nav-item">
			    <a class="nav-link" id="P501" data-toggle="pill" href="#" role="tab" aria-controls="minicon" aria-selected="false">미니콘</a>
			  </li>
			  <li class="nav-item">
			    <a class="nav-link" id="P601" data-toggle="pill" href="#" role="tab" aria-controls="miniroom" aria-selected="false">미니룸</a>
			  </li>
			</ul>
				
			<section class="py-5">
	            <div class="container px-4 px-lg-5 mt-5">
	                <div id="spreadhere" class="row gx-4 gx-lg-5 row-cols-2 row-cols-md-3 row-cols-xl-4 justify-content-center">
<!-- ------------------------------------------------------------------------------------------------------- -->	                
	                    <div class="col mb-5">
	                        <div class="card h-100">
	                          <!-- Product image-->
	                          <img class="card-img-top" src="<%=request.getContextPath() %>/images/skin/skin_3.jpg" alt="...">
	                          <!-- Product details-->
	                          <div class="card-body p-4">
	                          	<div class="text-center">
	                              <!-- Product name-->
	                                <h5 class="fw-bolder">Fancy Product</h5>
	                                <!-- Product price-->
	                                $40.00 - $80.00
	                            </div>
	                          </div>
	                          <!-- Product actions-->
	                          <div class="card-footer p-4 pt-0 border-top-0 bg-transparent">
	                            <div class="text-center"><a class="btn btn-outline-dark mt-auto" href="#">View options</a></div>
	                          </div>
	                        </div>
	                    </div>
<!-- ------------------------------------------------------------------------------------------------------- -->	                     
	                </div>
	            </div>
        	</section>
		</div>
		
		<!-- Pagination START -->
		<div class="col-12">
			<nav class="mt-4 d-flex justify-content-center" aria-label="navigation">
				<ul class="pagination pagination-primary-soft rounded mb-0">
					<li class="page-item mb-0"><a class="page-link" href="#" tabindex="-1"><i class="fas fa-angle-double-left"></i></a></li>
					<li class="page-item mb-0"><a class="page-link" href="#">1</a></li>
					<li class="page-item mb-0 active"><a class="page-link" href="#">2</a></li>
					<li class="page-item mb-0"><a class="page-link" href="#">..</a></li>
					<li class="page-item mb-0"><a class="page-link" href="#">6</a></li>
					<li class="page-item mb-0"><a class="page-link" href="#"><i class="fas fa-angle-double-right"></i></a></li>
				</ul>
			</nav>
		</div>
		<!-- Pagination END -->
	    </div>
	</div>
			<!-- Main content END -->

  
	<footer>
        <p>Copyright © 2022 DDworld.,Ltd. All rights reserved.</p>
    </footer>
</body>
</html>