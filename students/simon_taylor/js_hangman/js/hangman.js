$(document).ready(function(){

  //---------------------------------
  // VARIABLES
  //---------------------------------

  //an array of word options
  var wordOptions = ['array', 'argument', 'boolean', 'call', 'closure', 'code', 'constant', 'constructor', 'convert', 'compile', 'datatype', 'derive', 'engine', 'error', 'exception', 'execute', 'expression', 'falsy', 'function', 'identifier', 'implement', 'immutable', 'infinity', 'instance', 'internal', 'list', 'method', 'mutable', 'null', 'number', 'object', 'operand', 'operator', 'parameter', 'pass', 'program', 'property', 'prototype', 'recursion', 'reference', 'run', 'runtime', 'scope', 'script', 'statement', 'string', 'syntax', 'truthy', 'type', 'undefined', 'value', 'variable'];

  //find the needed elements
  var $img = $('img.hangman');
  //provides feedback to the user
  var $messages = $('p.messages');
  //to display guesses remaining
  var $guessRem = $('p.guesses-rem');
  //displays the guesses the user has already made
  var $guessDisplay = $('p.guesses');
  //submits a new guess
  var $guessBtn = $('button.guess-btn');
  //displays the current word with _'s replacing missing letters
  var $displayWord = $('h2.display');
  //button to start a new game
  var $resetBtn = $('button.reset-btn');

  //setup our variables to store guesses and guesses remaining
  var letterGuesses = [];
  //maximum guesses allowed before losing the game
  var guessesStart = 6;
  //how many guesses the user has left
  var guessesRem;

  //setup our variables for the current word
  var word;
  var letterArray;

  //---------------------------------
  // FUNCTIONS
  //---------------------------------

  var newWord = function (wordInput) {
    word = wordInput;
    letterArray = word.split('');
  };

  var newGame = function () {
    console.log("setting up the game");

    //randomly select a new word
    newWord(_.sample(wordOptions));

    //reset the guesses
    letterGuesses = [];
    //reset guesses remaining
    guessesRem = guessesStart;

    //hide the guesses display element
    $guessDisplay.addClass('hidden');
    //clear input box
    $('#guess-input').val("");
    //reset the welcome message
    $messages.text("Welcome to Hangman!");

    //update the starting display
    display();
  };
  
  var guess = function (letter) {

    //to store the eventual output message
    var message;

    //convert the guess to lower case
    letter = letter.toLowerCase();

    //repeat guess
    if (_.indexOf(letterGuesses,letter) !== -1) {
      //tell the user they are stupid!
      $messages.text(["You've already guessed the letter \"",letter,"\" numbnuts!"].join(""));
    //correct guess
    } else if (_.indexOf(letterArray,letter) !== -1) {
      //tell the user their guess was correct
      $messages.text(["Good Guess, the letter \"",letter,"\" is in the word!"].join(""));
      //add the guess to the letterGuesses array
      letterGuesses.push(letter);
    //incorrect guess
    } else {
      //tell the user their guess was incorrect
      $messages.text(["Bad Guess, the letter \"",letter,"\" is not in the word!"].join(""));
      //reduce remaining guesses by 1
      guessesRem--;
      //add the guess to the letterGuesses array
      letterGuesses.push(letter);
    }

    //if their guesses contains all letters in the word they win
    if (hasWon()) {
      $messages.text("YOU WIN!");
    //otherwise if they've run out of guesses they lose
    } else if (guessesRem === 0) {
      $messages.text("YOU LOSE!" );
    }

    // update the display
    display();
  };

  var display = function () {

    //create an empty array to store output
    var output = [];

    //user run out of guesses or has won
    if (guessesRem === 0 || hasWon()) {
      //so just display the word
      output = letterArray;
    //user hasn't won or run out of guesses
    } else {
      //loop through each letter in the word
      _.each(letterArray, function(letter){ 
        //if it has not been guessed replace it with an "_"
        if (_.indexOf(letterGuesses,letter) === -1) {
          output.push("_"); 
        //if it is guessed, leave the letter as it is
        } else {
          output.push(letter); 
        }
      });
    }

    //update the display to show the word
    $displayWord.text(output.join(' '));

    //update the guesses remaining
    $guessRem.text(["You have ",guessesRem," guesses remaining"].join(''));

    //update the hangman image
    imgDisplay();

    //unhide the guesses displayed if more than one valid guess has happened
    if (letterGuesses.length > 0) { $guessDisplay.removeClass('hidden'); }

    //update the guesses display
    $guessDisplay.text("You have guessed: " + letterGuesses.join(', '));
  };

  var imgDisplay = function () {
    //determine our new image url
    var imageUrl = ['img\\Hangman-',(guessesStart - guessesRem),'.png'].join('');
    //log that the image is updated
    console.log("update image to use url " + imageUrl);
    //update our image
    $img.attr("src",imageUrl);
  };

  //---------------------------------
  // EVENT HANDLERS
  //---------------------------------

  $guessBtn.on('click', function ( event ){
    //prevent standard form submit behaviour
    event.preventDefault();
    //grab the input box content
    var $guessInput = $('#guess-input').val();

    //out of guesses
    if (hasWon()) {
      $messages.text("You've already won idiot! Click \"Reset Game\" to play again!");
    } else if (guessesRem === 0) {
      $messages.text("Sorry but you're out of guesses, click \"Reset Game\" to play again!");
    //guess is valid
    } else if (isValidGuess($guessInput)) {
      //guess the letter
      guess($guessInput);
    //guess is invalid
    } else {
      //set error message text
      $messages.text("You must input a single letter from A-Z");
    }

    //clear the input box
    $('#guess-input').val("");

  });

  $resetBtn.on('click', function () {
    newGame();
  });

  //---------------------------------
  // VALIDATION FUNCTIONS
  //---------------------------------

  //checks if a guess is valid (must be single character that is A-z)
  var isValidGuess = function (guess) {
    return /\b[A-z]\b/.test(guess);
  };

  //---------------------------------
  // HELPER FUNCTIONS
  //---------------------------------

  //function to check if array2 contains all of the elements in array1
  var hasWon = function () {
    //get the delta between each array using underscore function
    var deltaArr = _.difference(letterArray, letterGuesses);
    //return true if there are no deltas
    return (deltaArr.length === 0);
  };

  //---------------------------------
  // LAUNNCH THE GAME
  //---------------------------------

  newGame();

  // debugger;

});