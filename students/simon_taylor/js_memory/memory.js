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
var lastID = '',
    lastLetter = '';

var $lastCard;

//------------------------------------------------------------------------------
// EVENT HANDLER CODE
//------------------------------------------------------------------------------

//Code In Here gets executed once code is ready. ie hovering, clicking events//
$(document).ready(function () {
  var $controls = $('#controls');

  $controls.on('click','input',function (event) {

    //get the game size from the buttons id
    var gameSize = $(this).attr('id');
    
    //run start game and pass in the game size
    startGame(gameSize);
  });

});

var cardEventsInit = function () {
  //find all the cards (columns)
  var $cards = $('.column');

  //add a hover event handler to toggle the 'hover class'
  $cards.hover(function () {
    $(this).addClass('hover');
  }, function() {
    $(this).removeClass('hover');
  });

  $cards.on('click',function () {
    //your code here (can use 'event' variable to target element)
    card = $(this);
    //run the card click function
    cardClick(card);
  });

};

//------------------------------------------------------------------------------
// GAME FUNCTIONS
//------------------------------------------------------------------------------

// Initializes the game and creates the board
function startGame(gameSize) {
  //get the id attribute from the button clicked

  switch (gameSize) {
    case 'small':
      letters = lettersSmall;
      break;
    case 'medium':
      letters = lettersMedium;
      break;
    case 'large':
      letters = lettersLarge;
      break;
  }

  //shuffle the letters
  // letters = _.shuffle(letters);

  //find the #game div to append our cards (columns) to
  var $game = $('#game');

  _.each(letters, function (letter,index) {
    $game.append('<div class="column" id="' + index + '"></div>');
    // console.log(letter,index)
  });

  cardEventsInit();
  
}

// Flips a card and checks for a match
function cardClick($card) {
  //get the id from the clicked card
  cardID = $card.attr('id');
  //find the letter associated with that card from our array
  letter = letters[cardID];
  //display the letter for the clicked card
  $card.text(letter);

  //if the lastID is not empty (it's not the first click)
  if (lastID !== '') { checkMatch(letter, $card); }

  //set global variables for next click
  lastID = cardID;
  lastLetter = letter;

}

var checkMatch = function (letter, $card) {
  //find the last card node
  $lastCard = $('#' + lastID);
  //update the clicked card with the relevant letter from the letters array

  //this was a correct match
  if (letter === lastLetter) {
    //add the found class and remove the click event handlers
    $card.addClass('found').unbind('click');
    $lastCard.addClass('found').unbind('click');
  //the match was not correct and the previous card was NOT 'found'
  } else if ($lastCard.hasClass('found') === false) {
    $lastCard.text("");
  }

};

//Start the timer
function startTime() {

}

//Increment the timer and display the new time
function updateTime() {

}