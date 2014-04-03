$(document).ready(function () {

  var $carousel = $('#carousel');
  var $next = $('#next');
  var $previous = $('#previous');
  var $buttons = $('#next, #previous');

  var width = parseInt($('img:first').width(),10);
  var imageCount = $('#carousel img').length;

  var moveImage = function (direction) {
    //stop the current animation if there is one
    $carousel.stop(true,true)
    //get the current position of the carousel div
    var currentPos = parseInt($carousel.css('left'));
    //move the carousel
    //right should not be allowed if left === -1224px (width x 3)
    if (direction === 'right' && currentPos > ((imageCount - 1) * width * -1)) {
      console.log("Moving right")
      $carousel.animate({
        left: currentPos - width
      });
    //left should not be allowed if left === 0
    } else if (direction === 'left' && currentPos < 0) {
      console.log("Moving left")
      $carousel.animate({
        left: currentPos + width
      });
    } else {
      $carousel.animate({
        left: 0
      });
      console.log("Reseting the position");
    }
  };

  $next.on('click', function (){
    console.log("Click on right button registered");
    moveImage('right');
  });

  $previous.on('click', function (){
    console.log("Click on left button registered");
    moveImage('left');
  });

  $buttons.hover(function () {
    $(this).css('opacity', '0.8');
  } ,function () {
    $(this).css('opacity', '0.5');
  });

  window.debugMe = function () {
    debugger;
  };

});


