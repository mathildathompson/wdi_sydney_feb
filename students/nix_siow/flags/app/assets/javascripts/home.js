$(document).ready(function() {

  var populateCountries = function () {

    // Build our template function with the template from application.html.erb
    var flag_template = $('#flag').html();
    var template = Handlebars.compile( flag_template );

    // Fetch JSON version of the country and show it on the page.
    $.getJSON('/countries/' + step + '/' + offset, function (data) {

      if (offset === 830) {
        offset = 0
      } else {
        offset = offset + 10;
      };
      console.log(offset);
      
      var html = template( {flags: data} ); // Magic.
      $('#content').append( html ); // Shove it in the page.
    });
  };


  $(window).scroll(function () {
    var $window = $(window);
   if($window.height() + $window.scrollTop() >= $(document).height()) {
      populateCountries();
   }
  });



  // listen to btn all fetch all countries
  $('#btnAllCountries').click(function(event) {
    event.preventDefault();

    // Build our template function with the template from application.html.erb
    var flag_template = $('#flag').html();
    var template = Handlebars.compile( flag_template );

    // Fetch JSON version of the country and show it on the page.
    $.getJSON('/countries.json', function (data) {
      console.log(data);

    var html = template( {flags: data} ); // Magic.
    $('#content').append( html ); // Shove it in the page.
    });
  });



  var step = 10;
  var offset = 0;

  // listen to btn all fetch all countries
  $('#btnNext10Countries').click(function(e) {
    e.preventDefault();

    // Build our template function with the template from application.html.erb
    var flag_template = $('#flag').html();
    var template = Handlebars.compile( flag_template );

    // Fetch JSON version of the country and show it on the page.
    $.getJSON('/countries/' + step + '/' + offset, function (data) {
      offset = offset + 10;

      var html = template( {flags: data} ); // Magic.
      $('#content').append( html ); // Shove it in the page.
    });
  });


});
