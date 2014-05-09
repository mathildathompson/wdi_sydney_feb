// $(document).ready(function () {

//   // Build our template function with the template from application.html.erb
//   var country_template = $('#country').html();
//   var template = Handlebars.compile( country_template );

//   // Fetch JSON version of the post and show it on the page.
//   $.getJSON('/countries.json', function (data) {
//     var html = template( {posts: data} ); // Magic.
//     $('#countries_container').append( html ); // Shove it in the page.
//   });
// });