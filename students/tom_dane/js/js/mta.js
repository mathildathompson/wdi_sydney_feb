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

//so in ruby prompted the user, then created 3 arrays of the stops.  
// let's do something similar.  

var originLine = prompt("What line are you on? (N, 6, or L)")
var originStation =  prompt("What station are you currently?")

var destinationLine = prompt("What line do you wish to visit? N, 6, or L)")
var destinationStation = prompt("What station do you wish to visit?")

var lines = {

  "N": ["Times Square", "34th", "28thN", "23rdN", "Union Square", "8thN"],
  "L": ["8thL", "6th", "Union Square", "3rd", "1st"],
  "6": ["Grand Central", "33rd", "28th6", "23rd6", "Union Square", "Astor Place"]
}


if (originLine == destinationLine) { 

    //passenger on the same line

    stationIndex = lines[originLine].indexOf(originStation)
    destinationIndex = lines[destinationLine].indexOf(destinationStation) 
    answer = stationIndex - destinationIndex
    answer = Math.abs(answer) 
    console.log("You need to travel " + answer + " stops")


    // To get the first station, we do 
    // console.log(lines[originLine][stationIndex]) 
    // To get the last station, we do 
    // lines[destinationLine][destinationIndex] 
    // what we want to do is loop through the stations in between and print them. 
    // so we could let i = stationIndex. in this case 1. Then we say while i < destinationIndex; i ++ }
    // but what if they are going the other way? we'll need another condition?


    if (stationIndex < destinationIndex) {

        for (var i = stationIndex; i < destinationIndex; i++) {

            console.log(lines[originLine][i+1])
        }

    } else if (stationIndex > destinationIndex) {

        for (var i = stationIndex; i > destinationIndex; i--) {

            console.log(lines[originLine][i-1])
        } 
    }    

} else if (originLine != destinationLine) {

    //here passenger is changing lines

    currentStationIndex = lines[originLine].indexOf(originStation)
    unionSquareForCurrentLine = lines[originLine].indexOf("Union Square")

    firstLeg = currentStationIndex - unionSquareForCurrentLine
    firstLeg = Math.abs(firstLeg)
       
    destinationStationIndex = lines[destinationLine].indexOf(destinationStation)
    unionSquareForDestinationLine = lines[destinationLine].indexOf("Union Square")

    secondLeg = destinationStationIndex - unionSquareForDestinationLine
    secondLeg = Math.abs(secondLeg)

    console.log("You have to travel " + (firstLeg + secondLeg)  + " stops")

    //again, to print the stations, we have to loop through them all. 3 levels of nested if statements are awkward - should be a way to refactor. 

    //this works out if the current station is before or after union square

    if (currentStationIndex < unionSquareForCurrentLine) {

        for (var i = currentStationIndex; i < unionSquareForCurrentLine; i++) {

            console.log(lines[originLine][i+1])

        }

        //this works out if the destination station is before or after union square
        
        if (destinationStationIndex < unionSquareForDestinationLine) {

            for (var i = unionSquareForDestinationLine; i > destinationStationIndex; i--) {

                console.log(lines[destinationLine][i-1])

            }

        } else if (destinationStationIndex > unionSquareForDestinationLine) {

            for (var i = unionSquareForDestinationLine; i < destinationStationIndex; i++) {

                console.log(lines[destinationLine][i+1])

            }
        }  

    } else if (currentStationIndex > unionSquareForCurrentLine) {

        for (var i = currentStationIndex; i > unionSquareForCurrentLine; i--) {

            console.log(lines[originLine][i - 1])
        } 


            if (destinationStationIndex < unionSquareForDestinationLine) {

            for (var i = unionSquareForDestinationLine; i > destinationStationIndex; i--) {

                console.log(lines[destinationLine][i-1])

            }

        } else if (destinationStationIndex > unionSquareForDestinationLine) {

            for (var i = unionSquareForDestinationLine; i < destinationStationIndex; i++) {

                console.log(lines[destinationLine][i+1])

            }
        }  

    } else {


    }  
   
} else {

    
}
   

    



