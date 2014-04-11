var stationList = function(i){
  if (i == 1){
    return ['Times Square', '34th', '28th', '23rd', 'Union Square', '8th'];
  } else if (i == 2) {
    return ['8th', '6th', 'Union Square', '3rd', '1st'];
  } else if (i == 3) {
    return ['Grand Central', '33rd', '28th', '23rd', 'Union Square', 'Astor Place'];
  };
}

var calculate = function(){
  //start with the lines
  var nline = ['Times Square', '34th', '28th', '23rd', 'Union Square', '8th'];
  var lline = ['8th', '6th', 'Union Square', '3rd', '1st'];
  var sixline = ['Grand Central', '33rd', '28th', '23rd', 'Union Square', 'Astor Place'];
  
  //get start and stop from the form
  var stationStart = document.mta.station_start.value
  var stationStop = document.mta.station_stop.value
  //alert(stationStart);
  //alert(stationStop);

  //split start/stop values into line and station
  var startLine = stationStart.split('_')[0];
  var startStation = stationStart.split('_')[1];
  var stopLine = stationStop.split('_')[0];
  var stopStation = stationStop.split('_')[1];
  //alert(startLine);
  //alert(startStation);

  var startArray = stationList(startLine);
  var stopArray = stationList(stopLine);
  alert(startArray);
  alert(stopArray);

  //set the start array
  if (startLine == 1){
    var startArray = nline;
  } else if (startLine == 2) {
    var startArray = lline;
  } else if (startLine == 3) {
    var startArray = sixline;
  };

  //set the stop array
  if (stopLine == 1){
    var stopArray = nline;
  } else if (stopLine == 2) {
    var stopArray = lline;
  } else if (stopLine == 3) {
    var stopArray = sixline;
  };

  //get index of start/stop stations from arrays
  var startIndex = startArray.indexOf(startStation);
  var stopIndex = stopArray.indexOf(stopStation);
  alert('start at line ' + startLine + ' - ' + startIndex + ' - ' + startStation);
  alert('stop at line ' + stopLine + ' - ' + stopIndex + ' - ' + stopStation);

  //get number of stops on SAME line
  if (startLine === stopLine){
    var stopsNumber = startIndex - stopIndex;
    alert(stopsNumber);
  };


  //var startStation = getStation('start');
  //var startStation = getStation('destination');

  //console.log(startStation);
};

