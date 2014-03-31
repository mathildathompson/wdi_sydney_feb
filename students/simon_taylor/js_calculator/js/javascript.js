// JavaScript Calculator

// Create a calculator in JavaScript.

// Requirements

// Prompt the user to enter an operator and two operands.
// Support the following operations: addition, subtraction, multiplication, and division.
// Output may appear in the console or in an alert.
// Bonus

// Support the modulus operator.
// Support the square root operator.
// Support more than two operands.

//----------------------------------------------------------------------

//USER PROMPTS
var num1 = prompt("Please input your first number");
var operator = prompt("Please select an operator ( + - / * % sqrt )");

// var num1 = 18;
// var operator = '+';

if (operator !== 'sqrt') {
  var num2 = prompt("Please input your second number");
  // var num2 = 13;
}

var output = 0;
if(operator === "+") {
  output = num1 + num2;
} else if (operator === "-") {
  output = num1 - num2;
} else if (operator === "/") {
  output = num1 / num2;
} else if (operator === "*") {
  output = num1 * num2;
} else if (operator === "%") {
  output = num1 % num2;
} else if (operator === "sqrt") {
  output = Math.sqrt(num1);
} else {
  output = "invalid operator selection";
};

//CONSOLE PRINT
if (operator !== 'sqrt') {
  console.log("Calculating " + num1 + " " + operator + " " + num2);
} else {
  console.log("Calculating sqrt(" + num1 + ")");
};
console.log(output);

//USER ALERT
alert(output);

