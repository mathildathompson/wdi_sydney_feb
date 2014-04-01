var getOperator = function(){
  return prompt('Please enter your operator: +, -, *, /');
};

var getOperand = function(){
  var result = prompt('Please enter an operand');
  result = parseFloat(result);
  return result;
};

var calculate = function(){
  var operator = getOperator();
  var operandA = getOperand();
  var operandB = getOperand();

  console.log(operator, operandA, operandB);

  var result;

  if (operator == "+"){
    result = operandA + operandB
  } else if (operator == "-"){
    result = operandA - operandB
  } else if (operator == "*"){
    result = operandA * operandB
  } else if (operator == "/"){
    result = operandA / operandB
  } else {
    return 'quit'
  };

  console.log(result);
  alert(result);
};

while (calculate() != 'quit')