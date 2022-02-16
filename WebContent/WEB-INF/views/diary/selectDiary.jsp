<%@page import="ddw.vo.DiaryVO"%>
<%@page import="ddw.vo.DdVO"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%
    List<DiaryVO> list = (List<DiaryVO>)request.getAttribute("list");
	String login = (String)request.getAttribute("login");
%>
[
<%
	       for(int i=0; i<list.size();i++){
	    	   DiaryVO vo = list.get(i);
	    	   if(i>0)out.print(",");
	    	   
%>
{
		"no" : "<%=vo.getDiary_no()%>",
		"ddadd" : "<%=vo.getDd_add()%>",
		"cont": "<%=vo.getDiary_cont()%>",
		"date": "<%=vo.getDiary_date()%>",
		"type":	"<%=vo.getDiary_type()%>"
}
<%
}
%>
]