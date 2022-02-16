<%@page import="ddw.vo.ProdVO"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	List<ProdVO> prodList = 
	   (List<ProdVO>)request.getAttribute("prodList");
%>

<h2>상점</h2>
<table border="1">

<tr>
	<th>상품번호</th><th>상품명</th><th>상세설명</th><th>가격</th><th>분류코드</th><th>구입</th>
</tr>
<%
	for(ProdVO prodvo : prodList){
%>
	<tr>		
		<td><%=prodvo.getProd_num()%></td>
		<td><%=prodvo.getProd_nm()%></td>
		<td><%=prodvo.getProd_con()%></td>
		<td><%=prodvo.getProd_pa()%></td>
		<td><%=prodvo.getLprod_gu()%></td>
		<td><input type="submit" name="btn" value="장바구니추가"></td>

	</tr>
<%
	}
%>
</table>
</body>
</html>