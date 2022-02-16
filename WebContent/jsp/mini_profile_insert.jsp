<%@page import="ddw.vo.ProfileVO"%>
<%@page import="java.util.Map"%>
<%@page import="ddw.vo.DdVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<%
	Map<String, String> keys = (Map<String, String>)session.getAttribute("keys");
	String keyDdworld = keys.get("keyDdworld");

    DdVO ddvo = (DdVO)session.getAttribute(keyDdworld);
%>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="<%=request.getContextPath() %>/css/bootstrap.min.css">
    <link rel="stylesheet" href="<%=request.getContextPath() %>/css/style.css">

    <script src="<%=request.getContextPath() %>/js/jquery-3.6.0.min.js"></script>
    <script src="<%=request.getContextPath() %>/js/bootstrap.min.js"></script>
    <script src="<%=request.getContextPath() %>/js/script.js"></script>
</head>
<body  class="inner">
<section class="p-3 menu_top">
		<div class="section_title"><%=ddvo.getMem_name() %>님의 프로필 입니다.</div>
	</section>
<div id="btn" align ="center">

    <h2>프로필 작성</h2>
    <form method="POST" action="/ddWorld/profileupdate.do" class="write">
	<section class="container">
		<textarea cols="70" rows="15" name="content" class="form-control" placeholder="프로필을 입력해 주세요"></textarea>
		<input type="hidden" name="ddadd" value=<%=ddvo.getDd_add()%>>
		<div class="mt-3">
			<input type="submit" class="btn" value="작성 완료" class=""/>
			 <input type="reset" class="mt-3" value="다시 작성"> 
		</div>
	</section>
      <%-- <table class="write">

			<tr>
				<th>내용</th>
				<td><textarea cols="70" rows="15" name="content" class="form-control"></textarea></td>
			</tr>
			
			<tr>
			  <th colspan="2"><input type="hidden" name="ddadd" value=<%=ddvo.getDd_add()%>></th>
			</tr>

        <tr>
 		  <td colspan="2">
             <input type="submit" value="작성 완료" class=""/>
			 <input type="reset" value="다시 작성">             
          </td>
        </tr>
      </table> --%>
    </form>
 
</div>

</body>
</html>