<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%

	String id = (String)request.getAttribute("keyid");
	if(id != null){
%>
	{
		"sw" : "사용불가능"
	}

		
<%	}else { %>

	{
		"sw" : "사용가능"
	}
<%

	}
%>