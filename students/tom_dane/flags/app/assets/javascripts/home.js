
$(document).ready(function() {
    
   var step = 0 
   var offset = 10            
   var populateCountries = function () {  
      // Build our template function with the template from application.html.erb
      var post_template = $('#country').html();
      var template = Handlebars.compile( post_template );

      // Fetch JSON version of the post and show it on the page.
      // $.getJSON('/json', function (data) {
      //   var html = template( {country: data} ); // Magic.
      //   $('#content').append( html ); // Shove it in the page.
      // });

    $.getJSON('/countries/' + step + '/' + offset, function (data) {
        var html = template( {country: data} ); // Magic.
        $('#content').append( html ); // Shove it in the page.
        step = step + 10
        offset = offset + 5
      });
    }

    $(window).scroll(function () {
        var $window = $(window);
        if($window.height() + $window.scrollTop() >= $(document).height()) {
          populateCountries();
        }
     });
    populateCountries();
});

