// https://developer.mozilla.org/en-US/docs/Web/API/GlobalEventHandlers.onload
// The load event fires at the end of the document loading process.
// At this point, all of the objects in the document are in the DOM,
// and all the images and sub-frames have finished loading.


var checkingBalance = 0;
var savingsBalance = 0;


window.onload = function () {

  //get total of both accounts
  totalBalance = function(){
    return (checkingBalance + savingsBalance);
    alert('woot')
  }
 
  // update the display anytime the balance changes
  checkingDisplayUpdate = function(){
    checkingDisplay.innerHTML = '$' + checkingBalance.toFixed(2);
    if (checkingBalance == 0){
      checkingDisplay.style.background = 'red';
    } else {
      checkingDisplay.style.background = '#CCC';
    }
  }
  // the actual display field
  var checkingDisplay = document.getElementById('balance1');
  // the INPUT VALUE to be deposited or withdrawn
  var checkingAmount = document.getElementById('checkingAmount');

  // update the display anytime the balance changes
  savingsDisplayUpdate = function(){
    savingsDisplay.innerHTML = '$' + savingsBalance.toFixed(2);
    if (savingsBalance == 0){
      savingsDisplay.style.background = 'red';
    } else {
      savingsDisplay.style.background = '#CCC';
    }
  }
  // the actual display field
  var savingsDisplay = document.getElementById('balance2');
  // the INPUT VALUE to be deposited or withdrawn
  var savingsAmount = document.getElementById('savingsAmount');


  // checkingDeposit button is clicked
  document.getElementById("checkingDeposit").addEventListener('click', function (event) {
    var depositValue = parseInt(checkingAmount.value);
    checkingBalance = (checkingBalance + depositValue);
    checkingDisplayUpdate();
  });

  // checkingWithdraw button is clicked
  document.getElementById("checkingWithdraw").addEventListener('click', function (event) {
    var withdrawValue = parseInt(checkingAmount.value);
    //check to see amount is available
    if (withdrawValue <= checkingBalance){
      checkingBalance = (checkingBalance - withdrawValue);
      checkingDisplayUpdate();
    } else if (withdrawValue <= totalBalance()){
      withdrawValue = (withdrawValue - checkingBalance)
      checkingBalance = 0;
      checkingDisplayUpdate();
      savingsBalance = (savingsBalance - withdrawValue)
      savingsDisplayUpdate();
    } else {
      alert("sorry you don't got the funds for that - try depositing more money.")
    }
  });
  

  // savingsDeposit button is clicked
  document.getElementById("savingsDeposit").addEventListener('click', function (event) {
    var depositValue = parseInt(savingsAmount.value);
    savingsBalance = (savingsBalance + depositValue)
    savingsDisplayUpdate();
  });
  // savingsWithdraw button is clicked
  document.getElementById("savingsWithdraw").addEventListener('click', function (event) {
    var withdrawValue = parseInt(savingsAmount.value);
    //check to see amount is available
    if (withdrawValue <= savingsBalance){
      savingsBalance = (savingsBalance - withdrawValue);
      savingsDisplayUpdate();
    } else if (withdrawValue <= totalBalance()){
      withdrawValue = (withdrawValue - savingsBalance)
      savingsBalance = 0;
      savingsDisplayUpdate();
      checkingBalance = (checkingBalance - withdrawValue)
      checkingDisplayUpdate();
    } else {
      alert("sorry you don't got the funds for that - try depositing more money.")
    }
  });

};