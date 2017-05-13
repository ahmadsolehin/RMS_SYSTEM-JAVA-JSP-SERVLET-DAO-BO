
$(document).ready(function () {

    $('.ayam').click(function () {
        var href = $(this).attr('href');
        $('#haha').empty().load(href).fadeIn('slow');
        return false;
    });

});


$('#buttonajax').click(function () {
    var href = $('#buttonajax').attr('href');
    $('#haha').load(href).fadeIn('slow');
    return false;
});




$('#akim').click(function () {
    var href = $(this).attr('href');
    $('#haha').load(href).fadeIn('slow');
    return false;
});

