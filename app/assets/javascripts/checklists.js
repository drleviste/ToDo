$(function() {
  	$('.rectangle-container').hover(
	  	function() {
		  // alert(1);
	});

  $('#items .item .buttons li').hover(
	  function() {
		  $(this).addClass('ui-state-hover');
	  },
	  function() {
		  $(this).removeClass('ui-state-hover');
	  }
  );
});