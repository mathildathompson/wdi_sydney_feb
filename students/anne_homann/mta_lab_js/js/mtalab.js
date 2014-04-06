// Subway lines and stops
var nline = ["Times Square", "34th", "28th", "23rd", "Union Square", "8th st"];
var lline = ["8th Ave", "6th", "Union Square", "3rd", "1st"];
var sixline = ["Grand Central", "33rd", "28th", "23rd", "Union Square", "Astor Place"];

var boardStop = prompt("At which stop are you boarding?");
var boardLine = prompt("Which line is that on?");

var offStop = prompt("At which stop are you de-boarding?");
var offLine = prompt("Which line is that on?");

// Distance from boardStop to Union Square
switch(boardLine) {
  case 'N':
  var toUS = Math.abs(nline.indexOf(boardStop)-nline.indexOf("Union Square"));
  break;
  case 'L':
  var toUS = Math.abs(lline.indexOf(boardStop)-lline.indexOf("Union Square"));
  break;
  case '6':
  var toUS = Math.abs(sixline.indexOf(boardStop)-sixline.indexOf("Union Square"));
  break;
}

// Distance from Union Square to unloadStop
switch(offLine) {
  case 'N':
  var fromUS = Math.abs(nline.indexOf(offStop)-nline.indexOf("Union Square"));
  break;
  case 'L':
  var fromUS = Math.abs(lline.indexOf(offStop)-lline.indexOf("Union Square"));
  break;
  case '6':
  var fromUS = Math.abs(sixline.indexOf(offStop)-sixline.indexOf("Union Square"));
  break;
}

var distance = Math.abs(toUS) + Math.abs(fromUS);
console.log("You will travel "+ distance + " stops");
