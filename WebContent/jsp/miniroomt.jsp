<%@page import="java.util.Map"%>
<%@page import="ddw.vo.DdVO"%>
<%@page import="ddw.vo.MemberVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<%
// 	Map<String, String> keys = (Map<String, String>)session.getAttribute("keys");
// 	String keyDdworld = keys.get("keyDdworld");

// 	DdVO ddvo = (DdVO)session.getAttribute(keyDdworld);
// 	MemberVO loginMember =  (MemberVO)session.getAttribute("loginMember");
%>

</head>
<script src="<%=request.getContextPath()%>/js/jquery-1.12.4.js"></script>
<script src="<%=request.getContextPath()%>/js/1.12.1-jquery-ui.js"></script>
<!-- <script src="https://code.jquery.com/jquery-1.12.4.js"></script> -->
<!-- <script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script> -->

<script>
// $(document).ready(function() {  

// //function selectmini(){
	$.ajax({
		url : '/ddWorld/miniroomSelect.do',
		method : 'get',
		data : {
<%--     			"ddadd" : <%=ddvo.getDd_add()%> --%>
			"ddadd" : "test01dd"
		},
		success : function(res){
			jQuery("div.to-reload").replaceWith(reloaded);
			init_draggables_and_droppables();
			
				code ="";
				
				$.each(res, function(i,v){
					if(v.prod_num=="P601"){
 					code += '<img class="background" src="<%=request.getContextPath()%>/images/miniroom/' + v.prod_nm +'" >';
					}else if(v.prod_num=="P501"){
 					code += '<img class="minicon" src="<%=request.getContextPath()%>/images/minicon/' + v.prod_nm +'" style="left:200px; top:100px;">';
						
					}else{
 					code += '<img class="minimi" src="<%=request.getContextPath()%>/images/minimi/' + v.prod_nm +'" style="left:100px; top:100px;">';
					}
			    })
//				$tdDay.eq(j).text(daycnt);
//				val = $tdDay.eq(j).text();

			    $ ('.mini').html(code);	
				
//		        for(var i=0;i<42;i+=7){
//		            $tdDay.eq(i).css("color","red");
//		        }
//		        for(var i=6;i<42;i+=7){
//		            $tdDay.eq(i).css("color","blue");
//		        }
			     
		},
		error : function(xhr){
			alert("상태 : " + xhr.status) ;
		},
		dataType : 'json'
	})
	
// //}


// })
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
left : 10px;
top : 10px;
}
.minicon{
position:absolute;
left : 100px;
top : 10px;
}
.background{
	width:100%;
}
</style>
<body">


<div class="mini">
<!-- 	<div id="background"> -->
<%-- 		<img class="background" src="<%=request.getContextPath()%>/images/miniroom/옥상.gif" > --%>
<!-- 	</div> -->
<!-- 	<div id="minicon"> -->
<!-- 	</div> -->
<!-- 	<div class="minimi"> -->
		<img class="minicon" src="<%=request.getContextPath()%>/images/miniroom/minicon_1.gif" style="left:200px; top:100px;">
<%-- 		<img class="minimi" src="<%=request.getContextPath()%>/images/miniroom/minimi_f.png" style="left:100px; top:100px;"> --%>
<!-- 	</div> -->
<!-- 	<div class="minimi"> -->
<!-- 	</div> -->
</div>
<div id="info"></div>

<script> 
$(function(){ 
	
	
// 	$(document).on("mouseover", ".mini", function() {
// 	    $(this).draggable({ containment: '.mini'});
// 	});
	
	function init_draggables_and_droppables() {
    $(".draggable").draggable({ revert: 'invalid' });
    ...
	}

// 	jQuery(function($) {
//     init_draggables_and_droppables();
//     ...
// 	});

    
	$(".mini img").draggable({
		containment: '.mini',
		opacity: 0.7,
// 		cancel: '.card-body'
		
	}); 
	
  
    var $info = $("#info");
    $(".mini img").mouseup(function () {
        var targetO = $(this);
        var parentPos = targetO.offset();
        var pos = targetO.position();
        var str = "지역좌표 : id=" + targetO.attr("id") + ", left=" + pos.left + ", top=" + pos.top;
        var str2 = "<br>전역좌표 : id=" + targetO.attr("id")+", left="+ parentPos.left + ", top=" + parentPos.top;
        $info.html(str + str2);
    })
	
}); 
</script>
</body>
</html>