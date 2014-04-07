$(document).ready(function () {

  //carousel

  var $carousel = $('#carousel');
  var $yes = $('#yes');
  var $no = $('#no');
  var $box = $('.carousel-direction');
  var captionNo = 0;
  
  var captions = ['Nice work. Rise my minion!','Go forth for delicious braaaaains','Jesus! Zombie wants to be a human again?','That WOULD be nice', 'But Jesus prefers cats','Welcome to eternity']
  $carousel.css('left', 0);
   
// game logic

var list = ['mangoes', 'peaches', 'oranges'];
var chances = 8;
var guesses = [];
var board = [];
var word = list[Math.floor((Math.random()*3)+0)];

$(boardSetup = function(){
  for(i=0; i<word.length; i++){
    board.push(" _ ")
  }
  drawBoard();

  $('#chances').text("You have " + chances + " chances left for resurrection.");
});

$("form.guessBox").submit(function() {
  letter = $("input:first").val().toLowerCase();
  $('input[type="text"]').val('');

  if(validateGuess(letter) == true){
    wordHas(letter);
  }
  drawBoard();
  gameEnd();
  return false;
});

function drawBoard(){
  $('#board').text(board.join(" "));
  $('#chances').text("There are only " + chances + " more spells left.");
};

function validateGuess(letter){
  if(guesses.indexOf(letter) !== -1){
    alert("You've already guessed this");}
  else if(letter.length > 1){
    alert("Please enter one letter from a-z");}
  else if(letter.match(/[^a-zA-Z\d\s:]/)){
    alert("Please pick a letter from a-z");}
  else if(letter == "" || letter == " "){
    alert("Please pick a letter from a-z");}
  else {
    guesses.push(letter);
    $('#guesses').text(guesses.join(", "))
    return true;

  }
};
var captionNo = 0;
function wordHas(letter){
  correct = false;
  for(i=0; i<word.length; i++){
    if(word[i] == letter){
      putOnBoard(letter, i);
      var width = $('img:first').width();
      var currentPos = $carousel.css('left');
      if(captionNo < 6){
        $carousel.animate({
            left: parseInt(currentPos, 10) - parseInt(width, 10)

          });
      };  
      $('#messages').text(captions[captionNo]);
      captionNo++;
      if (captionNo > 2) {
        $('#necrojesus_img').attr('src',"img/flyjesus.gif");
      };
      if (captionNo > 4) {
        $('#necrojesus_img').attr('src',"img/nojesus.jpg");
      };
       if (captionNo > 5) {
        $('#necrojesus_img').attr('src',"img/flyjesus.gif");
      };
     
      correct = true;
    }
  }
  if(correct == false) {
    chances--;
  }
};



function putOnBoard(letter, letterIndex){
  board[letterIndex] = letter;
};

function gameEnd(){
  if(board.indexOf(' _ ') == -1){
    alert('Congratulations! You win.');
    $('.img').attr('src',"img/ball-cat-dance.gif");
    
  }
  else if(chances == 0){
    alert("Sorry, you've lost. The word was " + word + ". You are now a zombie forever");
    $('#necrojesus_img').attr('src',"img/sad.jpg");
  }
};

});