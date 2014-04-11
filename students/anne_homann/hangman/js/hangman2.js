var word = {
  secretWord: "",
  wordList: ['beagle', 'pug', 'daschund', 'corgi', 'kelpie', 'spaniel', 'maltese', 'poodle', 'labrador', 'whippet', 'dalmatian', 'boxer', 'bulldog'],
  wordProgress: [],
  secretWordArray: [],
  totalMisses: [],
  allGuesses: [],

  setSecretWord: function(){
    this.secretWord = new String(_.sample(this.wordList, [1]));
    this.secretWordArray = this.secretWord.split('');
    for (i = 0; i < this.secretWordArray.length; i = i + 1){
      this.wordProgress.push("_");
    }
    document.getElementById('guessesLeft').innerHTML = player.MAX_GUESSES;
    document.getElementById('wordString').innerHTML = this.wordProgress.join(" ");
    document.getElementById('guessedLetters').innerHTML = "";   
  },

  checkLetters: function(letter){
    if (_.contains(this.secretWordArray,letter)){
      for (i = 0; i < this.secretWordArray.length; i = i + 1){
        if (this.secretWordArray[i] === letter) {
          this.wordProgress[i] = letter;
        }
      }
    } else {
      this.totalMisses.push(letter);
      game.updateDisplay("guessesLeft");
    }
    game.updateDisplay("secretWordWithBlanks");
  }
};

var player = {
  MAX_GUESSES: 8,
  guessedLetters: [],

  makeGuess: function(letter){
    this.guessedLetters.push(letter);
    word.checkLetters(letter);
    this.checkLose();
    this.checkWin();
  },
    
  checkWin: function(wordString){
      if (_.contains(word.wordProgress,"_")){
      return false;
    } else {
      game.updateDisplay("secretWordWithBlanks");
      setTimeout(function(){alert('You won!')},500);
    }
  },

  checkLose: function(wrongLetters){
    if (word.totalMisses.length >= this.MAX_GUESSES){
      alert('You lose - try again');
      game.updateDisplay("revealSecretWord");
    }
  }
};

var game = {
  resetGame: function(){
    if (confirm("Are you sure?")){
      word.totalMisses = [];
      word.guessedLetters = [];
      word.allGuesses = [];
      word.wordProgress = [];
      player.MAX_GUESSES = 8;
      word.setSecretWord();
  }
  },

  giveUp: function(){
    alert("Better luck next time");
    game.updateDisplay("revealSecretWord");
},

  updateDisplay: function(whatToUpdate){
    var guessesLeft = document.getElementById('guessesLeft');
    var lettersGuessed = document.getElementById('guessedLetters');
    var secretWordHTML = document.getElementById('wordString');

    if (whatToUpdate === "guessedLetters") {
    lettersGuessed.innerHTML = word.allGuesses.join(" ");
    } else if (whatToUpdate === "guessesLeft") {
      guessesLeft.innerHTML = (player.MAX_GUESSES - word.totalMisses.length);
    } else if (whatToUpdate === "secretWordWithBlanks"){
      secretWordHTML.innerHTML = word.wordProgress.join(" ");
    } else if (whatToUpdate === "revealSecretWord"){
      secretWordHTML.innerHTML = word.secretWordArray.join(" ");
    }  
  }
};

function checkInput(input){
  currentGuess = "";
  if (input.length === 1){
    if (input.match(/[^a-z]/)) {
      updateError("symbols");
    }else{
      word.allGuesses.push(input);
      game.updateDisplay("guessedLetters");
      currentGuess = input;
      player.makeGuess(currentGuess);
      letterField.value = null;
    }
  } else {
    updateError("tooManyChars");
  }   
};

function updateError(errorKey){
  var errorDiv = document.getElementById('errors');
  var error = "";
  if (errorKey === "tooManyChars"){
  error = setTimeout(function(){errorDiv.innerHTML = "You can only enter one character!"},1500);
  clearTimeout(error);
  } else if (errorKey === "symbols"){
  errorDiv.innerHTML = "Numbers and symbols not allowed!";  
  setTimeout(function(){errorDiv.innerHTML = ""},1500);
  }
};

window.onload = function(){
  var resetButton = document.getElementById('resetButton');
  var giveUpButton = document.getElementById('giveUpButton');
  var letterField = document.getElementById('letterField');

  word.setSecretWord();

  letterField.addEventListener('keyup', function(e) {
    if (e.keyCode === 13){
    checkInput(letterField.value.toLowerCase());
    }
  });

  resetButton.addEventListener('click', game.resetGame);
  giveUpButton.addEventListener('click', game.giveUp);
};
