$(function() {

  'use strict';

    $('.js-menu-toggle').click(function() {

        //if ($('body').hasClass('show-sidebar')) {

        //}

  	var $this = $(this);
      
  	

  	if ( $('body').hasClass('show-sidebar') ) {
  		$('body').removeClass('show-sidebar');
  		$this.removeClass('active');
  	} else {
  		$('body').addClass('show-sidebar');	
  		$this.addClass('active');
  	}


  });

  // click outisde offcanvas
	$(document).mouseup(function(e) {
  	e.preventDefault();
    var container = $(".sidebar");
    if (!container.is(e.target) && container.has(e.target).length === 0) {
      if ( $('body').hasClass('show-sidebar') ) {
				$('body').removeClass('show-sidebar');
				$('body').find('.js-menu-toggle').removeClass('active');
			}
    }
	}); 

    

});