$(document).ready(function () {
	$("#next").css("opacity", 0.5);
    $("#next").hover(function() {
        $(this).animate({opacity: 1.0}, 500);
    }, function() {
        $(this).animate({opacity: 0.5}, 500);
    });
});

	$("#previous").css("opacity", 0.5);
    $("#previous").hover(function() {
        $(this).animate({opacity: 1.0}, 500);
    }, function() {
        $(this).animate({opacity: 0.5}, 500);
    });

	var $carousel = $('#carousel');
	var $next = $('#next');
	var $previous = $('#previous');

	$carousel.css('left', 0);

	$next.on('click', function () {
		// console.log($carousel.css('left'));
	 var width = $('img:first').width();
	 var currentPost = $carousel.css('left');
	 if (parseInt(currentPost) <= -1224){
	 	$carousel.animate({
	 	left: 0
	  	});
	 } else {
	 	 $carousel.animate({
	 	left: parseInt(currentPost, 10) - parseInt(width, 10),
	  });
	 }

	});

	$previous.on('click', function () {
	 var width = $('img:first').width();
	 var currentPost = $carousel.css('left');
	 if (parseInt(currentPost) <= -1222){
	 	$carousel.animate({
	 	left: 0
	  	});
	 } else {
	 	 $carousel.animate({
	 	left: parseInt(currentPost, 10) + parseInt(width, 10),
	  });
	 }
	});


















