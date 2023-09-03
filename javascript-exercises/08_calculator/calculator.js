const add = function(a, b) {
  return a + b;	
};

const subtract = function(a, b) {
	return a - b;
};

const sum = function(numbers) {
	return numbers.reduce((counter, val) => counter += val, 0);
};

const multiply = function(numbers) {
  return numbers.reduce((counter, val) => counter *= val, 1);
};

const power = function(a,b) {
  return a**b;	
};

const factorial = function(num) {
  let result = 1;

  for (let i = 1; i <= num; i++) {
    result *= i;
  }

  return result;
};

// Do not edit below this line
module.exports = {
  add,
  subtract,
  sum,
  multiply,
  power,
  factorial
};
