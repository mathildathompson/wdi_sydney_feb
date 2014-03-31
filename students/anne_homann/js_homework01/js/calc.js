var addition = function (num1, num2) {
	var ask1 = prompt("Please enter your first number");
	var ask2 = prompt("Please enter your second number");
	var result = num1 + num2;
	var answer = "The sum of " + num1 + " and " + num2 + " is " + result;
	console.log(answer);
};

addition(12, 12);
addition(200, 100);



var subtraction = function (num1, num2) {
	var ask1 = prompt("Please enter your first number");
	var ask2 = prompt("Please enter your second number");
	var result = num1 - num2;
	var answer = "The subtraction of " + num1 + " and " + num2 + " is " + result;
	console.log(answer);
};

subtraction(30, 15);
subtraction(300, 75);


var multiplication = function (num1, num2) {
	var ask1 = prompt("Please enter your first number");
	var ask2 = prompt("Please enter your second number");
	var result = num1 * num2;
	var answer = "The multiplication of " + num1 + " and " + num2 + " is " + result;
	console.log(answer);
};

multiplication(5, 5);
multiplication(10, 10);

var division = function (num1, num2) {
	var ask1 = prompt("Please enter your first number");
	var ask2 = prompt("Please enter your second number");
	var result = num1 / num2;
	var answer = "The division of " + num1 + " and " + num2 + " is " + result;
	console.log(answer);
};

division(25, 5);
division(100, 10);