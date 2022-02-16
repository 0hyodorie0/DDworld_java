<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@page import="java.util.List"%>
<%@page import="ddw.vo.MiniVO"%>
<html lang="en" >
<head>
  <meta charset="UTF-8">
  <title>CodePen - GreenSock Slider with Skew</title>
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/normalize/5.0.0/normalize.min.css">
<link rel="stylesheet" href="<%=request.getContextPath() %>/css/dsstyle.css">

</head>
<script src="<%=request.getContextPath() %>/js/jquery-3.6.0.min.js"></script>
<script src="<%=request.getContextPath()%>/js/jquery-1.12.4.js"></script>
<script src="<%=request.getContextPath()%>/js/1.12.1-jquery-ui.js"></script>
<script> 
$(function(){ 
	$(".mini img").draggable({
		containment: '.background',
		opacity: 0.7
// 		cancel: '.card-body'
		
	}); 
	
  
    $(".mini img").mouseup(function () {
        var targetO = $(this);
        var parentPos = targetO.offset();
        var pos = targetO.position();
        
        var prodnm = targetO.attr("id");
        var minileft = pos.left;
        var minitop = pos.top;

//         document.getElementById('mname').setAttribute('value',prodnm);

		$('#prodnum').attr('value', prodnm);
		$('#minileft').attr('value', minileft);
		$('#minitop').attr('value', minitop);

// 		alert($('input').val());
// 		alert($('#minileft').val());
// 		alert($('#minitop').attr('value'));
		
// 		alert($('#mleft').attr('value'));
// 		alert($('#mtop').attr('value'));
        document.getElementById('updateroom1').submit(); 
//         form.submit();
    })
    
// 		alert($('input').val());
// 		alert($('#prodnum').val());	
// 		alert($('#prodnum').attr('value'));
	

      
	
    var prodnum2 = null;
    var targetO2 = null;
    
    
    $(".mini img").dblclick(function () {
//     $(".mini img").contextmenu(function () {
    	 var targetO2 = $(this);
         
         prodnum2 = targetO2.attr("id");
	         
         $('#prodnum2').attr('value', prodnum2);
         $('#minitype2').attr('value', "보유");
         
         document.getElementById('updateroom2').submit(); 
    	
    })
    
    $(".c-exp-gallery__content img").dblclick(function () {
    	var backgr = $('.background').attr("id");
    	
    	 targetO2 = $(this);
    	
         
         prodnum2 = targetO2.attr("id");
	         
         $('#prodnum2').attr('value', prodnum2);
         $('#minitype2').attr('value', "사용");
         $('#backgr').attr('value', backgr);
         document.getElementById('updateroom2').submit(); 
    	
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
  z-index: 3; 
}
.minicon{
 position:absolute; 

 z-index: 1; 
}
.background{
	width: 614px;
	height: 307px;
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
<div class="drslide">
<!-- partial:index.partial.html -->
<!-- Not mine -->
<div class="miniimg1 c-exp-gallery__slider js-experience-slider">
		<div class="c-exp-gallery__inner js-experience-slider__inner">
			<div class="c-exp-gallery__content js-experience-slider__content">

<%
	List<MiniVO> list2 = (List<MiniVO>) request.getAttribute("list2");
%>

<%
		for(int i=0; i<list2.size(); i++) {
			MiniVO vo2 = list2.get(i);
			String pnum2 = (vo2.getProd_num()).substring(0,4);
			if(pnum2.equals("P601")){
%>		

				<div class="c-exp-gallery-slide js-experience-slide">
					<div class="c-exp-gallery-slide__proxy"></div>
					<figure class="c-exp-gallery-slide__img">
						<img class="background2" id="<%=vo2.getProd_num() %>" src="<%=request.getContextPath()%>/images/miniroom/<%=vo2.getProd_nm() %>">
					</figure>
				</div>
<%}} %>
</div>
</div>
 <div class="proxy"></div>
</div>

<div class="miniimg2 c-exp-gallery__slider js-experience-slider">
		<div class="c-exp-gallery__inner js-experience-slider__inner">
<div class="c-exp-gallery__content js-experience-slider__content">
<%
		for(int i=0; i<list2.size(); i++) {
			MiniVO vo2 = list2.get(i);
			String pnum2 = (vo2.getProd_num()).substring(0,4);
			if(pnum2.equals("P501")){
%>	

				<div class="c-exp-gallery-slide js-experience-slide">
					<div class="c-exp-gallery-slide__proxy"></div>
					<figure class="c-exp-gallery-slide__img">
								<img class="minicon" id="<%=vo2.getProd_num() %>" src="<%=request.getContextPath()%>/images/minicon/<%=vo2.getProd_nm() %>">
					</figure>
				</div>

<%}} %>
</div>
</div>
 <div class="proxy"></div>
</div>




<div class="miniimg3 c-exp-gallery__slider js-experience-slider">
	<div class="c-exp-gallery__inner js-experience-slider__inner">
		<div class="c-exp-gallery__content js-experience-slider__content">
<%
		for(int i=0; i<list2.size(); i++) {
			MiniVO vo2 = list2.get(i);
			String pnum2 = (vo2.getProd_num()).substring(0,4);
			if(pnum2.equals("P401")){
%>	

				<div class="c-exp-gallery-slide js-experience-slide">
					<div class="c-exp-gallery-slide__proxy"></div>
					<figure class="c-exp-gallery-slide__img">
							<img class="minimi" id="<%=vo2.getProd_num() %>" src="<%=request.getContextPath()%>/images/minimi/<%=vo2.getProd_nm() %>">		
					</figure>
				</div>
<%}} %>
		</div>
	</div>

        
 <div class="proxy"></div>
</div>
	
<!-- partial -->
  <script src='https://cdnjs.cloudflare.com/ajax/libs/gsap/2.0.2/TweenMax.min.js'></script>
<script src='https://cdnjs.cloudflare.com/ajax/libs/gsap/2.0.2/utils/Draggable.min.js'></script>
<script src='https://s3-us-west-2.amazonaws.com/s.cdpn.io/58281/ThrowPropsPlugin.min.js'></script>
<script src='https://cdnjs.cloudflare.com/ajax/libs/gsap/2.0.2/plugins/ModifiersPlugin.min.js'></script><script  src="<%=request.getContextPath() %>/js/dsscript.js"></script>


<div id="info">
<form name="updateroom1" id="updateroom" action="<%=request.getContextPath()%>/miniroomUpdate.do" method="post">
	<input id="prodnum" type="hidden" name="prodnum" value="">
	<input id="minileft" type="hidden" name="minileft" value="">
	<input id="minitop" type="hidden" name="minitop" value="">
	<input id="minicode" type="hidden" name="minicode" value="2">
</form>

<form name="updateroom2" id="updateroom2" action="<%=request.getContextPath()%>/miniroomSetup.do" method="post">
	<input id="prodnum2" type="hidden" name="prodnum2" value="">
	<input id="minitype2" type="hidden" name="minitype2" value="">
	<input id="backgr" type="hidden" name="backgr" value="2">
</form>

</div>
</div>
</body>
</html>
