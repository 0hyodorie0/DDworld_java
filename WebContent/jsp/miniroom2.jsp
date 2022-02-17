<%@page import="ddw.vo.MemberVO"%>
<%@page import="ddw.vo.DdVO"%>
<%@page import="java.util.Map"%>
<%@page import="ddw.vo.MiniVO"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<%
	Map<String, String> keys = (Map<String, String>)session.getAttribute("keys");
	String keyDdworld = keys.get("keyDdworld");
	
	DdVO ddvo = (DdVO)session.getAttribute(keyDdworld);
	MemberVO loginMember =  (MemberVO)session.getAttribute("loginMember");
	
%>


<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<script src="<%=request.getContextPath()%>/js/jquery-1.12.4.js"></script>
<script src="<%=request.getContextPath()%>/js/1.12.1-jquery-ui.js"></script>
<script> 
$(function(){ 
	
	<% 	   
    if(loginMember!=null && ddvo.getDd_add().equals(loginMember.getMem_id()+"dd")) {
    	
	%> 
	
	$(".mini img").draggable({
		containment: '.mini',
		opacity: 0.7
// 		cancel: '.card-body'
		
	}); 
	
	<%}%>
	
// 	  $(".mini").mouseleave(function () {
// 	  	var targetO = $(this);
// 	  	var prodnm = targetO.attr("id");
  	
// 	  	alert(prodnm);
// 	  });
  
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
    
// 		alert($('input').val());
// 		alert($('#prodnum').val());	
// 		alert($('#prodnum').attr('value'));
	
	
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
  z-index: 3; 
}
.minicon{
 position:absolute; 
 left : 360.9942960739136px; 
 top : 130.98010635375977px;
 z-index: 1; 
}
.background{
	width:100%;
}
</style>

<body>
<div class="mini">

<%
	List<MiniVO> list = (List<MiniVO>) request.getAttribute("list");
		for(int i=0; i<list.size(); i++) {
			MiniVO vo = list.get(i);
%>		

<%
			String pnum = (vo.getProd_num()).substring(0,4);

			if(pnum.equals("P601")){
%>
			<img class="background" id="<%=vo.getProd_num() %>" src="<%=request.getContextPath()%>/images/miniroom/<%=vo.getProd_nm() %>">
			<%
			}else if(pnum.equals("P501")){
			%>
<%-- 			<img class="minicon" src="<%=request.getContextPath()%>/images/minicon/<%=vo.getProd_nm() %>"> --%>
			<img class="minicon" id="<%=vo.getProd_num() %>" src="<%=request.getContextPath()%>/images/minicon/<%=vo.getProd_nm() %>" style="left:<%=vo.getMini_left()%>px; top:<%=vo.getMini_top()%>px;">
			<%
			}else{
			%>
			<img class="minimi" id="<%=vo.getProd_num() %>" src="<%=request.getContextPath()%>/images/minimi/<%=vo.getProd_nm() %>" style="left:<%=vo.getMini_left()%>px; top:<%=vo.getMini_top()%>px;">		
			<%
			}
			%>	
		
<% 
		} 
%>		
</div>
<div id="info">
<form name="form" id="updateroom" action="<%=request.getContextPath()%>/miniroomUpdate.do" method="post">
<input id="prodnum" type="hidden" name="prodnum" value="">
<input id="minileft" type="hidden" name="minileft" value="">
<input id="minitop" type="hidden" name="minitop" value="">
<input id="minicode" type="hidden" name="minicode" value="1">
</form>
</div>
</body>
</html>