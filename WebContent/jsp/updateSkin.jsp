<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">

<title>업데이트 스킨 연습화면</title>

    <link rel="stylesheet" href="<%=request.getContextPath() %>/css/bootstrap.min.css">
    <link rel="stylesheet" href="<%=request.getContextPath() %>/css/style.css">

    <script src="<%=request.getContextPath() %>/js/jquery-3.6.0.min.js"></script>
    <script src="<%=request.getContextPath() %>/js/bootstrap.min.js"></script>
    <script src="<%=request.getContextPath() %>/js/script.js"></script>
</head>
<style>
	.skinpreview{
		width: 80px;
		height: 45px;
	}
</style>
<script type="text/javascript">
$(function(){
	$('#changeskin').on('click', function(){
		$('#detailModal').show();
		
		$.ajax({
			url		  : '/ddWorld/skinList.do',
			data	  : {'id' : 'test01'},
			method	  : 'get',
			success   : function(res){
				code = '<table>';
				code += '<tr><td></td><td>스킨 미리보기</td><td>스킨설명</td></tr>';
				
				$.each(res, function(i, v){
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
				
				$('#detailModalBody').html(code);
			},
			error	  : function(xhr){
			},
			dataType  : 'json'
		})
		
		
	})
	
	
	$('#ok1').on('click', function(){
		
		
		
		pickskin = $("input:radio[name='pickskin']:checked").val();
		$('#skinid').attr('value',pickskin);
		$("#detailModal").hide();
	})
})
</script>

<body>
	<input id="changeskin" type="button" value="스킨변경">
	<br><hr><br>
	<input id="skinid" type="text" name="skin" style="width:400px;" disabled="disabled">
	
	
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
		        	상세조회화면입니다
		        </div>
		        
		        
		        <!-- Modal footer -->
		        <div class="modal-footer">
					<input id="ok1" type="button" value="적용">
		        </div>
	        <!----------form & Modal body------------->
	      </div>
	    </div>
	  </div>
</body>
</html>