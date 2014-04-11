//Global Variables
$(document).ready(function () {
  //Time that increments in the game
      time = 0;
  var correctCardCounter = 0;

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
  $(function() {
    
    
    $("#controls").on('click', '#small', function(){
      startGame(lettersSmall);
    });

    $("#controls").on('click', '#medium', function(){
      startGame(lettersMedium);
    });

    $("#controls").on('click', '#large', function(){
      startGame(lettersLarge);
    });
    // card click actions
    $("#game").on("click", "div", function(){
      cardClick(this);
    });
    

    // hover

    $("#game").on("hover", "div", function(){
      $(this).toggleClass("hover");
    });

  });

  // Initializes the game and creates the board
  function startGame(letters_array) {
   // the following reset the game if it has previously been played
    $("#game div").removeClass("won");
    correctCardCounter = 0;
    time = 0;

    // Now we start the new game
    
    $game = $('#game')
    $game.html("");
    letters = _.shuffle(letters_array);
    _.each(letters, function(letter, index){
      $game.append("<div class='column' id='" + index + "'></div>");
    });
    startTime();
  }

  // Flips a card and checks for a match
  function cardClick(div) {
    
    var divId = div.id
    var letter = letters[divId];
    
    $("#" + divId).text(letter);
    if (lastId !== divId) {
      if (letter === lastCard) {
        $("#" + lastId).removeAttr("id");
        $("#" + divId).removeAttr("id");
        correctCardCounter = correctCardCounter + 2;
      }
    }
    if (letters.length === correctCardCounter) {
      win();
    }

    $("#" + lastId).text("");
    lastId = divId;
    lastCard = letter;
  }

  function win() {
    console.log("you win!");
    $("#game div").addClass("won");
    clearInterval(timeClock);
  }
  //Start the timer
  function startTime() {
    timeClock = setInterval(function() {
      time++
      var seconds = time % 60;
      var minutes = Math.floor(time / 60);
      var hours = Math.floor(minutes / 60);
      $('#timer').html(hours + "h " + minutes + "m " + seconds + " s")
    }, 1000);
  };

  
});