<%@page import="java.util.Map"%>
<%@page import="ddw.vo.MemberVO"%>
<%@page import="ddw.vo.ProfileVO"%>
<%@page import="java.util.List"%>
<%@page import="ddw.vo.DdVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<%
	Map<String, String> keys = (Map<String, String>)session.getAttribute("keys");
	String keyDdworld = keys.get("keyDdworld");
	
	DdVO ddvo = (DdVO)session.getAttribute(keyDdworld);
	MemberVO loginMember =  (MemberVO)session.getAttribute("loginMember");
	
	ProfileVO profile = (ProfileVO)request.getAttribute("profile");	 
%>

<head>


<meta charset="UTF-8">
<title>(대기중)미니홈피  > 프로필</title>
<link rel="stylesheet" href="<%=request.getContextPath() %>/css/bootstrap.min.css">
    <link rel="stylesheet" href="<%=request.getContextPath() %>/css/style.css">

    <script src="<%=request.getContextPath() %>/js/jquery-3.6.0.min.js"></script>
    <script src="<%=request.getContextPath() %>/js/bootstrap.min.js"></script>
    <script src="<%=request.getContextPath() %>/js/script.js"></script>
<script>



</script>



</head>
<body  class="inner">
	<section class="p-3 menu_top">
		<div class="section_title"><%=ddvo.getMem_name() %>님의 프로필 입니다.</div>
	<% 	   
     // 해당 세션 아이디일 경우에만 프로필 작성 버튼 보여지게 하기 ! // 
    if(loginMember!=null && ddvo.getDd_add().equals(loginMember.getMem_id()+"dd")) {
    	if(profile!=null){
%> 		<input type="button" id = "btn1" value="프로필수정" class="btn" onclick="location.href='jsp/mini_profile_insert.jsp'"> 		
		<% 
		} else if(profile ==null) {
		%>	 
		<input type="button" id = "btn1" value="프로필작성" class="btn" onclick="location.href='jsp/mini_profile_insert.jsp'">
		<% 
		} 
		%>
<%
}
%>
	</section>
	<section class="p-3 h-50">
<%
if(profile!=null){
%>
    <div name="content"><%=profile.getProfile_con()%></div>
<%
}
%>
</section>



</body>
</html>