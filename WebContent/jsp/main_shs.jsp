<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>DD world</title>
    <link rel="stylesheet" href="<%=request.getContextPath() %>/css/bootstrap.min.css">
    <link rel="stylesheet" href="<%=request.getContextPath() %>/css/style.css">
     <script src="https://cdn.jsdelivr.net/npm/jquery@3.5.1/dist/jquery.slim.min.js"></script>
     <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
     <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/js/bootstrap.bundle.min.js"></script>
    
    <script src="<%=request.getContextPath() %>/js/jquery-3.6.0.min.js"></script>
    <script src="<%=request.getContextPath() %>/js/bootstrap.min.js"></script>
    <script src="<%=request.getContextPath() %>/js/script.js"></script>


</head>
<body>
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
    <div class="row main_wrap">
        <section class="col-4 main_section main_login">
            <div class="form-group">
                <h1 class="logo">
                    <a href="" class="logo_img"><img src="<%=request.getContextPath() %>/images/logo/3.jpg" alt=""></a>
                </h1>
                <form action="<%=request.getContextPath()%>/login.do" method="post">
                    <label for="usr" hidden>ID</label><input name="id" type="text" class="form-control form-control-lg" id="usr" placeholder="아이디">
                    <label for="pwd" hidden>PW</label><input name="pass" type="password" placeholder="비밀번호" class="form-control form-control-lg" id="pwd">
                    <input type="submit" class="btn" value="로그인">
                </form>
                <div class="lost_account">
                    <a href="<%=request.getContextPath()%>/jsp/findIdAndPass.jsp">ID 찾기</a>
                    <a href="<%=request.getContextPath()%>/jsp/findIdAndPass.jsp">PW 찾기</a>
                    <a href="<%=request.getContextPath()%>/jsp/joinMember.jsp">회원가입</a>
                </div>
            </div>
        </section>
        <section class="col-8 main_section main_cont">
            <div class="card_area card_area_lg">
                <div class="card">
                    <div class="card-body">
                        <h5 class="card-title">상점</h5>
                        <h6 class="card-subtitle mb-2 text-muted">Card subtitle</h6>
                        <p class="card-text"></p>
                        <a href="<%=request.getContextPath() %>/jsp/storeMain.jsp" class="card-link">상점 가기</a>
                        
                    </div>
                </div>
            </div>
            <div class="card_area">
                <div class="card">
                    <div class="card-body">
                        <h5 class="card-title">도토리</h5>
                        <h6 class="card-subtitle mb-2 text-muted">Card subtitle</h6>
                        <p class="card-text"></p>
                        <a href="<%=request.getContextPath() %>/jsp/dotoriStore.jsp" class="card-link">도토리 가기</a>
                        <!-- <a href="#" class="card-link">Another link</a> -->
                    </div>
                </div>
            </div>
            <div class="card_area">
                <div class="card">
                    <div class="card-body">
                        <h5 class="card-title">미니홈피 가기</h5>
                        <h6 class="card-subtitle mb-2 text-muted">Card subtitle</h6>
                        <p class="card-text"></p>
                        <a href="/ddWorld/listDD.do" class="card-link">미니홈피 리스트</a>
                        <!-- <a href="#" class="card-link">Another link</a> -->
                    </div>
                </div>
            </div>
            <div class="card_area card_area_lg">
                <div class="card">
                    <div class="card-body">
                        <h5 class="card-title">고객센터</h5>
                        <h6 class="card-subtitle mb-2 text-muted">Card subtitle</h6>
                        <p class="card-text"></p>
                        <a href="<%=request.getContextPath() %>/faq.do" class="card-link">고객센터 가기</a>
                        <!-- <a href="#" class="card-link">Another link</a> -->
                    </div>
                </div>
            </div>
            <div class="card_area card_area_full">
                <div class="card">
                    <div class="card-body">
                        <h5 class="card-title">공지사항</h5>
                        <h6 class="card-subtitle mb-2 text-muted">Card subtitle</h6>
                        <p class="card-text"></p>
                        <a href="/ddWorld/notice.do" class="card-link">공지사항</a>
                        <!-- <a href="#" class="card-link">Another link</a>  -->
                    </div>
                </div>
            </div>
        </section>
    </div>
    <footer>
        <p>Copyright © 2022 DDworld.,Ltd. All rights reserved.</p>
    </footer>
</body>

</html>