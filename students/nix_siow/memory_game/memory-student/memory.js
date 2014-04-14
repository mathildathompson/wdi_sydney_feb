$(document).ready(function () {

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
    $('#small').on('click', function () {
        startSmallGame();
    });

    $('#medium').on('click', function () {
        startMediumGame();
    });

    $('#large').on('click', function () {
        startLargeGame();
    });


    // Initializes the game and creates the board
    var startSmallGame = function () {
        $('.game_letter').remove();
        lettersSmall = _.shuffle(lettersSmall);
        _.each(lettersSmall, function (letter, index) {
            $('#game').append("<div id='" + index + "' class='game_letter'><span>" + letter + "</span></div>");
        });
        $('span').toggle();
    }

    var startMediumGame = function () {
        $('.game_letter').remove();
        lettersMedium = _.shuffle(lettersMedium);
        _.each(lettersMedium, function (letter, index) {
            $('#game').append("<div id='" + index + "' class='game_letter'><span>" + letter + "</span></div>");
        });
        $('span').toggle();
    }

    var startLargeGame = function () {
        $('.game_letter').remove();
        lettersLarge = _.shuffle(lettersLarge);
        _.each(lettersLarge, function (letter, index) {
            $('#game').append("<div id='" + index + "' class='game_letter'><span>" + letter + "</span></div>");
        });
        $('span').toggle();
    }
    

    // Flips a card and checks for a match
    $('#game').on('click', 'div.game_letter', function () {
        console.log('clicking a card');
        $(this).find('span').toggle(); 

        var letter = $(this).text();
        console.log(letter);

        var letterId = parseInt($(this).attr('id'));
        console.log(letterId);


        if (letterId === lastId) {
            console.log('same ID !!');

        } else if (letter === lastCard) {
            $(this).addClass("found");
            $('#' + lastId).addClass("found");
            $(this).removeClass("game_letter");
            $('#' + lastId).removeClass("game_letter");
            lastId = ""

        } else {
            $('#' + lastId).find('span').hide();
            lastId = letterId;
            lastCard = letter;
        };

    });


    //Add hoverclass to cards.
    $('#game').on('mouseenter', '.game_letter', function () {
        $(this).addClass("hover"); // not working
    }).on('mouseout', '.game_letter', function () {
        $(this).removeClass("hover");
    });
    

    //Start the timer
    function startTime() {

    }

    //Increment the timer and display the new time
    function updateTime() {

    }

});