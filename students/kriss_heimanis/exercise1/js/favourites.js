/*
Create an array that contains a few of your favorite things (fruits, vegetables, colors, sports teams, whatever). 
Write some code in JavaScript that outputs strings like (for an array of arbitrary length):

My #1 favorite baseball team is the New York Mets.
My #2 favorite baseball team is the San Francisco Giants.

Bonus - Change the output to:

My 1st favorite baseball team is the New York Mets.
My 2nd favorite baseball team is the San Francisco Giants.
*/

var favourites = ['bikes', 'beers', 'babes', 'food', 'codez'];

for (var i = 0; i < favourites.length; i++){
  console.log(i, favourites[i])
}

for (var i = 0; i < favourites.length; i++){
  if (i === 0){
    bonus = "1st"
  } else if (i === 1){
    bonus = "2nd"
  } else if (i === 2){
    bonus = "3rd"
  } else {
    bonus = (i + 1) + "th"
  };
  var fullString = "My " + bonus + " favourite thing is " + favourites[i]
  console.log(fullString)
};

