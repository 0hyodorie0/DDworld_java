<%@page import="ddw.vo.MemberVO"%>
<%@page import="java.util.Map"%>
<%@page import="ddw.vo.VisitVO"%>
<%@page import="ddw.vo.OneVO"%>
<%@page import="java.util.List"%>
<%@page import="ddw.vo.DdVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

<%
	Map<String, String> keys = (Map<String, String>)session.getAttribute("keys");
	String keyDdworld = keys.get("keyDdworld");
	String keyOnelist = keys.get("keyOnelist");
	String keyVisit = keys.get("keyVisit");

	MemberVO memvo = (MemberVO)session.getAttribute("loginMember");
	DdVO ddvo = (DdVO)session.getAttribute(keyDdworld);
	List<OneVO> onelist = (List<OneVO>)session.getAttribute(keyOnelist);
	VisitVO visitvo = (VisitVO)session.getAttribute(keyVisit);
	int oneChk = (int)session.getAttribute("oneChk");
	/*List<OneVO> onelist = (List<OneVO>)request.getAttribute("onelist");*/
%>



<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>User's Minihome</title>

    <script src="<%=request.getContextPath() %>/js/jquery-3.6.0.min.js"></script>
    <script src="../js/jquery.minicolors.min.js"></script>
    <link rel="stylesheet" href="../css/jquery.minicolors.css">
	<link rel="stylesheet" href="../css/jquery.minicolors.png">
	
	<script src="<%=request.getContextPath() %>/js/bootstrap.min.js"></script>
    <script src="<%=request.getContextPath() %>/js/script.js"></script>
    <link rel="stylesheet" href="<%=request.getContextPath() %>/css/bootstrap.min.css">
    <link rel="stylesheet" href="<%=request.getContextPath() %>/css/style.css">

<style>
	.skinpreview {
		width: 80px;
		height: 45px;
	}
	.minihome {
   	 	height: 100vh;
    	/*background: url(../images/skin_default.png)*/	/*원본*/
    	background: url(../images/skin/<%=ddvo.getDd_skin()%>);
    	background-size:cover;
    	background-repeat:no-repeat;
	}
	.minihome_edge {
   		position: relative;
    	/*background-color: #4FB4D8;*/	/*원본*/
    	background-color: #<%=ddvo.getDd_edge() %>;
	}
	
	.minihome_menu a {
	    display: block;
	    padding: 0.8em;
	    background: #<%=ddvo.getDd_menu() %>;
	    color: #fff;
	    border-top-right-radius: 10px;
	    border-bottom-right-radius: 10px;
	    border: 1px solid #000;
	    border-left: none;
	}	

	.minihome_menu a:hover,
	.minihome_menu a.active {
	    text-decoration: none;
	    background: #fff;
	    color: #000;
	}

</style>
</head>

<script type="text/javascript">
$(document).ready(function() {
	 
	$('.demo').each( function() {
		$(this).minicolors({
			control: $(this).attr('data-control') || 'hue',
			defaultValue: $(this).attr('data-defaultValue') || '',
			format: $(this).attr('data-format') || 'hex',
			keywords: $(this).attr('data-keywords') || '',
			inline: $(this).attr('data-inline') === 'true',
			letterCase: $(this).attr('data-letterCase') || 'lowercase',
			opacity: $(this).attr('data-opacity'),
			position: $(this).attr('data-position') || 'bottom',
			swatches: $(this).attr('data-swatches') ? $(this).attr('data-swatches').split('|') : [],
			change: function(hex, opacity) {
			  		var log;
			  		try {
			    		log = hex ? hex : 'transparent';
			    		if( opacity ) log += ', ' + opacity;
			    		console.log(log);
			  		} catch(e) {}
			},
			theme: 'default'
			// theme: 'bootstrap'
		});
	});
});

$(function(){
	$('.modal').hide();
	$('#ok').hide();
	$('#yes, #no').show();
	
	/* 대문 설정 변경--------------------------------------- */
	$('#profileset').on('click', function(){
		$('#profileSetModal').show();
	})
	
	$('#pno').on('click', function(){
		$('#profileSetModal').hide();
	})
	
	$('#my1').on('click', function(){
		alert("제목변경 취소");
	})
	$('#my2').on('click', function(){
		alert("내용변경 취소");
	})
	$('#my3').on('click', function(){
		alert("사진변경 취소");
	})
	
	$('#pset').on('click', function(){
		newtitle = $('#mytitle').val().trim();
		
		newcon = $('#myintro').val().trim();
		
		fileValue = $("#myphotoBe").val().split("\\");
		newphoto = fileValue[fileValue.length-1];
		
		code = '<img src="../images/ddmainphoto/';
		code += newphoto;
		code += '" alt="대문사진">';
		
		$.ajax({
	  		url			:'/ddWorld/setDDMain.do',
	  		data	    : {"ddtitle" : newtitle,
	  					   "ddcon"   : newcon,
	  					   "ddphoto" : newphoto},
	  		method	    :'post',
	  		success	    :function(res){
	  			alert("변경성공");
	  			$('#mainphotoHere').html(code);
	  			$('#mainconHere').text(newcon);
	  			$('#titleHere').text(newtitle);
		    }, 
		    error:function(xhr){
		    	alert("실패" + xhr);
			}
		});//end ajax
		
		$('#profileSetModal').hide();
	})
	/*------------------------------------------------*/
	
	$('#ok, #no').on('click', function(){
		$('.modal').hide();
	})
	
	
	name = "";
	$('#master').on('click', function(){
		
		if(<%=oneChk %> == 0){
			alert('로그인 후 이용해주세요.');
		}else if(<%=oneChk %> == 1){
			alert('일촌입니다!');
		}else if(<%=oneChk %> == 2){
			alert('일촌신청 받으셨습니다. 수락해주세요!');
		}else if(<%=oneChk %> == 3){
			alert('이미 일촌신청 하셨습니다. 기다려주세요!');
		}else if(<%=oneChk %> == 4){
			<%if(memvo != null){%>
			var requestId = "<%=memvo.getMem_id() %>";
			<%}%>
			var responseId = "<%=ddvo.getMem_id() %>";
			console.log(requestId + " / " + responseId);
			
			name = "<%=ddvo.getMem_name() %>";
			
			code ="";
			code += "<span style='color:blue; font-size:1.5em; font-weight:bold;'>'";
			code += name;
			code += "'</span> 님께<br><hr><br>";
			code += "신청하실 일촌명을 입력 해주세요!<br><br>";
			code += "일촌명 <input id='onenameAthome' type='text'>";
			
			$('#oneModalDetail').html(code);
			
			$("#oneModal").show();
			$('#yes, #no').show();
			$('#ok').hide();
		}
		else{
			alert('본인입니다!');
		};
	})
	
	$('#yes').on('click', function(){
		onename = $('#onenameAthome').val();
		<%if(memvo != null){%>
		requestId2 = "<%=memvo.getMem_id() %>";
		<%}%>
		responseId2 = "<%=ddvo.getMem_id() %>";
		
		alert("방문자 : " + requestId2 + " / 홈피주인 : " + responseId2 + " / " + onename);
		
		newcode = "";
		$.ajax({
			url		  : '/ddWorld/requestOne.do',
			data	  : {"requestId"  : requestId2,
						 "responseId" : responseId2,
						 "onename" 	  : onename},
			type	  : 'get',
			success   : function(res){
				if(res.sw == "성공"){
					newcode += "<span style='color:blue; font-size:1.5em; font-weight:bold;'>'";
					newcode += name;
					newcode += "'</span> 님께<br>";
					newcode += "일촌 신청했습니다!";
				}else{
					newcode += "실패했습니다!";
				}
				$('#oneModalDetail').empty();
				$('#oneModalDetail').html(newcode);
				$('#yes, #no').hide();
				$('#ok').show();
			},
			error	  : function(xhr){
			},
			dataType  : 'json'
		})
	})
	
})


$(function(){
	$('.modal').hide();
	
	$('#ilchon_random').on('change', function(){
		//선택한 option의 value값을 가져온다
		mem_id = $('option:selected', this).val();
		
		location.href = "/ddWorld/goDD.do?id="+mem_id+"";
	})
	
	$('#pick1').on('click', function(){
		$("#setModal").hide();
		$("#detailModal").show();
		masterid = '<%=ddvo.getMem_id() %>';
		$.ajax({
			url		  : '/ddWorld/skinList.do',
			data	  : {'id' : masterid},
			method	  : 'get',
			success   : function(res){
				

				code = "";
				
				
				if(res.sw == 'no'){
					code += '<p>적용 가능한 스킨이 없습니다.</p>';
					code += '<p>상점에서 구매해주세요!</p>';
					$('#ok1').prop('value', '뒤로');
				}else{
					code += '<table class="skins">';
					code += '<tr><td></td><td>미리보기</td><td>스킨설명</td></tr>';
				$.each(res.datas, function(i, v){
					code += '<tr><td><input value="';
					code += v.prod_nm;
					code += '" name="pickskin" type="radio"></td><td>';
					code += '<img class="skinpreview" src="../images/skin/';
					code += v.prod_nm;
					code += '">';
					code += '</td><td>';
					code += v.prod_con;
					code += '</td></tr>';
					
				})
				code += '</table>';
				}
				
				$('#detailModalBody').html(code);
			},
			error	  : function(xhr){
			},
			dataType  : 'json'
		})
	})
	
	$('#pick2').on('click', function(){
		colorpick = $('#hue-demo').val()
		$('#edgeid').attr('value',colorpick);
		/*$("#setModal").hide();
		$("#detailModal2").show();*/
	})
	
	$('#pick3').on('click', function(){
		colorpick = $('#hue-demo').val()
		$('#menuid').attr('value',colorpick);
	})
	
	$('#ok1').on('click', function(){
		
		pickskin = $("input:radio[name='pickskin']:checked").val();
		$('#skinid').attr('value',pickskin);
		$("#detailModal").hide();
		
		/*$('#skinid').attr('value','기본스킨');
		
		$("#detailModal").hide();*/
		$("#setModal").show();
	})
	
	$('#enroll').on('click', function(){
		temp1 = $('#skinid').val().trim();
		
		
		temp2 = $('#edgeid').val().trim();
		temp3 = $('#menuid').val().trim();
		
		console.log(temp1,temp2,temp3);
		
		dd_add = '<%=ddvo.getDd_add() %>';
		
		$.ajax({
			url		  : '/ddWorld/setDD.do',
			data	  : {"dd_skin"  : temp1,
						 "dd_edge"  : temp2,
						 "dd_menu"  : temp3,
						 "dd_add"   : dd_add},
			type	  : 'get',
			success   : function(res){
				$('.minihome').css('background', 'url(../images/skin/'+temp1+')');
				$('.minihome_edge').css('background', temp2);
				$('.minihome_menu a').css('background', temp3);
			},
			error	  : function(xhr){
			}
		})
		$("#setModal").modal('hide');
		//	$("#setModal").hide();	//이건안됨
	})
})
</script>
<style>
.skins td{padding:5px;}
</style>


<body class="d-flex justify-content-center align-items-center minihome">
    <div class="container minihome_edge">
        <div class="row minihome_cont">
            <div class="col-4 minihome_in minihome_in_l">
                <div class="d-flex justify-content-around pb-2">
                    <div><span>TODAY</span> <span class="orange"><%=visitvo.getToday() %></span></div>
                    <div><span>TOTAL</span> <span><%=visitvo.getTotal() %></span></div>
                </div>
                <div class="intro">
                    <!-- 왼쪽 -->
                    <div class="intro_section">
                        <div id="mainphotoHere" class="intro_pic">
                            <img src="../images/ddmainphoto/<%=ddvo.getDd_photo() %>" alt="대문사진">
                        </div>
                        <div class="intro_quote">
                            <span id="mainconHere">
                                <%=ddvo.getDd_con() %>
                            </span>
                    
                        </div>
                    <!-- 버튼추가!! -->       
                    <%
                    	if(memvo!=null && memvo.getMem_id().equals(ddvo.getMem_id())){
                    %>
                    <input id="profileset" type="button" value="변경"><br>
                    <%	}else{ } %>
                     <!-- 버튼추가종료!! --> 
                        <a href="" class="quote_history">history</a>
                        <div class="intro_email">
                            <a id="master" href="#" title="메일주소"><span><%=ddvo.getMem_name() %></span></a>
                        </div>
                        <div class="intro_ilchon">
                            <p>일촌</p>
                            <select name="ilchon_random" class="custom-select" id="ilchon_random">
                                <option value="" selected disabled>★ 일촌 파도타기</option>
						<%
						
							for(int i = 0; i < onelist.size(); i++){
								OneVO vo = onelist.get(i);
						%>	
							<option value="<%=vo.getMem_id2() %>"><%=vo.getMem_name() %></option>
						<%		
							}
						%>                                
                            </select>
                        </div>
                    </div>
                </div>
            </div>
            <div class="col-8 minihome_in minihome_in_r">
                <div class="d-flex justify-content-between align-items-end minihome_title">
                    <span id="titleHere"><%=ddvo.getDd_title() %></span>
                    <a href="">www.ddworld.com/<%=ddvo.getDd_add() %></a>
                    <%
                    	if(memvo!=null && memvo.getMem_id().equals(ddvo.getMem_id())){
                    %>
                    <input id="setting" type="button" value="설정" data-toggle="modal" data-target="#setModal">
                    <%	}else{ } %>
                    
                </div>
                <div class="minihome_right">
	                <iframe id="minihomem" src="./mini_home.jsp" name="ifr" scrolling = "yes" class="">
	                    <!-- 미니홈피 홈화면 iframe 공간 -->
	                </iframe>
                </div>
            </div>
        </div>
        <ul class="minihome_menu">
            <li><a href="./mini_home.jsp" target="ifr" class="">홈</a></li>            
            <li><a href="<%=request.getContextPath()%>/profileselect.do" target="ifr">프로필</a></li>
            <li><a href="./mini_diary.jsp" target="ifr">다이어리</a></li>
            <li><a href="<%=request.getContextPath()%>/photoList.do" target="ifr">사진첩</a></li>
            <li><a href="<%=request.getContextPath()%>/gbook.do" target="ifr">방명록</a></li>
        </ul>
    </div>

      <div class="card bgm">
        <audio autoplay controls loop="loop"> 
        <!-- <source src="../audio/수취인불명-프리스타일.mp3" type="audio/mp3"> -->
        <source src="../audio/Y-프리스타일.mp3" type="audio/mp3">
        </audio>
       <marquee scrollamount=8>Y-프리스타일.mp3</marquee>
      </div>


<!-- 색상선택 모달------------------------------------------------------------- -->
<div class="modal" id="setModal">
	    <div class="modal-dialog">
	      <div class="modal-content">
	      
	        <!-- Modal Header -->
	        <div class="modal-header">
	          <h4 class="modal-title">내 미니홈피 설정</h4>
	          <button type="button" class="close" data-dismiss="modal">&times;</button>
	        </div>
	        
	        <!---------form & Modal body------------->
	       	<form  id="ff" method="post" action="#">
		        <div class="modal-body">
		        	<p>스킨선택</p> 
		        	<input id="skinid" type="text" name="skin" style="width:400px;" value="<%=ddvo.getDd_skin() %>" disabled="disabled">
		        	<input id="pick1" type="button" value="보기"><br><br>
		        	
		        	<p>테두리 색상 선택</p> 
		        	<input id="edgeid" type="text" name="edge" style="width:400px;" value="\#<%=ddvo.getDd_edge() %>" disabled="disabled">
		        	<input id="pick2" type="button" value="적용"><br><br>
		        	
		        	<br>
		        	<input id="hue-demo" type="text" class="demo" data-control="hue" value="#499999" style="width:200px;">
		        	<br><br>
		        	
		        	<p>메뉴 색상 선택</p> 
		        	<input id="menuid" type="text" name="menu" style="width:400px;" value="\#<%=ddvo.getDd_menu() %>" disabled="disabled">
		        	<input id="pick3" type="button" value="적용"><br><br>
		        </div>
		        
		        
		        <!-- Modal footer -->
		        <div class="modal-footer">
		          <button id="enroll" type="button" class="btn btn-danger">등록</button>
		        </div>
	        </form>
	        <!----------form & Modal body--------->
	      </div>
	    </div>
	  </div>


	<div class="modal" id="detailModal">
	    <div class="modal-dialog">
	      <div class="modal-content">
	      
	        <!-- Modal Header -->
	        <div class="modal-header">
	          <h4 class="modal-title">스킨설정</h4>
	          <button type="button" class="close" data-dismiss="modal">&times;</button>
	        </div>
	        <!--------form & Modal body----------------->
		        <div id="detailModalBody" class="modal-body">
		        	<!-- ajax가 뿌려주는곳 -->
		        </div>
		        
		        <!-- Modal footer -->
		        <div class="modal-footer">
					<input id="ok1" type="button" value="적용">
		        </div>
	        <!----------form & Modal body------------->
	      </div>
	    </div>
	  </div>
<!-- 색상선택 모달  끝------------------------------------------------------------ -->

<!-- The Modal -->
  <div class="modal" id="oneModal">
    <div class="modal-dialog">
      <div class="modal-content">
      
        <!-- Modal Header -->
        <div class="modal-header" style="text-align: center;">
          <h4 class="modal-title">일촌신청</h4>
          <!-- <button type="button" class="close" data-dismiss="modal">&times;</button> -->
        </div>
        
        <!-- Modal body -->
       	<form  id="ff" method="post" enctype="multipart/form-data" action="#">
	        <div id="oneModalDetail" class="modal-body">
	        	
	        </div>
	        
	        <!-- Modal footer -->
	        <div class="modal-footer requestbtn">
	          <button id="yes" type="button" class="btn btn-danger">신청</button>
	          <button id="no" type="button" class="btn btn-danger" data-dismiss="modal">취소</button>
	          
	          <button id="ok" type="button" class="btn btn-danger">확인</button>
	        </div>
        </form>
      </div>
    </div>
  </div>
<!-- The Modal END -->

<div class="modal" id="profileSetModal">
    <div class="modal-dialog">
      <div class="modal-content">
      
        <!-- Modal Header -->
        <div class="modal-header" style="text-align: center;">
          <h4 class="modal-title">대문설정 변경</h4>
          <!-- <button type="button" class="close" data-dismiss="modal">&times;</button> -->
        </div>
        
        <!-- Modal body -->
       	<form  id="gg" method="post" enctype="multipart/form-data" action="#">
	        <div id="profileSetDetail" class="modal-body">
	          <p>미니홈피 제목 변경</p> 
		      <input id="mytitle" type="text" name="mytitle" style="width:400px;" value="<%=ddvo.getDd_title() %>">
		      <input id="my1" type="button" value="취소"><br><br>
		        	
		      <p>대문 내용 변경</p> 
		      <input id="myintro" type="text" name="myintro" style="width:400px;" value="<%=ddvo.getDd_con() %>">
		      <input id="my2" type="button" value="취소"><br><br>
	          
	          <p>대문 사진 변경</p>
	          <input id="myphotoTo" type="text" name="myintro" style="width:400px;" value="<%=ddvo.getDd_photo() %>" disabled="disabled"> 
		      <input id="my3" type="button" value="취소"><br><br>
		      <input id="myphotoBe" onchange="changeValue(this)" type="file" name="myphoto" style="width:400px;" accept="image/*" value="">
	        </div>
	        
	        <!-- Modal footer -->
	        <div class="modal-footer">
	          <button id="pset" type="button" class="btn btn-danger">변경</button>
	          <button id="pno" type="button" class="btn btn-danger" data-dismiss="modal">취소</button>
	        </div>
        </form>
      </div>
    </div>
  </div>
</body>

</html>