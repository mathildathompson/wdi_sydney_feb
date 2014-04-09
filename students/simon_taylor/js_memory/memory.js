//------------------------------------------------------------------------------
// SETUP VARIABLES
//------------------------------------------------------------------------------

//Time that increments in the game
var timerID = 0,
    time = 0;

var $timer

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

//to store the game element
var $game

//to store all cards
var $cards;

//last card you clicked on
var $lastCard;

//------------------------------------------------------------------------------
// EVENT HANDLER CODE
//------------------------------------------------------------------------------

//Code In Here gets executed once code is ready. ie hovering, clicking events//
$(document).ready(function () {

  $timer = $('#timer');

  var $controls = $('#controls');

  $game = $('#game');

  $controls.on('click','input',function (event) {

    //get the game size from the buttons id
    var gameSize = $(this).attr('id');

    //a game is already in progress so reset first
    if ($game.children().length > 0) { reset(); }
    
    //run start game and pass in the game size
    startGame(gameSize);

    //setup the game timer
    startTime();
  });

});

//START EVENT HANDLERS FOR OUR CARDS
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

//INITIALIZES THE GAME AND GENERATES THE BOARD
var startGame = function (gameSize) {
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
  letters = _.shuffle(letters);

  //find the #game div to append our cards (columns) to
  // $game = $('#game');

  _.each(letters, function (letter,index) {
    $game.append('<div class="column" id="' + index + '"></div>');
    // console.log(letter,index)
  });

  $cards = $('.column');

  cardEventsInit();
  
}

// FLIP THE CARD AND CHECK FOR A MATCH
var cardClick = function ($card) {
  //get the id from the clicked card
  cardID = $card.attr('id');
  //find the letter associated with that card from our array
  letter = letters[cardID];
  //display the letter for the clicked card
  $card.text(letter);

  //if the lastCard is defined (it's not the first click)
  if ($lastCard !== undefined) { checkMatch($card, letter); }

  //set global variables for next click
  $lastCard = $card;

}

//CHECK TO SEE IF THERE IS A SUCCESSFUL MATCH
var checkMatch = function ($card, letter) {
  //get the id from the previous clicked card
  var lastCardID = $lastCard.attr('id');
  //find the letter associated with the previous clicked card from our array
  var lastLetter = letters[lastCardID];

  //this was a correct match
  if (letter === lastLetter) {
    //add the found class and remove the click event handlers
    $card.addClass('found').unbind('click');
    $lastCard.addClass('found').unbind('click');
  //the match was not correct and the previous card was NOT 'found'
  } else if ($lastCard.hasClass('found') === false) {
    $lastCard.text("");
  }
  //check to see if the user has won
  checkWin();
};


//CHECK TO SEE IF THE PLAYER HAS WON
var checkWin = function () {

  //check if they have been revealed
  var foundCards = _.select($cards, function(card) { return $(card).hasClass('found'); });
  //check if found cards = 
  if (foundCards.length === letters.length) {
    //stop the timer
    stopTimer();
    //remove the foudn class from all cards
    $cards.removeClass('found');
    //add the won class to all cards
    $cards.addClass('won');
    //return true for success
    return true;
  } else {
    //return fals for failure
    return false;
  }
};

//RESET THE GAME SO A NEW GAME CAN BE STARTED
var reset = function () {
  //delete all cards
  $game.empty();
  //stop the timer
  stopTimer();
  //remove the timer text
  $timer.text("");
};

//------------------------------------------------------------------------------
// TIMERS
//------------------------------------------------------------------------------

//Start the timer
var startTime = function () {
  $timer.text("Game Time: 0")
  timerID = window.setInterval(updateTime, 1000);
}

//Increment the timer and display the new time
var updateTime = function () {
  $timer.text(["Game Time:",++time].join(' '));
}

var stopTimer = function () {
  time = 0;
  clearInterval(timerID);
};