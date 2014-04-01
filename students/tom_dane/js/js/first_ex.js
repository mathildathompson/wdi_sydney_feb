//Store the following into variables: number of children, partner's name, geographic location, job title. Output your fortune to the screen like so: "You will be a X in Y, and married to Z with N kids."//

var n = 5;
var z = 'Michelle Obama';
var x = 'CTO';
var y = 'California';
console.log("You will be a " + x + " in " + y + ", and married to " + z + " with " + n + " kids.");

//Forgot how old someone is? Calculate it!
//Store the current year in a variable. Store their birth year in a variable. Calculate their 2 possible ages based on the stored values. Output them to the screen like so: "They are either NN or NN", substituting the values.//

var currentYear = 2014
var birthYear = 1958
var age = ('Robert is either ' + (currentYear - birthYear) + ' or ' + (currentYear - birthYear + 1))
console.log(age)

//Ever wonder how much a "lifetime supply" of your favorite snack is? Wonder no more!
//Store your current age into a variable. Store a maximum age into a variable. Store an estimated amount per day (as a number). Calculate how many you would eat total for the rest of your life. Output the result to the screen like so: "You will need NN to last you until the ripe old age of X".

var age = 28
var death = 101
var consume = 3
var lifeTimeSupply = "You will need " + ((death - age)*consume*365) + " to last you until the ripe old age of " + death;
console.log(lifeTimeSupply)

//Calculate properties of a circle, using the definitions here.
//Store a radius into a variable. Calculate the circumference based on the radius, and output "The circumference is NN". Calculate the area based on the radius, and output "The area is NN".

var radius = 3;
var pi = Math.PI;
var circumference = 2*pi*radius;
var area = pi*Math.pow(radius,2)

console.log('The circumfrence is ' + circumference);
console.log('The area is ' + area);

//It's hot out! Let's make a converter based on the steps here.
//Store a celsius temperature into a variable. Convert it to fahrenheit and output "NN°C is NN°F". Now store a fahrenheit temperature into a variable. Convert it to celsius and output "NN°F is NN°C."

var tempC = 30;
var tempF = 72;

var CtoF = tempC * (9/5) + 32
var FtoC = (tempF - 32)*(5/9)

console.log(tempC + ' in F is ' + CtoF);
console.log(tempF + ' in C is ' + FtoC);

