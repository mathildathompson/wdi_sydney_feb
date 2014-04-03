var calculator = function () {
  num1 = prompt('Please choose the number in your calculation');
  operator = prompt('Please choose an operator');
  
    if (operator === '√') {
      return Math.sqrt(num1)
    }
  
  num2 = prompt('Please choose the next number in your calculation');
  
    if (operator === 'x') {
      return num1 * num2;
    } else if (operator === '+') {
      return parseInt(num1) + parseInt(num2);
    } else if (operator === '-') {
      return num1 - num2;
    } else if (operator === '%') {
      return num1 % num2;
    } else {
      return num1 / num2;
    }
};

console.log(calculator());