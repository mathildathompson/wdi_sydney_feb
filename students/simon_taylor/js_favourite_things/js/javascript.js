//Create an array that contains a few of your favorite things (fruits, vegetables, colors, sports teams, whatever). Write some code in JavaScript that outputs strings like (for an array of arbitrary length):

// Bonus

// Change the output to:

// My 1st favorite baseball team is the New York Mets.
// My 2nd favorite baseball team is the San Francisco Giants.

var favouriteMovies = ["Aliens", "Shawshank Redemption", "Return of the Jedi", "Pulp Fiction", "Terminator 2", "Predator"];

for (var i = 0; i < favouriteMovies.length; i++) {
  var output = "favorite movie is ";
  
  var num = "";
  if((i + 1) % 10 === 1) {
    num = "st ";
  } else if(i + 1 === 2) {
    num = "nd ";
  } else if(i + 1 === 3) {
    num = "rd ";
  } else {
    num = "th ";
  };

  console.log("My " + (i + 1) + num + output + favouriteMovies[i]);
};