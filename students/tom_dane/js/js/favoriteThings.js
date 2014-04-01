var favThings = ["Surfing","Basketball","Weightlifting","Yoga"]

// Create an array that contains a few of your favorite things (fruits, vegetables, colors, sports teams, whatever). Write some code in JavaScript that outputs strings like (for an array of arbitrary length):

// My #1 favorite baseball team is the New York Mets.
// My #2 favorite baseball team is the San Francisco Giants.

//so what we want to do is loop through the array and print a string like the following

for (i=0 ; i< favThings.length ; i++ ) {
 
console.log("My #" + (i+1) + ' sport is ' + favThings[i])

}


