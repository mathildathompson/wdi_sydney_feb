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
  var guessesStart = 6;
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
    //update the starting display
    display();
  };
  
  var guess = function (letter) {

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

    //arr 1 = word, arr2 = guesses
    if (containsArray(letterArray,letterGuesses)) {
      console.log("You win!");
    } else if (guessesRem === 0) {
      console.log("You lose!");
    }

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

    //update the display to show the word
    $displayWord.text(output.join(' '));

    //update the guesses remaining
    $guessRem.text(["You have ",guessesRem," guesses remaining"].join(''));

    //for debugging log the array to be displayed
    console.log(output);

    //update the hangman image
    imgDisplay();

    //unhide the guesses displayed
    // if ()
    $guessDisplay.removeClass('hidden');

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

  $guessBtn.on('click', function (){
    //grab the input box content
    var $guessInput = $('#guess-input').val();

    //out of guesses
    if (guessesRem === 0) {
      $messages.text("Sorry but you're out of guesses, press \"Reset Game\" to play again!");
    //guess is valid
    } else if (isValidGuess($guessInput)) {
      //guess the letter
      guess($guessInput);
      //clear the input box
      $('#guess-input').val("");
    //guess is invalid
    } else {
      //set error message text
      $messages.text("You must input a single letter from A-Z");
      //clear the input box
      $('#guess-input').val("");
    }

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
  var containsArray = function (arr1, arr2) {
    //get the delta between each array using underscore function
    var deltaArr = _.difference(arr1, arr2);
    //return true if there are no deltas
    return (deltaArr.length === 0);
  };

  //---------------------------------
  // LAUNNCH THE GAME
  //---------------------------------

  newGame();

  // debugger;

});