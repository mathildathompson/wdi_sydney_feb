var subway = {
    'N Line': ['Times Square', '34th', '28th', '23rd', 'Union Square', '8th'], 
    'L Line': ['8th', '6th', 'Union Square', '3rd', '1st'],
    '6 Line': ['Grand Central', '33rd', '28th', '23rd', 'Union Square', 'Astor Place']
    };

var line_start = prompt('Which line are you starting at: ' + Object.keys(subway) + '?');
var station_start = prompt('Which station are you starting at: ' + subway[line_start] + '?');

var line_stop = prompt('Which line are you stopping at: ' + Object.keys(subway) + '?');
var station_stop = prompt('Which station are you stopping at: ' + subway[line_stop] + '?');

// If traveling on the same Line

// Get indexes of stop and start stations - subract the difference to get number of stops
if  (line_start === line_stop) {
    var start_station_index = subway[line_start].indexOf(station_start);   
    var stop_station_index = subway[line_stop].indexOf(station_stop);   
    var number_of_stops = stop_station_index - start_station_index;
    
    console.log('Your destination is ' + Math.abs(number_of_stops) + ' stops away.');

//Print stops - use slice method to return a new array. 
    var stops = subway[line_start].slice(start_station_index+1, stop_station_index+1).join(', ');
 
//If traveling in the other direction. 
        if (start_station_index > stop_station_index) {
        var stops = subway[line_start].slice(stop_station_index, start_station_index).reverse(', ');
        };

    console.log("Stopping at the following stations: " + stops);
};

//  If traveling on different Lines:
// Leg 1    
if  (line_start !== line_stop) {
    var first_leg_index = subway[line_start].indexOf(station_start);
    var union_square_index = subway[line_start].indexOf("Union Square");
    var first_leg_stops = first_leg_index - union_square_index;

    var leg_one_stops = subway[line_start].slice(first_leg_index+1, union_square_index+1).join(', ');
        if (first_leg_index > union_square_index) {
        var leg_one_stops = subway[line_start].slice(union_square_index, first_leg_index).reverse(', ');
        };

// Leg 2   
    var second_leg_index = subway[line_stop].indexOf(station_stop);
    var second_union_square_index = subway[line_stop].indexOf("Union Square");
    var second_leg_stops = second_leg_index - second_union_square_index;
   
    var leg_two_stops = subway[line_stop].slice(second_union_square_index+1, second_leg_index+1).join(', ');
        if (second_union_square_index > second_leg_index) {
        var leg_two_stops = subway[line_stop].slice(second_leg_index, second_union_square_index).reverse(', ');
        };
    
    console.log('Your destination is ' + (Math.abs(first_leg_stops) + Math.abs(second_leg_stops)) + ' stops away.');
    
    console.log("Stopping at the following stations: " + leg_one_stops + ', ' + leg_two_stops);

};