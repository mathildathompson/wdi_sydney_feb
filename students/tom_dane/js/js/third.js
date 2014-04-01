// Activity:

// Find the exchange rate between dollars and pounds
// Store the exchange rate in a variable
// Converting dollars to pounds:

//1 dollar = 0.6 pounds

// Store a dollar amount into a variable.
// Convert it to pounds and output "$NN is £NN".
// Converting pounds to dollars:

//1 pound = 1.66 dollars

// Now store a pound amount into a variable.
// Convert it to dollar and output "£NN is $NN."
// Cleaning it up:

// Can you make sure the output is only 2 decimal places?
// Refactoring

// Can you refactor the code so that it uses functions? Write a function dollarsToPounds that takes a dollar number as input and outputs a string of what the pound equivalent is.
// Do the same for poundsToDollars

var poundsToDollars = function(pounds) {

    var exchange = 1.66
    console.log("£" + pounds + ' equals $' + (pounds*exchange).toFixed(2) )
}

var dollarsToPounds = function(dollars) {

    var exchange = 0.6
    console.log("$" + dollars + ' equals £' + (dollars*exchange).toFixed(2) )

}

poundsToDollars(5)
dollarsToPounds(100)