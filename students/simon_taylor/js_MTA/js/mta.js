// MTA Lab
// Objective:

// Apply your knowledge of JavaScript to solve a problem we've already tackled in Ruby.
// Activity

// Create a program that models a simple subway system.

// The program takes the line and stop that a user is getting on at and the line and stop that user is getting off at and prints the total number of stops for the trip.

// There are 3 subway lines:
// The N line has the following stops: Times Square, 34th, 28th, 23rd, Union Square, and 8th
// The L line has the following stops: 8th, 6th, Union Square, 3rd, and 1st
// The 6 line has the following stops: Grand Central, 33rd, 28th, 23rd, Union Square, and Astor Place.
// All 3 subway lines intersect at Union Square, but there are no other intersection points. (For example, this means the 28th stop on the N line is different than the 28th street stop on the 6 line, so you'll have to differentiate this when you name your stops in the arrays.)
// Tell the user the number of stops AND the stops IN ORDER that they will pass through or change at.
// Hints:

// Get the program to work for a single line before trying to tackle multiple lines.
// Don't worry about user input. Start off by just hardcoding your stop and line choices in local variables.
// If you want to add user input, use prompt('Some prompt') to read from the user.
// Remember, you've done this in Ruby before. Look at your code and figure out how to do it in JavaScript.
// Consider diagraming the lines by sketching out the subway lines and their stops and intersection.
// Make subway lines keys in a hash, while the values are an array of all the stops on each line.
// The key to the lab is finding the index positions of each stop.
// Make sure the stops that are the same for different lines have different names (i.e. 23rd on the N and on the 6 need to be differentiated)

var mta = {

    //line details
    lines: {
      "n": ['Times Square','34th','28th','23rd','Union Square','8th'],
      "l": ['8th','6th','Union Square','3rd','1st'],
      "6": ['Grand Central','33rd','28th','23rd','Union Square','Astor Place']
    },

    printStops: function (lineID, start, end) {

      //get the current line
      var line = this.lines[lineID];

      //print out the start stop
      console.log("Start at: " + line[start]);

      //to count the trips
      var stops = 0;

      //if the start station index is less than the end index, loop upwards
      if (start < end) {
        
        //loop from through the stops and print them out
        for (var i = start + 1; i <= end; i++) {
          console.log(line[i]);
        }

        //count the number of stops
        stops = (end - start);

      //the end station index is greater than the start station index, loop backwards
      } else {
        
        //loop from through the stops (in reverse) and print them out
        for (var i = start - 1; i >= end; i--) {
          console.log(line[i]);
        }

        //count the number of stops
        stops = (start - end);

      }

      //return the stops so this can be summed if needed
      return stops;
    },

    trip: function (startLine, startStop, endLine, endStop) {

      //find the stop index on relevant line
      var startStopNo = this.lines[startLine].indexOf(startStop);
      var endStopNo = this.lines[endLine].indexOf(endStop);

      //print details to console
      console.log("Start Line: " + startLine);
      console.log("Start Stop: " + startStop);
      console.log("Start Stop No: " + startStopNo);
      console.log("End Line: " + endLine);
      console.log("End Stop: " + endStop);
      console.log("End Stop No: " + endStopNo);
      console.log("----------------------");

      //set a variable to store number of stops
      var stops = 0;

      //check if start and stop are the same line
      if (startLine === endLine) {
         //console.log("this doesn't work yet");
         stops = this.printStops(startLine, startStopNo, endStopNo);

      //The Start and End line are different
      } else {
        //find both union stations
        var unionStartStopNo = this.lines[startLine].indexOf("Union Square");
        var unionEndStopNo = this.lines[endLine].indexOf("Union Square");

        //print out the union 
        console.log("Start Union Square No: " + unionStartStopNo);
        console.log("End Union Square No: " + unionEndStopNo);

        //call the print stops function and save the number of stops returned
        stops = this.printStops(startLine, startStopNo, unionStartStopNo);
        stops += this.printStops(endLine, unionEndStopNo, endStopNo);
      }

      //print out how many stops in this single line trip
      console.log("There are " + stops + " stops in this trip");
    },

    getInput: function() {
      //get start stop details
      var startLine = prompt("Please input a start line (n, l or 6)");
      var startStopOptions = "(" + this.lines[startLine].join(", ") + ")";
      var startStop = prompt("Please input a start stop " + startStopOptions);

      //get end stop details
      var endLine = prompt("Please input an end line (n, l or 6)");
      var endStopOptions = "(" + this.lines[endLine].join(", ") + ")";
      var endStop = prompt("Please input an end stop " + endStopOptions);
      
      //run the trip calculator function
      this.trip(startLine, startStop, endLine, endStop);
    }
};

mta.getInput();

// mta.printStops("n",2,4);
// console.log("------");
// mta.printStops("n",5,1);

// console.log("---test trip---");
// mta.trip("n","Times Square","n","8th");

// console.log("--------------------------");
// console.log("---test multi line trip---");
// console.log("--------------------------");
// mta.trip("n","Times Square","6","Astor Place");

// console.log("--------------------------");
// console.log("---test multi line trip---");
// console.log("--------------------------");
// mta.trip("l","6th","6","Grand Central");

//underscore.js