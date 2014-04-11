//The Fortune Teller

var future = function (children, partnerName, place, job){
  var sentence = "You will be a " + job + " in " + place + ", and married to " + partnerName + " with " + children + " kids.";
  console.log(sentence);
};
future(89, 'chick', 'city', 'employment');

//The Age Calculator

var d = new Date()
var yearCurrent = d.getFullYear();
console.log(yearCurrent);

var ageCalc = function(yearCurrent, yearBirth){
  var age1 = yearCurrent - yearBirth;
  var age2 = age1 -1;
  console.log(age1, age2)
};
ageCalc(yearCurrent, 1977);
ageCalc(yearCurrent, 1945);
ageCalc(yearCurrent, 2000);

//The Lifetime Supply Calculator

var supplyNumber = function(ageMax, ageCurrent, numConsumed){
  var numRequired = (ageMax - ageCurrent) * (Math.round(numConsumed) * 365);
  var niceString = "You will need " + numRequired + " to last you until the ripe old age of " + ageMax;
  console.log(niceString);
};
supplyNumber(90, 20, 1.4);
supplyNumber(90, 20, 1);
supplyNumber(150, 37, 15);

//The Geometrizer

var calcCircumfrence = function(circleRadius){
  var circleCircumference = (2 * Math.PI) * circleRadius;
  console.log(circleCircumference);
  var sayCircumference = "The circumference is " + circleCircumference;
  console.log(sayCircumference);
  var sayCircumferenceRound = "The rounded circumference is " + Math.round(circleCircumference);
  console.log(sayCircumferenceRound);
};
var calcArea = function(circleRadius){
  var circleArea = (2 * Math.PI) * circleRadius;
  var sayArea = "The area is " + circleArea;
  console.log(sayArea)
  var sayAreaRound = "The rounded area is " + Math.round(circleArea);
  console.log(sayAreaRound)
}
calcCircumfrence(3);
calcArea(20);

//The Temperature Converter

var celsiusToFahrenheit = function(temp){
  var tempFahrenheit = ( 9 / 5 ) * (temp + 32);
  var convertCF = temp + "°C  is " + tempFahrenheit + "°F.";
  console.log(convertCF);
}; 

var fahrenheitToCelsius = function(temp){
  var tempCelsius = ( 5 / 9 ) * (temp - 32);
  var convertFC = temp + "°F  is " + tempCelsius + "°C.";
  console.log(convertFC);
}; 

celsiusToFahrenheit(40);
fahrenheitToCelsius(40);