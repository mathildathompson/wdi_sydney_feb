//return the array of stations as required
var stationList = function(i){
  if (i == 1){
    return ['Times Square', '34th', '28th', '23rd', 'Union Square', '8th'];
  } else if (i == 2) {
    return ['8th', '6th', 'Union Square', '3rd', '1st'];
  } else if (i == 3) {
    return ['Grand Central', '33rd', '28th', '23rd', 'Union Square', 'Astor Place'];
  };
};

//retunr the number of stops and print out the stations - according to direction
var stopCounter = function(startIndex, stopIndex, stationArray){
  var stopsNumber = startIndex - stopIndex;
  alert('you will travel ' + Math.abs(stopsNumber) + ' stops.');
  if (stopsNumber > 0){
    for (var i = startIndex; i >= stopIndex; i--) {
      alert(stationArray[i]);
    };
  } else {
    stopsNumber = Math.abs(stopsNumber);
    for (var i = startIndex; i <= stopIndex; i++) {
      alert(stationArray[i]);
    };
  };
};

//the main funciton that gets the start/stop values and uses the other functions accordingly
var calculate = function(){  
  //get start and stop from the form
  var stationStart = document.mta.station_start.value
  var stationStop = document.mta.station_stop.value

  //split start/stop values into line and station
  var startLine = stationStart.split('_')[0];
  var startStation = stationStart.split('_')[1];
  var stopLine = stationStop.split('_')[0];
  var stopStation = stationStop.split('_')[1];

  //use the stationList function to load array of stations
  var startArray = stationList(startLine);
  var stopArray = stationList(stopLine);

  //get index of start/stop stations from arrays
  var startIndex = startArray.indexOf(startStation);
  var stopIndex = stopArray.indexOf(stopStation);

  //get number of stops on SAME line or else for different lines (using union square as a subbed-in index value) - using the stopCounter function
  if (startLine === stopLine){
    var yourTrip = stopCounter(startIndex, stopIndex, startArray);
  } else {
    alert('you will need to make two trips, change at Union Square')
    var stopIndexChange = startArray.indexOf('Union Square');
    var yourTripFirst = stopCounter(startIndex, stopIndexChange, startArray);
    var startIndexChange = stopArray.indexOf('Union Square');
    var yourTripSecond = stopCounter(startIndexChange, stopIndex, stopArray);
  };
};