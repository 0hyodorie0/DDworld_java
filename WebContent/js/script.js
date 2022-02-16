$(function() {
    // 미니홈피 메뉴 선택 색상변경
	$('.minihome_menu li').first().find('a').addClass('active');
    $('.minihome_menu a').on('click', function(e) {
        
        if ($(this).hasClass('active')){
        	$(this).parents().find('a').removeClass('active')
        } else{
        	$(this).parents().find('a').removeClass('active')
        	$(this).addClass('active');
        }
    });
    
    $('.star').on('click', function () {
        $(this).toggleClass('star-checked');
      });

      $('.ckbox label').on('click', function () {
        $(this).parents('tr').toggleClass('selected');
      });

      $('.btn-filter').on('click', function () {
        var $target = $(this).data('target');
        if ($target != 'all') {
          $('.table tr').css('display', 'none');
          $('.table tr[data-status="' + $target + '"]').fadeIn('slow');
        } else {
          $('.table tr').css('display', 'none').fadeIn('slow');
        }
      });
      
    
});
