var trip = function(){
	var lines = {
		lineN: ["Time Square", "34th", "28th_lineN", "23rd_lineN", "Union Square", "8th_lineN"],
		lineL: ["8th_lineL", "6th", "Union Square", "3rd", "1st"],
		line6: ["Grand Central", "33rd", "28th_line6", "23rd_line6", "Union Square", "Astor Place"]
	};

	var choice = [
		start_line = Object.keys(lines)[0],
		start_station = lines.lineN[0],
		end_line = Object.keys(lines)[2],
		end_station = lines.line6[0]
	];

	return {
		numStops: function(){
			if(start_line === end_line){
				//Finds the index of the starting and ending station on the line.
				return Math.abs(lines.start_line.indexOf(start_station)) - Math.abs(lines.end_line.indexOf(end_station));
			} else {
				//Calculate number of stops on starting line
				first_line = Math.abs(lines[start_line].indexOf("Union Square")) - Math.abs(lines[start_line].indexOf(start_station));
				//Calculate number of stops on finish line
				second_line = Math.abs(lines[end_line].indexOf("Union Square")) - Math.abs(lines[end_line].indexOf(end_station));
				stops = first_line + second_line;
				return stops;	
			}
		},

		listStops: function(){
		 	for(i = 0; i <= lines[start_line].indexOf("Union Square"); i++){
		 		stops_first_line = (lines[start_line][i]);
		 		console.log(stops_first_line);
		 	}
		 	//I don't know how to reverse the order of the stations if the users go the other way on the second line
		 	for(i = 0; i < lines[end_line].indexOf("Union Square");i++){
		 		stops_end_line = (lines[end_line][i]);
		 		console.log(stops_end_line);
		 	}
		}
	};
};

var firstTrip = trip();

firstTrip.numStops();

console.log("You are going from " + start_station + " on " + start_line + " to " + end_station + " on " + end_line + ".");
console.log("You have " + firstTrip.numStops() + " stops between " + start_station + " and " + end_station + ".");
console.log("Please find below a list of the stations for your trip: ");
firstTrip.listStops();
