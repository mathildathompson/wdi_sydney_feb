$(document).ready(function () {

var $carousel = $('#carousel ul');
var $next = $('#next');
var $previous = $('#previous');

    $( ".carousel-direction" ).hover(function() {
        $( this ).css('color', 'red');
        $( this ).css('font-size', '20px');
    },
        function() {
        $( this ).css('color', '#222222');
        $( this ).css('font-size', '16px');
    });

    $next.on('click', function () {
        $("#carousel ul").animate({
            marginLeft: -612} , 1000, function(){
            $( this ).find("li:last").after($( this ).find("li:first"));
            $( this ).css({marginLeft:0});
        });
    });

    $previous.on('click', function () {
        $("#carousel ul").animate({
            marginLeft: +612} ,1000, function(){
            $( this ).find("li:first").before($( this ).find("li:last"));
            $( this ).css({marginLeft:0});
        });
    });
});