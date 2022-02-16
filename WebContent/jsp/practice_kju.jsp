<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script src="<%=request.getContextPath() %>/js/jquery-3.6.0.min.js"></script>
<title>Insert title here</title>
</head>

<script type="text/javascript">
$(function(){
	$('#one').on('change', function(){
		//선택한 option의 value값을 가져온다
		mem_id = $('option:selected', this).val();
		
		location.href = "/ddWorld/goDD.do?id="+mem_id+"";
	})
})

</script>

<body>

<div class="intro_ilchon">
	<p>일촌</p>
	<select name="ilchon_random" class="custom-select" id="one">
	  <option value="" selected disabled>★ 일촌 파도타기</option>
						
	  <option value="test03">파이리</option>
	  <option value="test04">꼬북이</option>
						                                
	</select>
</div>
</body>
</html>