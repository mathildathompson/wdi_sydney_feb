// https://developer.mozilla.org/en-US/docs/Web/API/GlobalEventHandlers.onload
// The load event fires at the end of the document loading process.
// At this point, all of the objects in the document are in the DOM,
// and all the images and sub-frames have finished loading.

// ------------------------------------------
// FIND ALL REQUIRED ELEMENTS
// ------------------------------------------

//the field that stores the balance
var checkBal = document.getElementById("balance1");
var savingsBal = document.getElementById("balance2");

//the deposit amount input boxes
var checkDepositAmt = document.getElementById("checkingAmount");
var savingsDepositAmt = document.getElementById("savingsAmount");

//message output
var messageDisplay = document.getElementById("message");

// ------------------------------------------
// FUNCTIONS NEEDED
// ------------------------------------------

var updateBalances = function () {
  //set check account colour
  if (balances.checkBalance === 0) {
    checkBal.className = "balance zero"
  } else {
    checkBal.className = "balance"
  }

  //set savings account color
  if (balances.savingsBalance === 0) {
    savingsBal.className = "balance zero"
  } else {
    savingsBal.className = "balance"
  }

  //update $ value on screen
  checkBal.innerText = "$" + balances.checkBalance;
  savingsBal.innerText = "$" + balances.savingsBalance;
};

//clear both input boxes
var clearInputs = function () {
  checkDepositAmt.value = "";
  savingsDepositAmt.value = "";
};

//count how many messages output
var messageCount = 1;
//update the message display
var message = function (message) {
  messageDisplay.innerText = message;
  messageCount++;
};

var validAmount = function (number) {
  isNumeric = /^[-+]?(\d+|\d+\.\d*|\d*\.\d+)$/;
  return isNumeric.test(number) && parseFloat(number) > 0;
}

// ------------------------------------------
// DEFINE OPENING BALANCES AND UPDATE SCREEN
// ------------------------------------------

var balances = {
    checkBalance: 0,
    savingsBalance: 0
};

updateBalances();

// ------------------------------------------
// EVENT HANDLER CODE AND RELEVANT FUNCTIONS
// ------------------------------------------

// The click event is raised when the user clicks on an element.
document.getElementById("checkingDeposit").addEventListener('click', function (event) {
  // Any code you put in here will be run when the checkingDeposit button is clicked
  var amount = checkDepositAmt.value;

  if (validAmount(amount)) {
    //parse the amount for calculations
    amount = parseFloat(amount)

    balances.checkBalance = balances.checkBalance + amount;
    message([messageCount,": Deposited $",amount," from Check account"].join(''));
    updateBalances();
    //clearInputs();
  } else {
    message([messageCount,": The amount must be a number and > 0"].join(''));
  }

});

document.getElementById("savingsDeposit").addEventListener('click', function (event) {
  // Any code you put in here will be run when the savingsDeposit button is clicked
  var amount = savingsDepositAmt.value;

  if (validAmount(amount)) {
    //parse the amount for calculations
    amount = parseFloat(amount);

    balances.savingsBalance = balances.savingsBalance + amount;
    message([messageCount,": Deposited $",amount," from Savings account"].join(''));
    updateBalances();
    //clearInputs();
  } else {
    message([messageCount,": The amount must be a number and > 0"].join(''));
  }
});

document.getElementById("checkingWithdraw").addEventListener('click', function (event) {
  // Any code you put in here will be run when the checkingWithdraw button is clicked
  var amount = checkDepositAmt.value;

  if (validAmount(amount)) {
    //parse the amount for calculations
    amount = parseFloat(amount);
    //if there is sufficient funds in the check account
    if (amount <= balances.checkBalance) {
      message([messageCount,": Withdrew $",amount," from Check account"].join(''));
      balances.checkBalance = balances.checkBalance - amount;

    //if there is sufficient funds in total (both accounts)
    } else if (amount <= (balances.checkBalance + balances.savingsBalance)) {
      //calculate withdrawl amount from savings (the excess)
      var savingsWithdrawl = amount - balances.checkBalance;
      //display messages
      message([messageCount,": Withdrew $",balances.checkBalance," from Check account AND Withdrew $",savingsWithdrawl," from Savings account"].join(''));
      //deduct excess funds from savings
      balances.savingsBalance = balances.savingsBalance - savingsWithdrawl;
      //use all funds fron the checking account
      balances.checkBalance = 0;

    //if there is insufficient funds
    } else {
       message([messageCount,": There are insufficient funds to complete this transaction"].join(''));
    }

    updateBalances();
    //clearInputs();
  } else {
    message([messageCount,": The amount must be a number and > 0"].join(''));
  }
});

document.getElementById("savingsWithdraw").addEventListener('click', function (event) {
  // Any code you put in here will be run when the savingsWithdraw button is clicked
  var amount = savingsDepositAmt.value;
  
  if (validAmount(amount)) {
    //parse the amount for calculations
    amount = parseFloat(amount);
    //if there is sufficient funds in the check account
    if (amount <= balances.savingsBalance) {
      message([messageCount,": Withdrew $",amount," from Savings account"].join(''));
      balances.savingsBalance = balances.savingsBalance - amount;

    //if there is sufficient funds in total (both accounts)
    } else if (amount <= (balances.savingsBalance + balances.checkBalance)) {
      //calculate withdrawl amount from check (the excess)
      var checkWithdrawl = amount - balances.savingsBalance;
      //display messages
      message([messageCount,": Withdrew $",balances.savingsBalance," from Savings account AND Withdrew $",checkWithdrawl," from Check account"].join(''));
      //deduct excess funds from check
      balances.checkBalance = balances.checkBalance - checkWithdrawl;
      //use all funds fron the savingsing account
      balances.savingsBalance = 0;

    //if there is insufficient funds
    } else {
       message([messageCount,": There are insufficient funds to complete this transaction"].join(''));
    }

    updateBalances();
    //clearInputs();
  } else {
    message([messageCount,": The amount must be a number and > 0"].join(''));
  }
});