<%@page import="ddw.vo.MemberVO"%>
<%@page import="java.util.Map"%>
<%@page import="ddw.vo.DdVO"%>
<%@page import="ddw.vo.OneVO"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<%
	Map<String, String> keys = (Map<String, String>)session.getAttribute("keys");
	String keyDdworld = keys.get("keyDdworld");
//	String keyOnelist = keys.get("keyOnelist");
	String keyVisit = keys.get("keyVisit");

	int oneChk = (int)session.getAttribute("oneChk");
	MemberVO loginMember = (MemberVO)session.getAttribute("loginMember");
	DdVO ddvo = (DdVO)session.getAttribute(keyDdworld);
//	List<OneVO> onelist = (List<OneVO>)session.getAttribute(keyOnelist);
%>


<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">

<title>(대기중)미니홈피  > 홈</title>
    <link rel="stylesheet" href="<%=request.getContextPath() %>/css/bootstrap.min.css">
    <link rel="stylesheet" href="<%=request.getContextPath() %>/css/style.css">
    
	<script src="<%=request.getContextPath() %>/js/jquery-3.6.0.min.js"></script>
    <script src="<%=request.getContextPath() %>/js/bootstrap.min.js"></script>
    <script src="<%=request.getContextPath() %>/js/script.js"></script>
</head>

<script type="text/javascript">
$(function(){
	$.ajax({
  		url			:'/ddWorld/selectOneConList.do',
  		dataType	:'json',
  		method	    :'get',
  		success	    :function(res){    			
			code = "";
			$.each(res,function(i, v){
	  			if(v.one_con != null){
	  				code += '<li><span>';	
	  				code += v.one_con;
	  				code += '</span>(<span>';
	  				code += v.one_name;
	  				code += '</span><a href="" class="ilchon_link"><span id="onename">';
	  				code += v.mem_name;
	  				code += '</span></a>)';
	  				<%if(loginMember != null){%>
	  					if('<%=oneChk %>'== 5 || v.mem_id2 == '<%=loginMember.getMem_id()%>'){
	  						code += '<input type="button" class="deleteOnecon" idx="';
	  						code += v.mem_id2+'"';
	  						code += 'style="margin-left:10px; font-size:7px;" value="삭제">';
	  					}
	  				<%}%>
	  		        code += '</li>';
	  			}    
	  		});
			$('#onelist').html(code);
	    }, 
	    error:function(xhr){
   			alert("상태 : " + xhr.status);		    	
		}
	});//end ajax
	
	$('#onelist').on('click', '.deleteOnecon', function(){
		memid2 = $(this).attr('idx');
		var li =$(this).parent('li');
		$.ajax({
	  		url			:'/ddWorld/deleteOneCon.do',
	  		data	    : {"mem_id2" : memid2},
	  		method	    :'get',
	  		success	    :function(res){
	  			alert("일촌평을 삭제합니다.");
	  			li.css('display', 'none');
		    }, 
		    error:function(xhr){
			}
		});//end ajax
	})
	
	
	
	$('#miniroomset').on("click",function(){
		location.href="/ddWorld/miniroomSetselect.do"
	})
	
})

</script>

<body class="inner">
<div class="minimain">
    <section>
        <h3 class="section_title">Updated news</h3>
        <div class="row">
            <div class="col-6 minimain_news">
                <ul>
                    <li><a href="#">게시물이다</a></li>
                    <li><a href="#">[스크랩] 공주사진</a></li>
                    <li><a href="#">[스크랩] 겜방 pic</a></li>
                    <li><a href="#">첫게시물</a></li>
                </ul>
            </div>
            <div class="col-6">
                <table border="1" class="table">
                    <tr>
                        <td><a href="">싸이브금</a></td>
                        <td><a href="">랩/힙합</a></td>
                    </tr>
                    <tr>
                        <td><a href="">박명호</a></td>
                        <td><a href="">abcdefg</a></td>
                    </tr>
                    <tr>
                        <td><a href="">2002</a></td>
                        <td><a href="">2021</a></td>
                    </tr>
                </table>
            </div>
        </div>
    </section>
    <section>
        <h3 class="section_title">Miniroom</h3>
        <input type="button" value="미니룸 설정" class="float-right" id="miniroomset">
        <div class="miniroom">
            
<!--             <iframe src="./miniroom.jsp" name="miniroom"  class=""> -->
            <iframe src="<%=request.getContextPath()%>/miniroomSelect.do" name="miniroom"  class="">
            </iframe>
        </div>
    </section>
    <section>
        <h3 class="section_title">What friends say</h3>
        <div class="ilchon_quote">
        <%
        	/* 접속자가 홈피주인과 일촌인지 확인 */
        	if(loginMember != null && oneChk == 1){
        %>
        <!-- 
        <form action="/updateOneCon.do?id=홈피주인&id2=작성자">
         -->
            <form action="<%=request.getContextPath()%>/updateOneCon.do?id=<%=ddvo.getMem_id()%>&id2=<%=loginMember.getMem_id()%>" method="post">
	        	<div class="p-2 ilchon_write">
	        		<input type="text" name="onecon" size="70" placeholder="일촌평 남겨줘~">
	        		<input id="save" type="submit" value="저장">
	        	</div>
        	</form>
        <%
        	}
        %>
            <ul id="onelist">

            </ul>
        </div>
    </section>
</div>
</body>
</html>