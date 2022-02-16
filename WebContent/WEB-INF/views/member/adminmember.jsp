<%@page import="ddw.vo.DdVO"%>
<%@page import="java.util.List"%>
<%@page import="ddw.vo.MemberVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%
    List<MemberVO> memberlist = (List<MemberVO>)request.getAttribute("memberlist");
%>
[
<%
	       for(int i=0; i<memberlist.size();i++){
	    	   MemberVO vo = memberlist.get(i);
	    	   if(i>0)out.print(",");
	    	   
%>
{
		"id" : "<%=vo.getMem_id()%>",
		"name" : "<%=vo.getMem_name()%>",
		"tel": "<%=vo.getMem_tel()%>",
		"zip": "<%=vo.getMem_zip()%>",
		"add1":	"<%=vo.getMem_add1()%>",
		"mail":	"<%=vo.getMem_mail()%>",
		"dtr" : "<%=vo.getMem_dtr()%>",
		"type": "<%=vo.getMem_type()%>"
}
<%
}
%>
]