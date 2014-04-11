$(document).ready(function (){

	var words = ['beagle', 'pug', 'daschund', 'kelpie'];	
	var $guess = $('#guess');
	var $guesses = $('#guesses');
	var $solution = $('#solution h1');
	var $startAgain = $('#startAgain');
	var correctGuess = [];
	var incorrectGuess = [];

	var startGame = function(){
		correctGuess = [];
		incorrectGuess.length = 0;
		
		// check the .guess(letter) against the selectedWord[letters] - if it is in the selectedWord then add to the correct array, if not, add to the incorrect array
		var matchLetter = function(letter){
			if (_.contains(selectedWord, letter)) {
				correctGuess.push(letter);
				showSolution(correctGuess);
			} else {
				incorrectGuess.push(letter);
				$('#guesses').html('Incorrect guesses: ' + incorrectGuess);
			};		
		}; //end matchLetter

		var showSolution = function(correctGuess){
			console.log(correctGuess)
			$solution.html('')
			$.each(selectedWord, function( index, letter ) {
	  		if (_.contains(correctGuess, letter)){
					$solution.append(letter + ' ');	
				} else {
					$solution.append(' _ ');	
				};
			});
		}; //end showSolution

		//set up all the listeners
		//enter a letter as a guess
		$guess.keyup(function () {
			var letter = $(this).val();
			$(this).val('');
			matchLetter(letter);
		}); //end guess listener

		selectedWord = _.sample(words).split('');
		showSolution('');

	}; //end startGame
	
	//start new game
	$startAgain.on('click', function(){
		$guesses.html('No incorrect guesses... yet');
		startGame();
	});
	
	startGame();

});