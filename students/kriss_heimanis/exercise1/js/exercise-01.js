//FUNCTIONS

//there are two different ways of defining a funtion
function sayMyName(){
  console.log("Kriss")
};

sayMyName();
console.log(typeof sayMyName);

//the second (preferred) way
var sayMyName = function(){
  console.log("Kriss")
};

sayMyName();
console.log(typeof sayMyName);

var addNumbers = function(num1, num2){
  var result = num1 + num2;
  console.log(result)
}

addNumbers(23,34);
addNumbers(22,98);

console.log(result) // this wont work as a variable declard inside a fucntion is only a LOCAL variable