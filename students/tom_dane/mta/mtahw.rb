require 'pry'

puts "What line are you on?" 
originLine = gets.chomp

puts "What station are you currently?"
originStation = gets.chomp

puts "What line do you wish to visit?"
destinationLine = gets.chomp

puts "What station do you wish to visit?"
destinationStation = gets.chomp

lines = {

  "N" => ["Times Square", "34th", "28thN", "23rdN", "Union Square", "8thN"],
  "L" => ["8thL", "6th", "Union Square", "3rd", "1st"],
  "6" => ["Grand Central", "33rd", "28th6", "23rd6", "Union Square", "Astor Place."]
}



if originLine == destinationLine 

    stationIndex = lines[originLine].index(originStation)
    destinationIndex = lines[destinationLine].index(destinationStation) 
    answer = stationIndex.to_i - destinationIndex.to_i
    puts "You need to travel #{answer.abs} stops"

else originLine != destinationLine

    puts "That's not the same line"
    puts "Wait while I calculate it for you"

    #first, find index of Union Square on current line and current station
    #and get count


    currentStationIndex = lines[originLine].index(originStation)
    unionSquareForCurrentLine = lines[originLine].index("Union Square")

    halfAnswer = currentStationIndex.to_i - unionSquareForCurrentLine.to_i

    puts halfAnswer.abs

    
    #then, go to new line, find index of Union Square
    #and new count. 
    
    destinationStationIndex = lines[destinationLine].index(destinationStation)
    unionSquareForDestinationLine = lines[destinationLine].index("Union Square")

    secondHalfAnswer = destinationStationIndex.to_i - unionSquareForDestinationLine.to_i
    puts secondHalfAnswer.abs

    fullAnswer = halfAnswer.abs + secondHalfAnswer.abs

    puts "You have to travel #{fullAnswer.abs} stops"

    # destinationIndex = lines[destinationLine].index(destinationStation) 
    # answer = stationIndex.to_i - destinationIndex.to_i
    # puts "You need to travel #{answer.abs} stops"

    
end

# binding.pry

