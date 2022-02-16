<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">

<head>
  <meta charset="UTF-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>회원가입</title>
  
<script src="<%=request.getContextPath()%>/js/jquery-3.6.0.min.js"></script>
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css"
    integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css">


<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>

<script>
    function postCode() {
        new daum.Postcode({
            oncomplete: function(data) {

                var addr = ''; // 주소 변수
                var extraAddr = ''; // 참고항목 변수

                //사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
                if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
                    addr = data.roadAddress;
                } else { // 사용자가 지번 주소를 선택했을 경우(J)
                    addr = data.jibunAddress;
                }

//                 // 사용자가 선택한 주소가 도로명 타입일때 참고항목을 조합한다.
//                 if(data.userSelectedType === 'R'){
//                     // 법정동명이 있을 경우 추가한다. (법정리는 제외)
//                     // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
//                     if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
//                         extraAddr += data.bname;
//                     }
//                     // 건물명이 있고, 공동주택일 경우 추가한다.
//                     if(data.buildingName !== '' && data.apartment === 'Y'){
//                         extraAddr += (extraAddr !== '' ? ', ' + data.buildingName : data.buildingName);
//                     }
//                     // 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
//                     if(extraAddr !== ''){
//                         extraAddr = ' (' + extraAddr + ')';
//                     }
//                     // 조합된 참고항목을 해당 필드에 넣는다.
//                     document.getElementById("sample6_extraAddress").value = extraAddr;
                
//                 } else {
//                     document.getElementById("sample6_extraAddress").value = '';
//                 }


                document.getElementById('zip').value = data.zonecode;
                document.getElementById("add1").value = addr;
//                 document.getElementById("add2").focus();
            }
        }).open();
    }
$(function(){ 
	//정규식체크 --------------------------------------
	$('#memid').on('keyup', function(){
		idvalue = $(this).val();
		
		idreg = /^[a-zA-Z][a-zA-Z0-9]{3,11}$/;
		chkMi = false;
		if(idreg.test(idvalue)){
			//일치
			$(this).css('border', '2px solid green');
			$('#checkId').prop('disabled', false);
			chkMi = true;
		}else{
			//틀린경우s
			$(this).css('border', '2px solid red');
			$('#checkId').prop('disabled', true);
			chkMi = false;
		}
	})
	
	$('#password').on('keyup',function(){
		passvalue = $(this).val();
		passreg = /^(?=.*[a-z])(?=.*[0-9]).{7,15}$/;
// 		passreg = /^(?=.*[a-z])(?=.*[0-9])(?=.*[~!@#$%^&*+_=]).{8,15}$/;
		chkPw = false;
		if(passreg.test(passvalue)){
			$(this).css('border', '2px solid green');
			chkPw = true;
		}else{
			$(this).css('border', '2px solid red');
			chkPw = false;
			
		}
	})
	
	$('#name').on('keyup', function(){
		namevalue = $(this).val();
		namereg = /^[가-힣]{2,10}$/
			chkName = false;
		if(namereg.test(namevalue)){
			$(this).css('border', '2px solid green');
			chkName = true;
		}else{
			$(this).css('border', '2px solid red');
			chkName = false;
		}
	})
	
	//이메일
	$('#mail').on('keyup', function(){
		mailvalue = $(this).val();
		mailreg = /^([a-zA-z0-9]+)@([a-zA-z0-9]+)(\.[a-zA-Z]+){1,2}$/;
		chkMail = false;
		if(mailreg.test(mailvalue)){
			$(this).css('border', '2px solid green');
			chkMail = true;
		}else{
			$(this).css('border', '2px solid red');
			chkMail = false;
		}
	})
	
	//전화번호
	$('#tel').on('keyup', function(){
		hpvalue = $(this).val();
		hpreg = /^\d{3}\d{4}\d{4}$/;
		chkTel = false;
		if(hpreg.test(hpvalue)){
			$(this).css('border', '2px solid green');
			chkTel = true;
		}else{
			$(this).css('border', '2px solid red');
			chkTel = false;
		}
	})
	/////////////////////////////////////////////////////////////
	
	chkId = false;
	/* id 중복체크 이벤트 */
	$('#checkId').on('click',function(){
		//입력한 id값
		idvalue = $('#memid').val().trim();
		
		//공백검사
		if(idvalue.length < 1){
			alert("아이디 입력하세요");
			return false;
		}
		
		//서버로 전송
		$.ajax({
// 			url	:'http://localhost/jqpro/IDCheck',
			url	:'/ddWorld/checkId.do',
			type: 'post',
			data: {"id" : idvalue},
			success : function(res){
// 				alert(res.sw)
				
				if(res.sw == "사용가능"){
					chkId = true;
					$('#idres').html(res.sw).css('color', 'green');
					$('#idres').show();
				}else{
					$('#idres').html("이미 사용중인 아이디입니다").css('color', 'red');
					$('#idres').show();
					chkId = false;
				}

			},
			error : function(xhr){
				alert("상태 : " + xhr.status);
			},
			dataType : 'json'
		})
	})	// idcheck
	
	$('.pass').keyup(function(){
		pass1 =$('#password').val();
		pass2 =$('#password2').val();
		chkPass = false;
		if(pass1 !="" && pass2 !=""){
			if(pass1 == pass2){
				$('#passchk').html('일치').css('color','green');
				chkPass = true;
			}else if(pass1 != pass2){
				$('#passchk').html('불일치').css('color','red');
			}
		}
	})
    	
    //회원가입 저장
	$("#insertForm").on("submit", function(){
	  if(chkId == false ||
	 	 chkPass == false ||
	 	 chkTel == false ||
	 	 chkMail == false ||
	 	 chkName == false ||
	 	 chkPw == false ||
	 	 chkMi == false
	  ) {
	   	 return false;
	  }
// 	  alert("가입성공")
	  return true;
	});

})

// function submitCheck() {
//   if(chkId == false ||
// 	 chkPass == false ||
// 	 chkTel == false ||
// 	 chkMail == false ||
// 	 chkName == false ||
// 	 chkPw == false ||
// 	 chkMi == false
//   ) {
//   	 alert("불가")
//   	 return false;
//   }
// 	s2 = $('form').serializeArray();
// 	console.log(s2);
	
// 	// 서버로 보내기
// 	$.ajax({
// 		url  : '/ddWorld/joinMember.do',
// 		type : 'post',
// 		data : s2,
// 		success : function(res){
// 			alert(res.sw);
<%-- 			location.href="<%=request.getContextPath()%>/jsp/main_shs.jsp"; --%>
// 		},
// 		error : function(xhr){
// 			alert("상태 : " + xhr.status);
// 		},
// 		dataType : 'json'
// 	})
// 	alert("가능")
// 	return true;
// }


</script>

  <style>
    body {
      min-height: 100vh;

      background: -webkit-gradient(linear, left bottom, right top, from(#92b5db), to(#1d466c));
      background: -webkit-linear-gradient(bottom left, #92b5db 0%, #1d466c 100%);
      background: -moz-linear-gradient(bottom left, #92b5db 0%, #1d466c 100%);
      background: -o-linear-gradient(bottom left, #92b5db 0%, #1d466c 100%);
      background: linear-gradient(to top right, #92b5db 0%, #FF8C00 100%);  
/*        background: linear-gradient(to top right, #92b5db 0%, rgb(255, 125, 65) 100%); */
    }

    .input-form {
      max-width: 680px;

      margin-top: 80px;
      padding: 32px;

      background: #fff;
      -webkit-border-radius: 10px;
      -moz-border-radius: 10px;
      border-radius: 10px;
      -webkit-box-shadow: 0 8px 20px 0 rgba(0, 0, 0, 0.15);
      -moz-box-shadow: 0 8px 20px 0 rgba(0, 0, 0, 0.15);
      box-shadow: 0 8px 20px 0 rgba(0, 0, 0, 0.15)
    }
.inlinebutton{
    display : inline-block;
    vertical-align: bottom;
}
.btn-primary:hover {
    color: #fff;
    background-color: #D2691E;
    border-color: #0062cc;
}

.btn-primary {
    color: #fff;
    background-color: #f29019;
    border-color: #007bff;
}
/* #checkId{ */
/* 	width: 100px; */
/* } */
  </style>
</head>

<body>
  <div class="container">
  
    <div class="input-form-backgroud row">
      <div class="input-form col-md-12 mx-auto">
        <h4 class="mb-3">회원가입</h4>
        <form id="insertForm" action="<%=request.getContextPath()%>/joinMember.do" class="validation-form"  novalidate method="post">
<%--         <form id="insertForm" action="<%=request.getContextPath()%>/joinMember.do" class="validation-form" onsubmit="return submitCheck();" novalidate > --%>

          <div class="mb-3">
            <label for="memid" style="display: block">아이디</label>
            <input type="memid" class="form-control inlinebutton" id="memid" name="mem_id" placeholder="아이디를 입력해주세요." required style="width:520px;">
            <input type="button" id="checkId" class="btn btn-warning checkId" value="중복검사" required>
            <div id="idres"></div>
            <div class="invalid-feedback">
              아이디를 입력해주세요.
            </div>
          </div>
          
          <div class="mb-3">
            <label for="password">비밀번호</label>
            <input type="password" class="form-control pass" id="password" name="mem_pass" placeholder="" required>
            <div class="invalid-feedback"> 
              비밀번호를 입력해주세요.
            </div>
          </div> 
          
       <div class="mb-3">
            <label for="password2">비밀번호 재입력</label>
            <input type="password" class="form-control pass" id="password2" name="password2" placeholder="" required>
            <span id ="passchk" size="2"></span>
            <div class="invalid-feedback">
              비밀번호를 입력해주세요.
            </div>
          </div> 
          
        <div class="row">
            <div class="col-md-6 mb-3">
              <label for="name">이름</label>
              <input type="text" class="form-control" id="name" name="mem_name" placeholder="이름을 입력해주세요." value="" required>
              <div class="invalid-feedback">
                이름을 입력해주세요.
              </div>
            </div>
            
         <div class="col-md-6 mb-3 gender" >
            <label for="gender"> 성별</label><br>
            <input type="radio"   name="mem_gender" value="남" checked> 남 
            <input type="radio"   name="mem_gender" value="여" required> 여
            <div class="invalid-feedback">
               성별을 선택해주세요.
            </div>
          </div>
          </div>
          
          <div class="mb-3">
            <label for="tel">전화번호</label>
            <input type="tel" class="form-control" id="tel" name="mem_tel" placeholder="전화번호를 입력해주세요." required>
            <div class="invalid-feedback">
              전화번호를 입력해주세요.
            </div>
          </div>

	     <div class="mb-3">
	            <label for="mail">이메일</label>
	            <input type="tel" class="form-control" id="mail" name="mem_mail" placeholder="you@example.com" required>
	            <div class="invalid-feedback">
	              이메일을 입력해주세요.
	            </div>
	     </div>
     
		  <div class="mb-3">
            <label for="address" style="display: block">우편번호</label>
            <input type="text" class="form-control  inlinebutton" id="zip" name="mem_zip" placeholder=" 우편번호" required  style="width:150px;">
<!--             <button type="button" class="btn btn-outline-warning">Warning</button> -->
            <input type="button" class="btn btn-warning" onclick="postCode()" value="우편번호 찾기"><br>
            <div class="invalid-feedback">
              우편번호를 입력해주세요.
            </div>
          </div>
 
          <div class="mb-3">
            <label for="add1">주소</label>
            <input type="text" class="form-control" id="add1" name="mem_add1" placeholder="서울특별시 강남구" required>
            <div class="invalid-feedback">
              주소를 입력해주세요.
            </div>
          </div>

<!--           <div class="mb-3"> -->
<!--             <label for="add2">상세주소<span class="text-muted">&nbsp;</span></label> -->
<!--             <input type="text" class="form-control" id="add2" name="add2" placeholder="상세주소를 입력해주세요."> -->
<!--           </div> -->
          
          <hr class="mb-4">
          <div class="custom-control custom-checkbox">
            <input type="checkbox" class="custom-control-input form-control" id="aggrement" required>
            <label class="custom-control-label" for="aggrement">개인정보 수집 및 이용에 동의합니다.</label>
          </div>
          <div class="mb-4"></div>
          <input type="submit" class="btn btn-primary btn-lg btn-block" value="가입하기">
        </form>
      </div>
    </div>
    <footer class="my-3 text-center text-small">
      <p class="mb-1">&copy; DDWorld</p>
    </footer>
  </div>
  <script>
    window.addEventListener('load', () => { 
       const forms = document.getElementsByClassName('validation-form'); 

       Array.prototype.filter.call(forms, (form) => {
         form.addEventListener('submit', function (event) {
          if (form.checkValidity() === false) { 
             event.preventDefault(); 
            event.stopPropagation(); 
          } 

           form.classList.add('was-validated'); 
         }, false); 
      });
    }, false); 
  </script>  
</body>

</html>