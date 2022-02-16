<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String sid = (String)request.getAttribute("sid");
	if(sid != null){
%>	
	{
		"sw" : "가입성공"
	}

	
<%	}else {%>
	{
		"sw" : "가입실패"
	}


<%		
	}
%>