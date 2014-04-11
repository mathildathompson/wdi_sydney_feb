$(document).ready(function (){

	var words = ['beagle', 'pug', 'daschund', 'kelpie'];
	var correctGuess = [];
	var incorrectGuess = [];

	var selectWord = function () {
		selectedWord = _.sample(words).split('');

	};

	var $guess = $('#guess');

	$('.guess').on('change', function () {
		letter = $(this).val();
		$(this).val('');
		console.log(letter);
		
		if (_.contains(selectedWord, letter)) {
			alert('boo');
			correctGuess.push(letter);
			console.log(correctGuess);
			output = (
			(i = 0; i < selectedWord.length; i++){
				if (selectedWord[i] === letter){
					return letter
				} else {
					return '_'
				}
			};

		} else {
			alert('poo');
			incorrectGuess.push(letter);
			console.log(incorrectGuess);
		};
	});
	selectWord();
	console.log(selectedWord);
	console.log(output);


});





// <div class="guesses">Enter a letter to start</div>
//     <input id="guess" type="text" placeholder="enter a letter" />
//     <input id="giveUp" type="button" value="Give up" />
//     <input id="reset" type="button" value="Reset" />