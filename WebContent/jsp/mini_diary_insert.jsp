<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<!--  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css"> -->
<!--   <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script> -->
<!--   <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script> -->
<!--   <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script> -->
<script src="<%=request.getContextPath()%>/js/jquery-3.6.0.min.js"></script>
  <script src="<%=request.getContextPath()%>/diaryEditer/summernote-lite.js"></script>
  <script src="<%=request.getContextPath()%>/diaryEditer/summernote-ko-KR.js"></script>
  <link rel="stylesheet" href="<%=request.getContextPath()%>/diaryEditer/summernote-lite.css">

</head>
<body>
<form id="diaryForm" action="<%=request.getContextPath()%>/diaryInsert.do" method="post" >

<textarea rows="10" cols="30" id="diaContent" name="diaContent" style="width:650px; height:350px; "></textarea>

   		 <select id="diaSel" name="diaSel">
        	<option value="전체공개" selected>전체공개</option>
       	    <option value="비공개">비공개</option>
        	<option value="일촌공개">일촌공개</option>
   		 </select>
   		 
   		 <input type="hidden" name="diaType" id="diaType" value="전체공개">
         <input type="submit" id="save" value="일기저장"/>
         <input type="button" value="취소" onclick="location.href='mini_diary.jsp'">

</form>
<script>
$(document).ready(function () {
    $('#diaContent').summernote({
        placeholder: '내용을 작성하세요',
        height: 400,
        maxHeight: 400,
        
        
        toolbar: [
		    // 글꼴 설정
		    ['fontname', ['fontname']],
		    // 글자 크기 설정
		    ['fontsize', ['fontsize']],
		    // 굵기, 기울임꼴, 밑줄,취소 선, 서식지우기
		    ['style', ['bold', 'italic', 'underline','strikethrough', 'clear']],
		    // 글자색
		    ['color', ['forecolor','color']],
		    // 표만들기
		    ['table', ['table']],
		    // 글머리 기호, 번호매기기, 문단정렬
		    ['para', ['ul', 'ol', 'paragraph']],
		    // 줄간격
		    ['height', ['height']],
		    // 그림첨부, 링크만들기, 동영상첨부
		    ['insert',['picture','link','video']],
		    // 코드보기, 확대해서보기, 도움말
		    ['view', ['codeview','fullscreen', 'help']]
		  ],
		  // 추가한 글꼴
		fontNames: ['Arial', 'Arial Black', 'Comic Sans MS', 'Courier New','맑은 고딕','궁서','굴림체','굴림','돋음체','바탕체'],
		 // 추가한 폰트사이즈
		fontSizes: ['8','9','10','11','12','14','16','18','20','22','24','28','30','36','50','72']
    });
    
    

	$('select[name=diaSel]').change(function() {
			$('#diaType').val($(this).val());
	});


    
    
    
    
    
    
    
    
    
    
    
});
</script>
</body>

</html>