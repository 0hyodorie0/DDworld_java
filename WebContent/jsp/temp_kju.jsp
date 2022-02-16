<%@page import="ddw.vo.PhotoVO"%>
<%@page import="java.util.List"%>
<%@page import="ddw.vo.MemberVO"%>
<%@page import="java.util.Map"%>
<%@page import="ddw.vo.DdVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>

<%/*
	Map<String, String> keys = (Map<String, String>)session.getAttribute("keys");
	String keyDdworld = keys.get("keyDdworld");

	MemberVO memvo = (MemberVO)session.getAttribute("loginMember");
	DdVO ddvo = (DdVO)session.getAttribute(keyDdworld);
	
	List<PhotoVO> list = (List<PhotoVO>)request.getAttribute("list");
*/%>

<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>김재웅 연습화면입니다.</title>
    <link rel="stylesheet" href="<%=request.getContextPath() %>/css/bootstrap.min.css">
    <link rel="stylesheet" href="<%=request.getContextPath() %>/css/style.css">

    <script src="<%=request.getContextPath() %>/js/jquery-3.6.0.min.js"></script>
    <script src="<%=request.getContextPath() %>/js/bootstrap.min.js"></script>
    <script src="<%=request.getContextPath() %>/js/script.js"></script>

</head>

<script type="text/javascript">


$(function(){
	
	
	$('#ff').on('submit', function(){
		alert("함수실행!");
		/*return false;*/
		
		var form = new FormData();
        form.append( "chooseFile", $("#chooseFile")[0].files[0] );
		
		var filename = $('#chooseFile').get(0).files[0].name;
		var filecon = $('#con').val()
		
		$.ajax({
			url		: '/ddWorld/temp01.do',
			method	: 'get',
			data 	: {'photo_pt' : filename, 'photo_con' : filecon},
			success : function(res){
				code = "<span>갔다옴</span>";
				
				$('#result').html(code);
			},
			error : function(xhr){
				alert("상태 : " + xhr.status);
			}
		})	
	})
	
	/*
	$('#insertImg').on('click',function(){
		var filename = $('#chooseFile').get(0).files[0].name;
		
		var filecon= $('#con').val()
		
		
		
		$.ajax({
			url		: '/ddWorld/temp01.do',
			method	: 'get',
			data 	: {'photo_pt' : filename, 'photo_con' : filecon},
			success : function(res){
				code = "<span>갔다옴</span>";
				
				$('#result').html(code);
			},
			error : function(xhr){
				alert("상태 : " + xhr.status);
			}
		})	
		
	})*/
	
	
})
  	
</script>


<body>
	<input id="btn1" type="button" value="사진등록" data-toggle="modal" data-target="#myModal" onchange="loadFile(this)">
	
	
	<!-- The Modal -->
  <div class="modal" id="myModal">
    <div class="modal-dialog">
      <div class="modal-content">
      
        <!-- Modal Header -->
        <div class="modal-header">
          <h4 class="modal-title">새 사진 등록하기</h4>
          <button type="button" class="close" data-dismiss="modal">&times;</button>
        </div>
        
        <!-- Modal body -->
       	<form  id="ff" method="post" enctype="multipart/form-data" action="/ddWorld/temp01.do">
	        <div class="modal-body">
	        		내용<br><br>
	        		<input id="con" name="imgcon" type="textarea" style="width:450px; height: 300px;">
	        		<br><br>
				    <input type="file" id="chooseFile" name="chooseFile" accept="image/*">
	        </div>
	        
	        
	        <!-- Modal footer -->
	        <div class="modal-footer">
	          <button type="submit" class="btn btn-danger">등록</button>
	        </div>
        </form>
        
      </div>
    </div>
  </div>
  
  <div id="result">
  </div>
  
</body>
</html>











