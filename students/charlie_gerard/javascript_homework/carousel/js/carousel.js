$(document).ready(function (){

	var $carousel = $('#carousel');
	var $next = $('#next');
	var $previous = $('#previous');

	$carousel.css('left',  0);
	
	$next.hover(function(){
	 	$next.hide();
	 	$next.fadeIn(300);
	});

	$previous.hover(function(){
	  	$previous.hide();
	  	$previous.fadeIn(300);
	});


	$next.on("click", function(){
		var width = $('img:first').width();
		var currentPos = $carousel.css("left");
		$carousel.animate({
			left: (parseInt(currentPos, 10) - parseInt(width, 10))
		});

		if (parseInt(currentPos) == parseInt('-1224')){
			$carousel.animate({
				left: parseInt('0')
			});
		}
	});

	$previous.on("click", function(){
		var width = $('img:first').width();
		var newPos = $carousel.css("left");
		$carousel.animate({
			left: parseInt(newPos, 10) + parseInt(width, 10)
		});

		console.log(parseInt(newPos))
		if (parseInt(newPos) == 0){
			$carousel.animate({
				left: parseInt('-1224')
			});
		}
	});
});
