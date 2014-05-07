$(document).ready( function () {
    var hexToRgb = function (hex) {
        // Take each substring and convert to a base 16 integer
        var hexToR = parseInt(hex.substring(0,2),16);
        var hexToG = parseInt(hex.substring(2,4),16);
        var hexToB = parseInt(hex.substring(4,6),16);
        // Concatenate with commas
        $('#hex-solution').text(hexToR + ', ' + hexToG + ', ' + hexToB);
    };

    var rgbToHex = function (r,g,b) {
        var red = r;
        var green = g;
        var blue = b;

        // toString(16) converts the number to hexadecimal
        $('#rgb-solution').text('#' + red.toString(16) + green.toString(16) + blue.toString(16));
    };

    // Hex to RGB click event listener
    $("#hex-rgb-button").on('click', function() {
        // Store the value of the hex-rgb input
        var hex = $('#hex-rgb').val();
        // Pass values to the hexToRgb function 
        hexToRgb(hex);
    });

    // RGB to Hex click event listener
    $("#rgb-hex-button").on('click', function() {
        // Store the value of the rgb-hex input
        var rgb = $('#rgb-hex').val();
        // Split it at the commas
        split_rgb = rgb.split(',');
        // Convert each segment to an integer
        var r = parseInt(split_rgb[0]);
        var g = parseInt(split_rgb[1]);
        var b = parseInt(split_rgb[2]);
        // Pass values to the rgbToHex function 
        rgbToHex(r,g,b);
    });
});

