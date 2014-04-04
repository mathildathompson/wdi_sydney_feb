$(document).ready(function () {

  snowStorm.toggleSnow();
  snowStorm.toggleSnow();
  
  var $carousel = $('#carousel');
  var $next = $('#next');
  var $previous = $('#previous');
  var $slideshow = $('#slideshow');
  var $exit = $('#exit');
  var song = new Audio('img/song.mp3');

  $exit.hide();

  $carousel.css('left', 0);

  // For next button
  $next.on('click', function () {
    var width = $('img:first').width();
    var currentPos = $carousel.css('left');
    var last_pic = $('#carousel').css("left");

    if (parseInt(last_pic) === -1224) {
        $carousel.animate({
          left: 0,});
    } else {
        $carousel.animate({
          left: parseInt(currentPos, 10) - parseInt(width, 10),});
    };
    
  });

  // For previos button
  $previous.on('click', function () {
    var width = $('img:first').width();
    var currentPos = $carousel.css('left');

    var last_pic = $('#carousel').css("left");

    if (parseInt(last_pic) === 0) {
        $carousel.animate({
          left: -1224,});
    } else {
        $carousel.animate({
          left: parseInt(currentPos, 10) + parseInt(width, 10),});
    };

  });


  // for fullscreen's button and exit button
  $slideshow.on('click', function () {
    $(document).fullScreen(true);
    $exit.show();
    $slideshow.hide();
    song.play();
    snowStorm.toggleSnow();
  });

  $exit.on('click', function () {
    $(document).fullScreen(false);
    $exit.hide();
    $slideshow.show();
    song.pause();
    snowStorm.toggleSnow()
  });


});