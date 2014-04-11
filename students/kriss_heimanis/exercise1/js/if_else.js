/*
What number's bigger?
Write a function named greaterNum that:
takes 2 arguments, both numbers.
returns whichever number is the greater (higher) number.
Call that function 2 times with different number pairs, and log the output to make sure it works 
(e.g. "The greater number of 5 and 10 is 10.").
*/

var greaterNum = function(num1, num2){
  if (num1 > num2){
    numGreater = num1
  } else {
    numGreater = num2
  }
  var outPut = "The greater number of " + num1 + " and " + num2 + " is " + numGreater
  console.log(outPut);
};

greaterNum(21,47);

/*
The World Translator
Write a function named helloWorld that:
takes 1 argument, a language code (e.g. "es", "de", "en")
returns "Hello, World" for the given language, for atleast 3 languages. It should default to returning English.
Call that function for each of the supported languages and log the result to make sure it works.
*/

var helloWorld = function(lang){
  if (lang == 'es'){
    console.log('hola');
  }else if (lang == 'de'){
    console.log('guten tag');
  }else if (lang == 'fr'){
    console.log('bonjour');
  }else{
    console.log('gday');
  };
};

helloWorld('de');

/*
The Grade Assigner
Write a function named assignGrade that:
takes 1 argument, a number score.
returns a grade for the score, either "A", "B", "C", "D", or "F".
Call that function for a few different scores and log the result to make sure it works.
*/
var assignGrade = function(score){
  if (score > 95){
    console.log("A");
  } else if (score > 85){
    console.log("B");
  } else if (score > 75){
    console.log("C");
  } else if (score > 50){
    console.log("D");
  } else{
    console.log("F");
  }
};

assignGrade(89);
assignGrade(23);
assignGrade(78);
assignGrade(96);

/*
The Pluralizer
Write a function named pluralize that:
takes 2 arguments, a noun and a number.
returns the number and pluralized form, like "5 cats" or "1 dog".
Call that function for a few different scores and log the result to make sure it works.
Bonus: Make it handle a few collective nouns like "sheep" and "geese".
*/

var pluralize = function(noun, num){
  if (num === 1){
    var say = noun;
  } else {
    var say = noun + 's';
  }
  outPut = num + say
  console.log(outPut)
};

pluralize('dog', 7);
pluralize('dog', 1);
pluralize('cat', 1);
pluralize('cat', 986);
pluralize('fish', 875);

// going to need this line for tonigts homework
//var operator = prompt('you can answer this question to make a variable called "operator"')

//parseInt('987') = 987 