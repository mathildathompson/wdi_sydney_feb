$(document).ready(function(){
 	var country_template = $('#country').html();
 	var template = Handlebars.compile(country_template);
 	var counter = 0;

 	var displayFirstFlags = function(){
 		$.getJSON('/countries/' + 15 + '/' + counter, function(data){
	 	  	var html = template({countries: data});
	 	  	$('#content').append(html);
	 	});
 	}

 	displayFirstFlags();

 	//Display flags per groups of 10.
 	var displayCountries = function(){
	 	$.getJSON('/countries/' + 10 + '/' + counter, function(data){
	 	  	var html = template({countries: data});
	 	  	$('#content').append(html);
	 		counter = counter + 5;
	 	});
	};

	//Infinite scroll
 	$(window).scroll(_.throttle(function(){
 	 	displayCountries(),
 	 	console.log("Hello")
 	}, 1000));

 	var $buttonOn = true;

 	//Display all the flags at once.
 	var showAllFlags = function(){
 	 	$('button').click(function(){
 	 		if($buttonOn === true){
 	 			$buttonOn = false; //Goes from show all to hide all.
 	 			$('button').html('Hide all flags')
 	 			//Should show the flags only when the user clicked on the button.
 	 			$.getJSON('/countries', function(data){
	 	  			var html = template({countries: data});
	 	  			$('#content').append(html);
	 			});
 	 		} else if($buttonOn === false) {
 	 			$buttonOn = true;
 	 			//Fades out all flags when click on Hide all.
 	 			$('.single_country').fadeOut()
 	 			$('button').html("Show all flags");
 	 		}
 	 	});
 	}

 	showAllFlags();

 	// $.getJSON('/countries.json', function(data){
 	// 	var html = template({countries: data});
 	// 	$('#content').append(html);
 	// 	console.log(data)
 	// });
});