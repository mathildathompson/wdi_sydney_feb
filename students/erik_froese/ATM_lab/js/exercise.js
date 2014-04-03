  // setting up variables
  var checkingInput = document.getElementById('checkingAmount');
  var checkingDeposit = document.getElementById('checkingDeposit');
  var checkingWithdraw = document.getElementById('checkingWithdraw');
  var checkingDiv = document.getElementById('balance1');
  var currentCheqBalance = "0";

  var savingsInput = document.getElementById('savingsAmount');
  var savingsDeposit = document.getElementById('savingsDeposit');
  var savingsWithdraw = document.getElementById('savingsWithdraw');
  var savingsDiv = document.getElementById('balance2');
  var currentSavingsBalance = "0";

  // creating the background color changer
  var cheqBackgroundChanger = function () {
    if (parseInt(currentCheqBalance) === 0) {
      document.getElementById("checkingAccount").className = "zero";
    } else {
      document.getElementById("checkingAccount").className = "account";
    };
  };
  var savingsBackgroundChanger = function () {
    if (parseInt(currentSavingsBalance) === 0) {
      document.getElementById("savingsAccount").className = "zero";
    } else {
      document.getElementById("savingsAccount").className = "account";
    };
  };

  cheqBackgroundChanger();
  savingsBackgroundChanger();

  // over draft 
  var overdraftCheq = function (transaction) {

    if (Math.abs(transaction) <= currentSavingsBalance + currentCheqBalance) {
      currentCheqBalance = "0";
      checkingDiv.innerHTML = currentCheqBalance;
      currentSavingsBalance = (parseInt(currentSavingsBalance) + transaction);
      savingsDiv.innerHTML = currentSavingsBalance;
      cheqBackgroundChanger();
      savingsBackgroundChanger();
    };
  };
  var overdraftSavings = function (transaction) {
      // var netWorth = parseInt(currentSavingsBalance) + parseInt(currentCheqBalance);
      
      if (Math.abs(transaction) <= currentSavingsBalance + currentCheqBalance) {
      currentSavingsBalance = "0";
      savingsDiv.innerHTML = currentSavingsBalance;
      currentCheqBalance = (parseInt(currentCheqBalance) + transaction);
      checkingDiv.innerHTML = currentCheqBalance;
      cheqBackgroundChanger();
      savingsBackgroundChanger();
    };
  };

  // transactions
  document.getElementById("checkingDeposit").addEventListener('click', function (event) {
    currentCheqBalance = parseInt(checkingInput.value) + parseInt(currentCheqBalance);
    checkingDiv.innerHTML = currentCheqBalance;
    cheqBackgroundChanger();
  });
 
  document.getElementById("savingsDeposit").addEventListener('click', function (event) {
    currentSavingsBalance = (parseInt(savingsInput.value) + parseInt(currentSavingsBalance));
    savingsDiv.innerHTML = currentSavingsBalance;
    savingsBackgroundChanger();
  });
 
  document.getElementById("checkingWithdraw").addEventListener('click', function (event) {
    var transaction = (parseInt(currentCheqBalance) - parseInt(checkingInput.value));
    if (transaction >= 0) {
      currentCheqBalance = transaction;
      checkingDiv.innerHTML = currentCheqBalance;
      cheqBackgroundChanger();
    } 
    else {
      overdraftCheq(transaction);
    };
  });
 
  document.getElementById("savingsWithdraw").addEventListener('click', function (event) {
    transaction = (parseInt(currentSavingsBalance) - parseInt(savingsInput.value));
    if (transaction >= 0 ) {
      currentSavingsBalance = transaction;
      savingsDiv.innerHTML = currentSavingsBalance;
      savingsBackgroundChanger();
    } 
      else {
        overdraftSavings(transaction);
      };
  });
 
