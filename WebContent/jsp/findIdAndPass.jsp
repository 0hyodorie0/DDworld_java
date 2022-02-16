<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
	<title>아이디 비밀번호 찾기</title>
	<link rel="stylesheet" href="<%=request.getContextPath() %>/css/bootstrap.min.css">
    <link rel="stylesheet" href="<%=request.getContextPath() %>/css/style.css">
	<script src="<%=request.getContextPath() %>/js/jquery-3.6.0.min.js"></script>
	<script src="<%=request.getContextPath() %>/js/bootstrap.min.js"></script>
    <script src="<%=request.getContextPath() %>/js/script.js"></script>
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
	<div class="container-fluid page_header">
	   <div class="container d-flex h-100 justify-content-center align-items-center">
	     <a class="position-absolute header_logo" href="<%=request.getContextPath() %>/crossGoMain.do"><img alt="" src="<%=request.getContextPath() %>/images/logo/3.jpg"></a>
		 <h3 class="text-center page_title">아이디 비밀번호 찾기</h3>
	   </div>
    </div>
    <div class="container-fluid find_id_pw cont_background h-75">
    	<div class="container">
    		<div class="row pt-4">
		    	<div class="col p-4">
		    		<section>
			    		<h2>아이디 찾기</h2>
			    		<form action="<%=request.getContextPath() %>/findIdPass.do" method="post">
		                    <label for="name" hidden>이름</label><input name="name" type="text" class="form-control form-control-lg my-3" id="name" placeholder="이름">
		                    <label for="tel" hidden>휴대폰 번호</label><input name="tel" type="type" placeholder="휴대폰번호" class="form-control form-control-lg" id="tel">
				    		<input value="아이디 찾기" type="submit" class="btn my-3">
		                </form>
		    		</section>
		    	</div>
		    	<div class="col p-4 text-right">
		    		<section>
			    		<h2>비밀번호 찾기</h2>
			    		<form action="<%=request.getContextPath() %>/findIdPass.do" method="post">
		                    <label for="id" hidden>아이디</label><input name="id" type="text" class="form-control form-control-lg my-3" id="id" placeholder="아이디">
		                    <label for="name" hidden>이름</label><input name="name" type="type" placeholder="이름" class="form-control form-control-lg" id="name">
		                    <label for="tel" hidden>휴대폰 번호</label><input name="tel" type="type" placeholder="휴대폰번호" class="form-control form-control-lg my-3" id="tel">
				    		<input value="비밀번호 찾기" type="submit" class="btn my-3">
		                </form>
		    		</section>
		    	</div>
		    
	    	</div>		
	    	</div>
	    </div>		
</body>
</html>