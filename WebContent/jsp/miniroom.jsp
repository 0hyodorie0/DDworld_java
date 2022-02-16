<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<script src="<%=request.getContextPath()%>/js/jquery-1.12.4.js"></script>
<script src="<%=request.getContextPath()%>/js/1.12.1-jquery-ui.js"></script>
<!-- <script src="https://code.jquery.com/jquery-1.12.4.js"></script> -->
<!-- <script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script> -->
<script> 
$(function(){ 
	$(".mini img").draggable({
// 		containment: '.mini',
		opacity: 0.7
// 		cancel: '.card-body'





	}); 
	
// 	$(".mini").mouseleave(function () {
// 		var targetO = $(this);
// 		var prodnm = targetO.attr("id");
// 		alert(prodnm);
// 	});
	
    var $info = $("#info");
    $(".mini img").mouseup(function () {
        var targetO = $(this);
        var parentPos = targetO.offset();
        var pos = targetO.position();
//         var str = "지역좌표 : id=" + targetO.attr("id") + ", left=" + pos.left + ", top=" + pos.top;
//         var str2 = "<br>전역좌표 : id=" + targetO.attr("id")+", left="+ parentPos.left + ", top=" + parentPos.top;
//         $info.html(str + str2);
        
        var prodnm = targetO.attr("id");
        var minileft = pos.left;
        var minitop = pos.top;
        
//         alert(prodnm);
//         alert(minileft);
        
		
//         document.getElementById('mname').setAttribute('value',prodnm);
//         document.getElementById('mleft').setAttribute('value',minileft);
//         document.getElementById('mtop').setAttribute('value',minitop);
		$('#prodnum').attr('value', prodnm);
		$('#minileft').attr('value', minileft);
		$('#minitop').attr('value', minitop);

// 		alert($('input').val());
// 		alert($('#minileft').val());
// 		alert($('#minitop').attr('value'));
		
// 		alert($('#mleft').attr('value'));
// 		alert($('#mtop').attr('value'));
//         document.getElementById('updateroom').submit(); 
        form.submit();
    })
  

	
	
}); 
</script>
<style>
.mini{
position:relative;
width : 100%;
}
.minimi{
position:absolute;
width : 80px; 
height : 100px;
left : 271.96020793914795px;
top : 202.99715042114258px;
}
.minicon{
position:absolute;
left : 360.9942960739136px;
top : 130.98010635375977px;
}
.background{
	width:100%;
}
</style>
<body>


<div class="mini">
<!-- 	<div id="background"> -->
		<img class="background" src="<%=request.getContextPath()%>/images/miniroom/8937.gif" >
<!-- 	</div> -->
<!-- 	<div id="minicon"> -->
<!-- 	</div> -->
<!-- 	<div class="minimi"> -->
		<img class="minicon" src="<%=request.getContextPath()%>/images/miniroom/minicon_1.gif" style="left:200px; top:100px;">
		<img class="minimi" src="<%=request.getContextPath()%>/images/miniroom/minimi_f.png" style="left:100px; top:100px;">
<!-- 	</div> -->
<!-- 	<div class="minimi"> -->
<!-- 	</div> -->
</div>
<div id="info"></div>
</body>
</html>