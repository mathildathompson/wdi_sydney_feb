 var children = 89
 var partnerName = 'someone'
 var place = 'somewhere'
 var job = 'something'

var future = "You will be a " + job + " in " + place + ", and married to " + partnerName + " with " + children + " kids."

console.log(future)

//Forgot how old someone is? Calculate it!
//Store the current year in a variable. Store their birth year in a variable. Calculate their 2 possible ages based on the stored values. Output them to the screen like so: "They are either NN or NN", substituting the values.

var yearCurrent = 2014;
var yearBirth = 2000;
var agePossible1 = (yearCurrent - yearBirth);
var agePossible2 = agePossible1 - 1;

console.log(agePossible2, agePossible1);

//Ever wonder how much a "lifetime supply" of your favorite snack is? Wonder no more!
//Store your current age into a variable. Store a maximum age into a variable. 
//Store an estimated amount per day (as a number). 
//Calculate how many you would eat total for the rest of your life. 
//Output the result to the screen like so: "You will need NN to last you until the ripe old age of X".

var ageCurrent = 36;
var ageMax = 150;
var numConsumed = 20;
var numRequired = (ageMax - ageCurrent) * (numConsumed * 365);
var niceString = "You will need " + numRequired + " to last you until the ripe old age of " + ageMax;

console.log(niceString);

//Calculate properties of a circle, using the definitions here.
//Store a radius into a variable. Calculate the circumference based on the radius, 
//output "The circumference is NN". Calculate the area based on the radius, and output "The area is NN".

var circleRadius = 2;
var circleCircumference = (2 * Math.PI) * circleRadius;
var sayCircumference = "The circumference is " + circleCircumference;

console.log(sayCircumference);

var circleArea = (Math.PI * circleRadius) * (Math.PI * circleRadius);
var sayArea = "The area is " + circleArea;

console.log(sayArea)
console.log(Math.PI)

//It's hot out! Let's make a converter based on the steps here.
//Store a celsius temperature into a variable. Convert it to fahrenheit and output "NN°C is NN°F". 
//Now store a fahrenheit temperature into a variable. Convert it to celsius and output "NN°F is NN°C."

var tempCelsius = 25;
var tempFahrenheit = ( 9 / 5 ) * (tempCelsius + 32);
var convertCF = tempCelsius + "°C  is " + tempFahrenheit + "°F.";

console.log(convertCF);

var tempFahrenheit = 25;
var tempCelsius = ( 5 / 9 ) * (tempFahrenheit - 32);
var convertFC = tempFahrenheit + "°F  is " + tempCelsius + "°C.";

console.log(convertFC);









