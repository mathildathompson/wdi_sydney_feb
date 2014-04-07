$(document).ready(function (){

	var words = ['javascript', 'processing', 'programming', 'hypertext', 'responsive'];
	var correctGuess = [];
	var incorrectGuess = [];
	var indexes = [];
	selectedWord = _.sample(words).split('');
	console.log(selectedWord);

	$('.guess').keyup(function(event) {
		letter = $(this).val();
	 	if (letter.length > 1){
	 		event.stopPropagation()
	 		// print an error message if the user input is longer than 1 character
	 		alert("You entered " + letter.length + " letters! Please try again with only one.");
	 		console.log(letter.length);
	 	} else{
	 		addGuess(letter);
	 	}
	 	$(this).val('');
	});

	var addGuess = function(singleLetter){
		if (_(selectedWord).include(singleLetter)) {
			correctGuess.push(singleLetter);
		
 			var $emptyString = $('#secretWord').empty();
 			
		 	_(selectedWord).each(function(wordLetter){
				if (_(correctGuess).include(wordLetter)){
			 		$emptyString.append('<span>' + wordLetter + '</span>');
			 	} else {
			 	 	$emptyString.append('<span> _ </span>');
			 	}
			 });
		 		
		 	//Display message when user wins by checking if there is any underscore left.
		 	/*
			 if($('#secretWord').grep('<span> _ </span>')){
			 } else {
			 	alert("You win!");
			 }
			 */
		 
		} else {
		 	incorrectGuess.push(letter);
		 	//Display the wrong guesses on the screen.
		 	var $wrongGuesses = $('#wrongGuesses').empty();
			$wrongGuesses.append('<span>' + "Incorrect guesses: " + incorrectGuess + '</span>');
		}
		//Limits the number of wrong guesses to 6
		if (incorrectGuess.length >= 6 ){
			alert("Y U NO LIKE MY GAME?!")
		}

		//Display images one by one with the index and displays it at the same location.
		_(incorrectGuess).each(function(){
			var image = $(".hangman");
			$(image[incorrectGuess.length]).show().attr("src", image[incorrectGuess.length + 1].src);
			$(image[incorrectGuess.length + 1]).css({"margin-left": -304+"px"});	
		});
	}

	//Show the whole word when the user clicks on the give up button.
	 $('#giveUp').on("click", function(){
	 	/* prints the whole word without the commas */
	 	var word = String(selectedWord).replace(/,/g,'');
	 	$revealWord = $('#secretWord').empty();
	 	$revealWord.append('<span>' + word + '</span>');
	 });

	 //Resets the game when the user clicks on the reset button.
	 $('#reset').on("click", function(){
	 	location.reload();
	 });
});
