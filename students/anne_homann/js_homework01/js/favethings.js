// Create an array that contains a few of your favorite things 
// (fruits, vegetables, colors, sports teams, whatever). 
// Write some code in JavaScript that outputs strings like 
// (for an array of arbitrary length):

// My #1 favorite baseball team is the New York Mets.
// My #2 favorite baseball team is the San Francisco Giants.
// Bonus

// Change the output to:

// My 1st favorite baseball team is the New York Mets.
// My 2nd favorite baseball team is the San Francisco Giants.


// var colours = [blue, green, yellow, orange, purple];
// for (var i = 0; i < colours.Number.getOrdinalFor; i++) {
// 	console.log(colours[i]);
//}





var colours = ["Blue", "Green", "Yellow", "Orange", "Purple"];

function myFavoriteColors(array) {
  for(var i = 0; i < array.length; i += 1) {
    console.log("My #" + (i + 1) + " favorite colour is " + array[i] + ".");
  }
}