$(document).ready(function(){

  //---------------------------------
  // VARIABLES
  //---------------------------------

  //an array of word options
  var wordOptions = ['array', 'argument', 'boolean', 'call', 'closure', 'code', 'constant', 'constructor', 'convert', 'compile', 'datatype', 'derive', 'engine', 'error', 'exception', 'execute', 'expression', 'falsy', 'function', 'identifier', 'implement', 'immutable', 'infinity', 'instance', 'internal', 'list', 'method', 'mutable', 'null', 'number', 'object', 'operand', 'operator', 'parameter', 'pass', 'program', 'property', 'prototype', 'recursion', 'reference', 'run', 'runtime', 'scope', 'script', 'statement', 'string', 'syntax', 'truthy', 'type', 'undefined', 'value', 'variable'];

  //find the needed elements
  var $displayWord = $('.display');
  var $guessBtn = $('.guess-btn');
  var $guessDisplay = $('.guesses');

  //setup our variables to store guesses and guesses remaining
  var letterGuesses = [];
  var guessesRem = 5;

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
  
  var guess = function (letter) {
    //SHOULD ONLY REDUCE GUESSES IF INCORRECT!
    //reduce no. of guesses by 1
    guessesRem--;
    console.log(['You guessed "',letter,'", you have ',guessesRem,' guesses remaining.'].join(''));
    // need to check for unique values
    letterGuesses.push(letter);
    // update the display
    display();
  };

  var display = function () {
    //create an empty array to store output
    var output = [];

    //loop through each letter in the word
    _.each(letterArray, function(letter){ 
      //if it's not guessed replace it with an "_"
      if (_.indexOf(letterGuesses,letter) === -1) {
        output.push("_"); 
      //if it is guessed, leave the letter
      } else {
        output.push(letter); 
      }

    });

    //for debugging log the array to be displayed
    console.log(output);

    //update the display to show the word
    $displayWord.text(output.join(' '));

    //update the guesses display
    $guessDisplay.text("You have guessed: " + letterGuesses.join(', '));
  };

  //---------------------------------
  // EVENT HANDLERS
  //---------------------------------

  $guessBtn.on('click', function (){
    console.log("Click on guess button registered");
    //grab the input box content
    var $guessInput = $('#guess-input').val();
    console.log($guessInput);
    //guess the letter
    guess($guessInput);
    //clear the input box
    $('#guess-input').val("");
  });

  //---------------------------------
  // TESTING ONLY CODE
  //---------------------------------

  //setup a new sample word for testing
  newWord(_.sample(wordOptions));
  //update the starting display
  display();

  // debugger;
  debugMe = function () {
    debugger;
  };
});