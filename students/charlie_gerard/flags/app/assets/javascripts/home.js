$(document).ready(function() {

  var populateCountries = function () {
    console.log('fetching countries');
  };

  $(window).scroll(function () {
    var $window = $(window);
//    if($window.height() + $window.scrollTop() >= $(document).height()) {
      populateCountries();
//    }
  });

});
