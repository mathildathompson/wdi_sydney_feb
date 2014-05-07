$(document).ready(function () {
  var $searchBtn = $('#search-btn');
  var $searchText = $('#search-text');
  var $movie = $('#movie');

  //to store the json data from OMDB API
  var movieData;

  //fetch html code from the index.html page
  var templateHTML = $('#task_template').html();
  //create function to generate html using movieData
  var htmlGenerator = _.template(templateHTML);

  var page = {
    display: function () {
      //delete all elements in the current movie div
      $movie.empty();
      //check if movie data exists
      if (movieData !== undefined && movieData.Error !== "Movie not found!") {  
        //generate the html
        var html = htmlGenerator(movieData);
        //append html to the movies div
        $movie.append(html);
      } else {
        //append not found message
        $movie.append('<h2 style="text-align:center;">Movie not found</h2>');  
      }
    }
  };

  // page.display();

  $searchBtn.on('click', function (event) {
    //prevent default form submit
    event.preventDefault();
    //perform ajax request
    var request = $.ajax({
      type: 'GET',
      dataType: 'json',
      url: 'http://www.omdbapi.com/', //?i=&t=cloudy+with+a+chance+of+meatballs',
      data: { t: $searchText.val() }
    //what to do on success
    }).done(function (data) {
      console.log(data);
      //save the movie data in our variable
      movieData = data;
      //update the page
      page.display();
    });
  });
});