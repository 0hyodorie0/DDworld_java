<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="../css/jquery.minicolors.css">
<link rel="stylesheet" href="../css/jquery.minicolors.png">
<script src="../js/jquery-3.6.0.min.js"></script>
<script src="../js/jquery.minicolors.min.js"></script>
<style>
div.box{
   border : 3px dotted orange;
   margin : 10px;
   padding : 10px;
}
.box div{
   border : 2px solid blue; 
   padding : 10px;
   height:  auto;
   margin-top : 5px;   

}

</style>
<script>
    $(document).ready( function() {
 
      $('.demo').each( function() {
        $(this).minicolors({
          control: $(this).attr('data-control') || 'hue',
          defaultValue: $(this).attr('data-defaultValue') || '',
          format: $(this).attr('data-format') || 'hex',
          keywords: $(this).attr('data-keywords') || '',
          inline: $(this).attr('data-inline') === 'true',
          letterCase: $(this).attr('data-letterCase') || 'lowercase',
          opacity: $(this).attr('data-opacity'),
          position: $(this).attr('data-position') || 'bottom',
          swatches: $(this).attr('data-swatches') ? $(this).attr('data-swatches').split('|') : [],
          change: function(hex, opacity) {
            var log;
            try {
              log = hex ? hex : 'transparent';
              if( opacity ) log += ', ' + opacity;
              console.log(log);
            } catch(e) {}
          },
          theme: 'default'
         // theme: 'bootstrap'
        });
 
      });

    });
    
   
    
$(function(){    
   $("#btn1").on('click',function(){
       
      $('.box div').css('background-color',$('.minicolors-swatch-color').css('background-color')); //      
   }) 

}) 











</script>
    
</head>
<body>
  
  <input type="text" id="hue-demo" class="demo" data-control="hue" value="#499999">



<div class="box">
 <h3></h3>
 <input type="button" value="확인" id="btn1">
 <div class="result1"></div> 
</div>


 
</body>
 


</html>


</body>
</html>