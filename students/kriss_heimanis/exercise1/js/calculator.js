/*
JavaScript Calculator
Requirements

Prompt the user to enter an operator and two operands.
Support the following operations: addition, subtraction, multiplication, and division.
Output may appear in the console or in an alert.

Support the modulus operator.
Support the square root operator.
Support more than two operands.
Alternate JavaScript Calculator
*/

var num1 = prompt("Please enter a number");
var operand = prompt("Please enter an operation");
if (operand != 'r'){
  var num2 = prompt("Please enter a number")
};
var calculate = function(num1,num2,operand){
  if (operand === 'r'){
    var calcTotal = Math.sqrt(parseInt(num1))
  } else if (operand === '+'){
    var calcTotal = (parseInt(num1) + parseInt(num2))
  } else if (operand === '-'){
    var calcTotal = (parseInt(num1) - parseInt(num2))
  } else if (operand === '*'){
    var calcTotal = (parseInt(num1) * parseInt(num2))
  } else if (operand === '/'){
    var calcTotal = (parseInt(num1) / parseInt(num2))
  } else if (operand === '%'){
    var calcTotal = (parseInt(num1) % parseInt(num2))
  } else {
    var calcTotal = "please enter a better opernd next time (+ ,- , *, /,)"
  };
  alert(calcTotal)
};

calculate(num1,num2,operand);
