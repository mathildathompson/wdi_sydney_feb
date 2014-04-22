$(document).ready(function() {
    var number = 0;
    var counter = 0;

    var populateCountries = function () {
        var post_template = $('#country').html();
        var template = Handlebars.compile( post_template );

        $.getJSON('/countries/' + number + '/' + counter, function (data) {
            
            var html = template( {countries: data} ); //Created an object so we can use 'each'
            $('#countries_container').append( html );

            counter += number;
      
        });
    };

    // Assign the bitton divs to specific number value

    $('#next1').on('click', function () {
        number = 1;
        counter += number;
        populateCountries();
    });

    $('#next5').on('click', function () {
        number = 5;
        counter += number;
        populateCountries();
    });

    $('#next10').on('click', function () {
        number = 10;
        counter += number;
        populateCountries();
    });

    $('#starting-from').on('click', function () {
        console.log('you are here');
        populateCountries();
    });

    //Delay scrolling until 1 second after final event trigger

    var deBouncer = function($,cf,of, interval){
        // deBouncer by hnldesign.nl
        // based on code by Paul Irish and the original debouncing function from John Hann
        // http://unscriptable.com/index.php/2009/03/20/debouncing-javascript-methods/
        var debounce = function (func, threshold, execAsap) {
            var timeout;
            return function debounced () {
                var obj = this, args = arguments;
                function delayed () {
                    if (!execAsap)
                        func.apply(obj, args);
                    timeout = null;
                }
                if (timeout)
                    clearTimeout(timeout);
                else if (execAsap)
                    func.apply(obj, args);
                timeout = setTimeout(delayed, threshold || interval);
            };
        };
        jQuery.fn[cf] = function(fn){  return fn ? this.bind(of, debounce(fn)) : this.trigger(cf); };
    };

    deBouncer(jQuery,'smartscroll', 'scroll', 50);

    $(window).smartscroll(function () {
        var $window = $(window);
        if($window.height() + $window.scrollTop() >= $(document).height()) {
          populateCountries();
        }
    });

});
