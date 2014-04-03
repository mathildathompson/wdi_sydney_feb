$(document).ready(function(){

  var $carousel = $('#carousel');
  var $next = $('#next');
  var $previous = $('#previous');
  var width = $('img:first').width();
  var limit = $('#carousel').width();

  $carousel.css('left', 0);

  $next.on('click', function(){
    $carousel.stop(true, true)
    var currentPos = $carousel.css('left');
    // check to see if current width and position = the carousel full widht and if so - return to start
    if (parseInt(currentPos) - width <= -limit){
      $carousel.animate({
        left: 0
      })
    } else {
      //animate the carousel to the left as expected
      $carousel.animate({
        left: parseInt(currentPos, 10) - parseInt(width, 10)
      });
    }
  });

  $next.on('mouseover', function(){
    $next.addClass( "hovered" );
  });
  $next.on('mouseout', function(){
    $next.removeClass( "hovered" );
  });

  $previous.on('mouseover', function(){
    $previous.addClass( "hovered" );
  });
  $previous.on('mouseout', function(){
    $previous.removeClass( "hovered" );
  });

  $previous.on('click', function(){
    $carousel.stop(true, true)
    var currentPos = $carousel.css('left');
    // check to see if current width and position = the carousel full widht and if so - return to start
    if (parseInt(currentPos) >= 0){
      $carousel.animate({
        left: (-limit + width)
      })
    } else {
      //animate the carousel to the right as expected
      $carousel.animate({
        left: parseInt(currentPos, 10) + parseInt(width, 10)
      });
    }
  });


});