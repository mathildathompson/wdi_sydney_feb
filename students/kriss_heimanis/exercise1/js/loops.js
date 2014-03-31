/*The even/odd reporter
Write a for loop that will iterate from 0 to 20.
For each iteration, it will check if the current number is even or odd, and report that to the screen (e.g. "2 is even").
*/

for (var i = 0; i <= 20; i = i + 1) {
  console.log(i);
  if (i % 2 == 0) {
    console.log(i + ' is even');
  } else {
    console.log(i + ' is odd');
  };
}

/*Multiplication Tables
Write a for loop that will iterate from 0 to 10.
For each iteration of the for loop, it will multiply the number by 9 and log the result (e.g. "2 * 9 = 18").
Bonus: Use a nested for loop to show the tables for every multiplier from 1 to 10 (100 results total).
*/

var timesTables = function(num){
  for (var i = 1; i <= 10; i = i + 1) {
    var extra = '-- ' + (num * i);
    console.log(extra);
  };
};

for (var i = 0; i <= 10; i = i + 1) {
  console.log(i);
  var byNine = (i * 9);
  console.log(byNine);
  timesTables(i);
};

/*The Grade Assigner
Check the results of assignGrade function from the conditionals exercise for every value from 60 to 100
your log should show "For 89, you got a B. For 90, you got an A.", etc.
*/
var assignGrade = function(score){
  if (score > 95){
    var grade = "A";
  } else if (score > 85){
    var grade = "B";
  } else if (score > 75){
    var grade = "C";
  } else if (score > 50){
    var grade = "D";
  } else{
    var grade = "F";
  }
  outPut = 'A score of ' + score + ' gives you a grade of ' + grade ;
  console.log(outPut);
};
for (var i = 40; i <= 100; i = i + 1) {
  assignGrade(i);
}
