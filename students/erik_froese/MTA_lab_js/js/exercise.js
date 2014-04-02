var lines = {
  "N" : ["Times Square", "34th", "28th", "23rd", "Union Square", "8th"],
  "6" : ["Astor", "Union Square", "23rd", "28th", "33rd", "Grand Central"],
  "L" : ["8th", "6th", "Union Square", "3rd", "1st"]
  };

var firstLine = "N";
var firstStop = "34th";
var secondLine = "L";
var secondStop = "8th";


var stopCalc = function(firstLine, firstStop, secondLine, secondStop) {

  if (firstLine === secondLine) {
     var result = lines[firstLine].indexOf(firstStop) - lines[secondLine].indexOf(secondStop);
     return ("You are " + Math.abs(result) + " stations away from your stop");
  } else {
    var firstLeg = lines[firstLine].indexOf(firstStop) - lines[firstLine].indexOf("Union Square");
    var secondLeg = lines[secondLine].indexOf(secondStop) - lines[secondLine].indexOf("Union Square");
    var result = Math.abs(firstLeg) + Math.abs(secondLeg);
    return ("You are " + result + " stations away from your stop");
  };
};

var stopPrinter = function(firstLine, firstStop, secondLine, secondStop) {
  if (firstLine === secondLine) {
    var firstIndex = lines[firstLine].indexOf(firstStop);
    var secondIndex = lines[secondLine].indexOf(secondStop);

  //   var rangeThing = function(firstIndex, secondIndex) {
  //     for (var i = firstIndex; i <= secondIndex; i++) {
  //     console.log(lines[firstLine].indexOf(i));
  //   } ;
  // };

  // rangeThing(firstIndex, secondIndex);

  } else {
    var firstIndex = lines[firstLine].indexOf(firstStop);
    var firstIndexUnion = lines[firstLine].indexOf("Union Square");
    var secondIndex = lines[secondLine].indexOf(secondStop);
    var secondIndexUnion = lines[secondLine].indexOf("Union Square");
    

    return ("Get on at " + lines[firstLine][firstIndex] + " and travel to " + lines[firstLine][firstIndexUnion] + ". " + "Then catch the " + secondLine + " line to " + lines[secondLine][secondIndex]);
  };
};

console.log(stopCalc(firstLine, firstStop, secondLine, secondStop));
console.log(stopPrinter(firstLine, firstStop, secondLine, secondStop));


