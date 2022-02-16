<%@page import="ddw.vo.DiaryVO"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
//서블릿에서 저장한 값을 꺼낸다.
List<Integer> list = (List<Integer>)request.getAttribute("list");

%>
[

<% 
	for(int i=0; i<list.size(); i++) {
		if(i>0) out.println(",");
%>
		{
			"date"	: <%=list.get(i) %>
		}
<%
	}
%>

]