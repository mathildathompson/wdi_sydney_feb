//Converting dollars to pounds:
//Store a dollar amount into a variable.
//Convert it to pounds and output "$NN is £NN".

//convert dollar to pound
var dollarToPound = function(dollar, rate){
  var pounds = (dollar / rate);
  poundShillings = pounds.toFixed(2);
  console.log(poundShillings);
};

//convert pound to dollar
var poundToDollar = function(pound, rate){
  var dollars = pound * rate;
  dollarCents = dollars.toFixed(2);
  console.log(dollarCents);
};

var gbPounds = 500;
var ausDollars = 500;
var audVsGdp = 1.8013;

poundToDollar(gbPounds, audVsGdp);
dollarToPound(ausDollars, audVsGdp);
