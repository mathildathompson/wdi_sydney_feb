//Global Variables

//Time that increments in the game
var timerId = 0,
    time = 0;

//arrays with letters in them.
var lettersSmall  = ['A', 'A', 'B', 'B', 'C', 'C', 'D', 'D', 'E', 'E'],
    lettersMedium = ['A', 'A', 'B', 'B', 'C', 'C', 'D', 'D', 'E', 'E',
                     'F', 'F', 'G', 'G', 'H', 'H', 'I', 'I', 'J', 'J'],
    lettersLarge  = ['A', 'A', 'B', 'B', 'C', 'C', 'D', 'D', 'E', 'E',
                     'F', 'F', 'G', 'G', 'H', 'H', 'I', 'I', 'J', 'J',
                     'K', 'K', 'L', 'L', 'M', 'M', 'N', 'N', 'O', 'O',
                     'P', 'P', 'Q', 'Q', 'R', 'R', 'S', 'S', 'T', 'T'];

//array of letters. will change based on size of game.
var letters;

//last card/letter you clicked on. comes from the letter divs.
var lastId = '',
    lastCard = '';

//Code In Here gets executed once code is ready. ie hovering, clicking events//
$(document).ready(function() {

	var $small = ('#small');
	var $medium = ('#medium');
	var $large = ('#large');

	// Initializes the game and creates the board
	function startGame() {
		$(small).on('click', function(){
			$('#game .column').hide()
			shuffleSmall = _.shuffle(lettersSmall)
			startTime();
			
			$.each(shuffleSmall, function(index, letter){
				$('body #game').append('<div id="' + index + '" class="column"><p>' + letter + '</p></div>')
				console.log(index, 'p')
				$('p').hide();

				$('.column').on('mouseenter', function(){
					$(this).css("background-color", "#A6977B")
				});

				$('.column').on('mouseleave', function(){
					$(this).css("background-color", "white")
				});

				var letters = [];
				$('.column').on('click', function(){
						var card = $(this).find('p').show();
						var letterCard = card.html();
						letters.push(letterCard);
	
						$.each(letters, function(index, value){
							console.log(index, value)
							$(this).find('p').show()

							if(letters[index] === letters[index+1]){
							  	$(this).find('p').show()
							} else{
								$(this).find('p').hide()
								// $('p').hide()
							}
						});
				});
			});
		});

		$(medium).on('click', function(event){
			$('#game .column').hide()
			shuffleMedium = _.shuffle(lettersMedium)

			$.each(shuffleMedium, function(index, letter){
				$('body #game').append('<div id="' + index + '" class="column"><p>' + letter + '</p></div>')
				$('p').hide();

				$('.column').on('mouseenter', function(){
					$(this).css("background-color", "#A6977B")
				});

				$('.column').on('mouseleave', function(){
					$(this).css("background-color", "white")
				});

				$('.column').on('click', function(){
					$(this).find('p').show();
				});
			});
		});

		$(large).on('click', function(event){
			$('#game .column').hide()
			shuffleLarge = _.shuffle(lettersLarge)

			$.each(shuffleLarge, function(index, letter){
				$('body #game').append('<div id="' + index + '" class="column"><p>' + letter + '</p></div>')
				$('p').hide()

				$('.column').on('mouseenter', function(){
					$(this).css("background-color", "#A6977B")
				});

				$('.column').on('mouseleave', function(){
					$(this).css("background-color", "white")
				});

				$('.column').on('click', function(){
					$(this).find('p').show();
				});
			});
		});
	}

	startGame();

// Flips a card and checks for a match
function cardClick() {

}

//Add hoverclass to cards.
function hovering() {

}

//Start the timer
function startTime() {
	clearInterval(timer);
	var counter = 0;
	var timer = setInterval(function(){
		$('#timer').html("Timer: " + counter);
		counter++;
	},1000);
}

//Increment the timer and display the new time
function updateTime() {
	clearInterval(timer);
	var counter = 0;
	var timer = setInterval(function(){
		$('#timer').html("Timer: " + counter);
		counter++;
	},1000);
}

});