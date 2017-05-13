
$(document).ready(function(){


$('.ayam').click(function(){
	var href = $('.ayam').attr('href');
	$('#haha').hide().load(href).fadeIn('slow');
	return false;
})


})