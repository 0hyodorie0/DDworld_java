<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%
	int result = (int)request.getAttribute("result");
%>



<%	if(result == 1){%>
		{"sw" : "성공"}
<%	}else if(result == 2){%>
		{"sw" : "일촌"}
<%	}else if(result == 3){%>
		{"sw" : "대기"}
<%	}else{%>
		{"sw" : "실패"}
<%	}%>
