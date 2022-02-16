<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>미니홈피 연습화면입니다.</title>


	<script src="<%=request.getContextPath() %>/js/jquery-3.6.0.min.js"></script>
    <script src="../js/jquery.minicolors.min.js"></script>
    <link rel="stylesheet" href="../css/jquery.minicolors.css">
	<link rel="stylesheet" href="../css/jquery.minicolors.png">
	
	<script src="<%=request.getContextPath() %>/js/bootstrap.min.js"></script>
    <script src="<%=request.getContextPath() %>/js/script.js"></script>
    <link rel="stylesheet" href="<%=request.getContextPath() %>/css/bootstrap.min.css">
    <link rel="stylesheet" href="<%=request.getContextPath() %>/css/style.css">
	
 

</head>
<style>

</style>



<script>

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
	$('#pick1').on('click', function(){
		$("#setModal").hide();
		$("#detailModal").show();
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
		
		$('#skinid').attr('value','스킨');
		
		$("#detailModal").hide();
		$("#setModal").show();
	})
	
	$('#enroll').on('click', function(){
		temp1 = $('#skinid').val();
		temp2 = $('#edgeid').val();
		temp3 = $('#menuid').val();
	})
})

</script>

<body>
	<h2>미니홈피 세팅 개발 화면 </h2>
	
	<h3 id="resulthere"></h3>
	
	<br><hr><br>
	<input id="setting" type="button" value="설정" data-toggle="modal" data-target="#setModal">

	<div class="modal" id="setModal">
	    <div class="modal-dialog">
	      <div class="modal-content">
	      
	        <!-- Modal Header -->
	        <div class="modal-header">
	          <h4 class="modal-title">내 미니홈피 설정</h4>
	          <button type="button" class="close" data-dismiss="modal">&times;</button>
	        </div>
	        
	        <!----------------------------form & Modal body--------------------------------->
	       	<form  id="ff" method="post" action="#">
		        <div class="modal-body">
		        	<p>스킨선택</p> 
		        	<input id="skinid" type="text" name="skin" style="width:400px;" disabled="disabled">
		        	<input id="pick1" type="button" value="보기"><br><br>
		        	
		        	<p>테두리 색상 선택</p> 
		        	<input id="edgeid" type="text" name="edge" style="width:400px;" disabled="disabled">
		        	<input id="pick2" type="button" value="적용"><br><br>
		        	
		        	<br>
		        	<input id="hue-demo" type="text" class="demo" data-control="hue" value="#499999" style="width:200px;">
		        	<br><br>
		        	
		        	<p>메뉴 색상 선택</p> 
		        	<input id="menuid" type="text" name="menu" style="width:400px;" disabled="disabled">
		        	<input id="pick3" type="button" value="적용"><br><br>
		        </div>
		        
		        
		        <!-- Modal footer -->
		        <div class="modal-footer">
		          <button id="enroll" type="button" class="btn btn-danger">등록</button>
		        </div>
	        </form>
	        <!----------------------------form & Modal body--------------------------------->
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
	        
	        <!----------------------------form & Modal body--------------------------------->
		        <div class="modal-body">
		        	상세조회화면입니다
		        </div>
		        
		        
		        <!-- Modal footer -->
		        <div class="modal-footer">
					<input id="ok1" type="button" value="적용">
		        </div>
	        <!----------------------------form & Modal body--------------------------------->
	      </div>
	    </div>
	  </div>

</body>
</html>














