<%@page import="ddw.vo.MemberVO"%>
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
	MemberVO loginMember =  (MemberVO)session.getAttribute("loginMember");
%>
<head>
<meta charset="UTF-8">
<title>미니홈피  다이어리</title>
	<link rel="stylesheet" href="<%=request.getContextPath() %>/css/bootstrap.min.css">
    <link rel="stylesheet" href="<%=request.getContextPath() %>/css/style.css">

    <script src="<%=request.getContextPath() %>/js/jquery-3.6.0.min.js"></script>
    <script src="<%=request.getContextPath() %>/js/bootstrap.min.js"></script>
    <script src="<%=request.getContextPath() %>/js/script.js"></script>
       
    <link rel="stylesheet" href="<%=request.getContextPath() %>/css/diaryfont.css">
    <link rel="stylesheet" href="<%=request.getContextPath() %>/css/diary.css">
    <script src="https://kit.fontawesome.com/36c897492b.js" crossorigin="anonymous"></script>
 
    
    
</head>
<body>
<!-- 	<section class="p-3 menu_top"> -->
<%-- 		<div class="section_title"><%=ddvo.getMem_name() %>님의 다이어리 입니다.</div> --%>
<!-- 	</section> -->
	
<div class="content-container p-3">
  <div class="box content-box"> 
   <div class="calendar"> 	
	<div class="date-today"><span class="toMon"></span><span>.</span><span class="toDate"></span><br><span class="toWeek"></span>
	<button class="go-today" id="moveToday">Today</button>
	</div>
    <div class="date-list" id="date-list">
      <div class="date-mon">
        <button class="nav-btn go-prev" id="movePrevMonth">◀</button>
        <span id="cal_top_year"></span>
        <span id="cal_top_month"></span>
        <button class="nav-btn go-prev" id="moveNextMonth">▶</button>
       </div>
       <div id="cal_tab" class="cal"></div>
    </div>
   </div>
   
  </div>
<% 	   
    if(loginMember!=null && ddvo.getDd_add().equals(loginMember.getMem_id()+"dd")) {
    	
%> 		
 <div class="schedule my-2 p-2">
 	<div class="schedule_list">
 		일정 일정/기념일이 없습니다.
 	</div>
 </div>
<div class="diabtn d-flex justify-content-end">
	<input type="button" class="schBtn mx-1" value="일기쓰기" id="wrbtn">
	<input type="button" class="schBtn mx-1" value="월별 전체일기" id="monbtn">
	<input type="button" class="schBtn mx-1" value="일정달력 보기" id="schbtn" onclick=location.href='mini_diary_schedule.jsp'>
</div>
<%
}
%>
 
 <div class="box diary-scrollbox">
	
	
<!-- 			   <div class="button-box">	 -->
<!-- 			   	<button class="diary-button font-neo" onclick="getTextFile()"><i class="fas fa-lock"></i>My Secret Diary</button> -->
<!-- 	   </div> -->
<!-- 	   <div class="diary" id="secret-box"> -->
<!-- 	   <div class="diary-date">My Secret Diary</div> -->
<!-- 	   <div class="diary-contents font-kyobohand" id="secret-diary"></div> -->
<!-- 	   </div> -->
	</div>
  
</div>
<script type="text/javascript">
  
    var today = null;
    var year = null;
    var month = null;
    
    var yearTo = null;
    var dayTo = null;
    var monTo = null;
    var weekTo = null;
    
    var selDia = null;
    var diaDay = null;
    var diaYear = null;
    var diaMon = null;
    var diaDate = null;

    var firstDay = null;
    var lastDay = null;
    var $tdDay = null;
    var $tdSche = null;
    var jsonData = null;
    $(document).ready(function() {
    	
        drawCalendar();
        initDate();
        drawContent();
        drawDays();
        drawSche();
        
        $("#movePrevMonth").on("click", function(){
        	removeBtn();
        	movePrevMonth();
        });
        $("#moveNextMonth").on("click", function(){
        	removeBtn();
        	moveNextMonth();});
        $("#moveToday").on("click", function(){
        	removeBtn();
        	moveToday();});
        
        
        
        $("#wrbtn").on("click", function () {
        	$ ('.diary-scrollbox').empty();	
        	$('.diary-scrollbox').load("mini_diary_insert.jsp");
//         	location.href='diaWrite1.jsp'
        });
        
        
        $("#updateBtn").on("click", function () {
//         	$ ('.diary-scrollbox').empty();	
        	$('.diary-scrollbox').load("mini_diary_insert.jsp");
//         	location.href='diaWrite1.jsp'
        });
        
    });
    
    function selBtn(id) {
    	selectContent(id);
    }
    
    function updateDia(name) {
    	
    	location.href='naver.com';
    }
    
    
    //Calendar 생성
    function drawCalendar(){
        var setTableHTML = "";
        for(var i=0;i<6;i++){
            for(var j=0;j<7;j++){
           
                setTableHTML+='    <div class="cal-day"></div>';
//                 setTableHTML+='    <div class="cal-schedule"></div>';
            }
        }
        $(".date-mon").after(setTableHTML);
    }
    
    
    function drawContent(){
    	console.log("year=" + year);
       	$.ajax({
    		url : '/ddWorld/diarySelect.do',
    		method : 'get',
    		data : {
    			"day" : year + "" + month
    		},
    		success : function(res){
    			code = "";
    			 $.each(res, function(i,v){
    				code += '<div class="diary">';
    				code += '<form class="diaryForm" action="mini_diary_update.jsp">';
    				
    				code += '<div class="diary-date">' + v.diary_date +'</div>';
    				code += '<input type="hidden" value="' + v.diary_no +'" name="no">';
    				
    				code += '<div class="diary-contents p-4">' + v.diary_cont +'</div><br>';
    				code += '<textarea name="cont" rows="3" style=display:none>'+v.diary_cont+'</textarea>';
    				
    				code += '<hr>';
       				<% 	   
    			    if(loginMember!=null && ddvo.getDd_add().equals(loginMember.getMem_id()+"dd")) {
    			    	
    				%> 
    				code += '<div class="diaryHid px-4">';
    				code += '<div class="diary-type">공개설정 : ' + v.diary_type +'</div>';
    				code += '<input type="hidden" value="' + v.diary_type +'" name="type">';
    				
 
// 					code += '<input type="button" id=' + v.diary_no + ' value="수정" onclick='updateDia(this.id);'">';
// 					code += '<input type="button" id="updateBtn" name="' + v.diary_no + '" value="수정" onclick="updateBtn(this.name);">';
					code += '<input type="submit" id="updateBtn" value="수정">';
    				code += '</form>';
    				
					code += '<form class="diaryForm" action="/ddWorld/diaryDelete.do">';
					code += '<input type="hidden" value="' + v.diary_no +'" name="no">';
    				code += '<input type="submit"  value="삭제">';
//     				code += '<input type="button"  onclick="location.href=\'/diaryDelete.do?diary_no="'+v.diary_no+'\"\'\" value="삭제" >';
					code += '</form>';
    				code += '</div>';
    				<%
    			    }
    				%>
					code += '<div class="diaryRelist px-4">';
					code += '</div>';
					
					
					
					$.ajax({
			    		url : '/ddWorld/diaryReSelect.do',
			    		method : 'get',
			    		data : {
			    			"no"  : v.diary_no	
			    		},
			    		success : function(res){
			    			code = ""
			    			
			    			$.each(res, function(i,v){
			    				code += '<form action="/ddWorld/diaryReDelete.do">';
			    				code += '<div class="diaryReply">';
			    				code += '<div class="diaryre-id">';
			    				code += v.mem_name + ": " + v.diary_recon +" ["+ v.diary_redate +"]";
			    				
			    				<%if(loginMember != null){%>
			    				if(v.mem_id=='<%=loginMember.getMem_id()%>' || '<%=ddvo.getDd_add()%>'=='<%=loginMember.getMem_id()+"dd"%>'){
				    				code += ' <input type="submit" value="X">';
			    					
			    				}
			    				<%}%>
			    				code += '<input type="hidden" name="memid" value="'+v.mem_id+'">';
			    				code += '<input type="hidden" name="renum" value="'+v.diary_renum+'">';
			    				code += '</div>';
			    				code += '</div>';
			    				code += '</form>';
			    			})
			    				code += '<div class="reply diaryReplyin h-100 pb-3 mt-1">';
			    				code += '<form action="/ddWorld/diaryReInsert.do"><br>';
			    				code += ' <input type="hidden" name="diaryNo"  value="'+v.diary_no+'">';
			    				code += ' 댓글 <input type="text" name="diaryRe"  size="50" placeholder="댓글을 입력해 주세요">';
			    				code += ' <input type="submit" value="확인">';
			    				code += '</div>';
		    				
		    				$ ('.diaryRelist').html(code);	
		    			},
		        		error : function(xhr){
		        			alert("상태 : " + xhr.status) ;
		        		},
		        		dataType : 'json'
		        	})
					
		        	code += '</div>';
    			 })
    			 
    			$ ('.diary-scrollbox').html(code);	 
    		},
    		error : function(xhr){
    			alert("상태 : " + xhr.status) ;
    		},
    		dataType : 'json'
    	})
    }
    
    function selectContent(day){
    	console.log("year=" + year);
    	
       	$.ajax({
    		url : '/ddWorld/diarySelect.do',
    		method : 'get',
    		data : {
    			"day" : day
    		},
    		success : function(res){
    			code = "";
    			 $.each(res, function(i,v){
    				code += '<div class="diary">';
    				code += '<form class="diaryForm" action="mini_diary_update.jsp">';
    				
    				code += '<div class="diary-date">' + v.diary_date +'</div>';
    				code += '<input type="hidden" value="' + v.diary_no +'" name="no">';
    				
    				code += '<div class="diary-contents p-4">' + v.diary_cont +'</div><br>';
    				code += '<textarea name="cont" rows="3" style=display:none>'+v.diary_cont+'</textarea>';
    				
    				code += '<hr>';
    				<% 	   
    			    if(loginMember!=null && ddvo.getDd_add().equals(loginMember.getMem_id()+"dd")) {
    			    	
    				%> 
    				code += '<div class="diaryHid px-4">';
    				code += '<div class="diary-type">공개설정 : ' + v.diary_type +'</div>';
    				code += '<input type="hidden" value="' + v.diary_type +'" name="type">';
    				
// 					code += '<input type="button" id=' + v.diary_no + ' value="수정" onclick='updateDia(this.id);'">';
// 					code += '<input type="button" id="updateBtn" name="' + v.diary_no + '" value="수정" onclick="updateBtn(this.name);">';
					code += '<input type="submit" id="updateBtn" value="수정">';
    				code += '</form>';
					code += '<form class="diaryForm" action="/ddWorld/diaryDelete.do">';
					code += '<input type="hidden" value="' + v.diary_no +'" name="no">';
    				code += '<input type="submit" value="삭제">';
//     				code += '<input type="button"  onclick="location.href=\'/diaryDelete.do?diary_no="'+v.diary_no+'\"\'\" value="삭제" >';
					code += '</form>';
					code += '</div>';
					<%
    			    }
    				%>
					code += '<div class="diaryRelist px-4">';
					code += '</div>';
    				
					
				 	$.ajax({
			    		url : '/ddWorld/diaryReSelect.do',
			    		method : 'get',
			    		data : {
			    			"day" : day,
			    			"no"  : v.diary_no	
			    		},
			    		success : function(res){
			    			code = ""
			    			
			    			$.each(res, function(i,v){
			    				code += '<form action="/ddWorld/diaryReDelete.do">';
			    				code += '<div class="diaryReply">';
			    				code += '<div class="diaryre-id">';
			    				code += v.mem_name + ": " + v.diary_recon +" ["+ v.diary_redate +"]";
			    				
			    				
		    					<%if(loginMember != null){%>
			    				if(v.mem_id=='<%=loginMember.getMem_id()%>' || '<%=ddvo.getDd_add()%>'=='<%=loginMember.getMem_id()+"dd"%>'){
				    				code += ' <input type="submit" value="X">';
			    					
			    				}
			    				<%}%>
			    				code += '<input type="hidden" name="memid" value="'+v.mem_id+'">'
			    				code += '<input type="hidden" name="renum" value="'+v.diary_renum+'">'
			    				code += '</div>';
			    				code += '</div>';
			    				code += '</form>';
			    				
			    			})
			    				code += '<div class="reply diaryReplyin h-100 pb-3 mt-1">';
			    				code += '<form action="/ddWorld/diaryReInsert.do"><br>';
			    				code += ' <input type="hidden" name="diaryNo"  value="'+v.diary_no+'">';
			    				code += ' 댓글 <input type="text" name="diaryRe"  size="50" placeholder="댓글을 입력해 주세요">';
			    				code += ' <input type="submit" value="확인">';
			    				code += '</div>';
		    				
		    				$ ('.diaryRelist').html(code);	
		    			},
		        		error : function(xhr){
		        			alert("상태 : " + xhr.status) ;
		        		},
		        		dataType : 'json'
		        	})
    				
    				
    				code += '</div>';
    			 })
    			 
    			$ ('.diary-scrollbox').html(code);	 
    			 
    			 
//     			 code = "";
//     			 $.each(res, function(i,v){
//     				code += '<div class="diary">';
//     				code += '<div class="diary-date">' + v.diary_date +'</div>';
//     				code += '<div class="diary-contents">' + v.diary_cont +'</div><br>';
    				
//     				code += '<div class="diary-type">공개설정 : ' + v.diary_type +'</div>';
    				
// //     				if(loginMember!=null && ddvo.getDd_add().equals(loginMember.getMem_id()+"dd")) {
//     				if((v.dd_ad).equals(request.getAttribute("login")+"dd")) {
//     					code += '<input type="button" value="수정">'
//     					code += '<input type="button" value="삭제">'
//     				};
    				
//     				code += '</div>'
//     			 })
    			 
//     			$ ('.diary-scrollbox').html(code);	
    			 
    		},
    		error : function(xhr){
    			alert("상태 : " + xhr.status) ;
    		},
    		dataType : 'json'
    	})
    }
    
    //날짜 초기화
    function initDate(){
        $tdDay = $("div.cal-day")
        $tdSche = $("div.cal-schedule")
        dayCount = 0;
        today = new Date();
        year = today.getFullYear();
        month = today.getMonth()+1;
        
        yearTo = today.getFullYear();
        monTo = today.getMonth()+1;
        dayTo = today.getDate();
        weekTo = today.getDay();
        if(weekTo==0)weekTo="Sun";
        if(weekTo==1)weekTo="Mon";
        if(weekTo==2)weekTo="Tue";
        if(weekTo==3)weekTo="Wed";
        if(weekTo==4)weekTo="Thu";
        if(weekTo==5)weekTo="Fri";
        if(weekTo==6)weekTo="Sat";
        
        if(month < 10){month = "0"+month;}
        firstDay = new Date(year,month-1,1);
        lastDay = new Date(year,month,0);
    }
    
    //calendar 날짜표시
    function drawDays(){
//     	console.log(code);
    	diaYear = null;
    	diaMon = null;
    	diaDate = null;
    	
        $(".toMon").text(monTo);
        $(".toDate").text(dayTo);
        $(".toWeek").text(weekTo);
        $("#cal_top_year").text(year);
        $("#cal_top_month").text(month);
        
        
       	$.ajax({
       		url : '/ddWorld/diaryInputbtn.do',
    		method : 'get',
    		data : {
    			"year" : year,
    			"month" : month
    		},
    		success : function(res){
    			var diaryBtn = null;
    			var val = null;
    			for(var j=firstDay.getDay();j<firstDay.getDay()+lastDay.getDate();j++){
    			    daycnt = ++dayCount;
    			    cnt = j;
    			    
    			    $tdDay.eq(j).text(daycnt);
    			    
    				val = $tdDay.eq(j).text();
    			    if(val<10){
    			    	val = "0"+val
    			    }
    				
    				$.each(res, function(i,v){
    			        if(cnt==v.date+firstDay.getDay()-1){
//     			        	$tdDay.eq(j).append(diaryBtn);
							$tdDay.eq(j).wrap("<button class='selBtn' id='" +year+""+month+""+val + "' name='" +year+""+month+""+val+ "' value='" +year+""+month+""+val +"' onclick='selBtn(this.id);'></button>");
    			        }
    			    })
//     				$tdDay.eq(j).text(daycnt);
//     				val = $tdDay.eq(j).text();
    			}
    				
 			        for(var i=0;i<42;i+=7){
 			            $tdDay.eq(i).css("color","red");
 			        }
 			        for(var i=6;i<42;i+=7){
 			            $tdDay.eq(i).css("color","blue");
 			        }
    			     
    			        
    		},
    		error : function(xhr){
    			alert("상태 : " + xhr.status) ;
    		},
    		dataType : 'json'
    	})
    }
    
    function removeBtn(){
    	
    	$('.cal-day').unwrap('.selBtn');
    	
    }
    
    

    
    
    //calendar 월 이동
    function movePrevMonth(){
        month--;
        if(month<=0){
            month=12;
            year--;
        }
        if(month<10){
            month=String("0"+month);
        }
        getNewInfo();
        }
    
    function moveNextMonth(){
        month++;
        if(month>12){
            month=1;
            year++;
        }
        if(month<10){
            month=String("0"+month);
        }
        getNewInfo();
    }
    
    function moveToday(){
    	year = yearTo;
    	if(monTo<10){
            month=String("0"+monTo);
        }else{
        	month = monTo;
        }
        today = dayTo;
        getNewInfo();
    }
    
    
    //정보갱신
    function getNewInfo(){
        for(var i=0;i<42;i++){
            $tdDay.eq(i).text("");
            $tdSche.eq(i).text("");
        }
        dayCount=0;
        firstDay = new Date(year,month-1,1);
        lastDay = new Date(year,month,0);
        drawContent();			//월별새로바뀜
        drawDays();
        drawSche();
    }
    
//     function getMoveInfo{
//         for(var i=0;i<42;i++){
//             $tdDay.eq(i).text("");
//             $tdSche.eq(i).text("");
//         }
//         dayCount=0;
//         firstDay = new Date(year,month-1,1);
//         lastDay = new Date(year,month,0);
//         drawDays();
//         drawSche();
//     }
  
    
    //데이터 등록
    function setData(){
        jsonData = 
        {
            "2022":{
                "02":{
                    "11":"^^"
                }
                ,"08":{
                    "7":"qwew"
                    ,"15":"asdsa"
                    ,"23":"rre"
                }
                ,"09":{
                    "13":"er"
                    ,"23":"qwe"
                }
            }
        }
    }
    
    //스케줄 그리기
    function drawSche(){
        setData();
        var dateMatch = null;
        for(var i=firstDay.getDay();i<firstDay.getDay()+lastDay.getDate();i++){
            var txt = "";
            txt =jsonData[year];
            if(txt){
                txt = jsonData[year][month];
                if(txt){
                    txt = jsonData[year][month][i];
                    dateMatch = firstDay.getDay() + i -1; 
                    $tdSche.eq(dateMatch).text(txt);
//                     $tdDay.eq(i).after(++'<input type="button">');
//                     $tdSche.eq(dateMatch).after("<p class='blue'>test</p>");
                    
                    
                }
            }
        }
    }
    
//     const goToday = () => {
//     	  date = new Date();
//     	  renderCalender();
//     	};
// $(function(){
//     $('.selBtn').on('click',function(){
//     	alert("하이");
//     	selDia = this.value;
//     	console.log(selDia);
//     	selectContent(selDia);
//     })
    
// })


</script>

</body>
</html>