$(document).ready(function () {

  // Build our template function with the template from application.html.erb
  var country_template = $('#country').html();
  var template = Handlebars.compile( country_template );

  getAll = function(){
    // Fetch JSON version of the post and show it on the page.
    $.getJSON('/countries.json', function (data) {
      console.log(data)
      var html = template( {countries: data} ); // Magic.
      $('#content').append( html ); // Shove it in the page.
    });
  };

  getSome = function(){
    // Fetch JSON version of the post and show it on the page.
    $.getJSON('/countries/5.json', function (data) {
      var html = template( {countries: data} ); // Magic.
      $('#content').append( html ); // Shove it in the page.
    });
  };

  getSomeFrom = function(number){
    var currentCountries = $('.ajax').length;
    console.log(currentCountries);
    // Fetch JSON version of the post and show it on the page.
    $.getJSON('/countries/' + number + '/' + currentCountries + '.json', function (data) {
      var html = template( {countries: data} ); // Magic.
      $('#content').append( html ); // Shove it in the page.
    });
  };

  getNone = function(){
    $('#content').html(''); // Shove it in the page.
  };

  getHighestID = function(){
    // create an array
    var countryIDs = [];
    // for each element with class .ajax
    $('.ajax').each(
      function(){
      // add it to the array
        countryIDs.push(
          parseInt( $(this).attr('id') )
          );
       });
    // find the max value in the array
    highestID = Math.max.apply( Math, countryIDs );
    console.log(highestID);
  }

  
  
  

  $('#get-all').on('click', function(){
    getAll();
  })
  $('#get-5').on('click', function(){
    getSome(5);
  })
  $('#get-next5').on('click', function(){
    getSomeFrom(5);
  })  
  $('#get-none').on('click', function(){
    getNone();
  })

});