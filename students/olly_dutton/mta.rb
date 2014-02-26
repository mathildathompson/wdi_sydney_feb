#require 'pry'
subway = {
    'N Line' => ['Times Square', '34th', '28th', '23rd', 'Union Square', '8th'], 
    'L Line' => ['8th', '6th', 'Union Square', '3rd', '1st'],
    '6 Line' => ['Grand Central', '33rd', '28th', '23rd', 'Union Square', 'Astor Place']
}
    
puts "Which line are you starting at #{subway.keys}?" # Interpolates subway Lines
line_start = gets.chomp  

puts "Which station are you starting at #{subway[line_start]}?" # Interpolates the the array of the usr inputed Line
station_start = gets.chomp

puts "Which line are you stopping at #{subway.keys}?"
line_stop = gets.chomp

puts "Which station are you stopping at #{subway[line_stop]}?"
station_stop = gets.chomp

# If traveling on the same Line

if line_start == line_stop   
    start_station_index = subway[line_start].index(station_start)   
    stop_station_index = subway[line_stop].index(station_stop)   
    number_of_stops = stop_station_index - start_station_index
    puts "Your destination is #{number_of_stops.abs} stops away."

# If traveling on different Lines:
#Leg 1    
else
    first_leg_index = subway[line_start].index(station_start)
    union_square_index = subway[line_start].index("Union Square")
    first_leg_stops = first_leg_index - union_square_index
#Leg 2   
    second_leg_index = subway[line_stop].index(station_stop)
    union_square_index = subway[line_stop].index("Union Square")
    second_leg_stops = second_leg_index - union_square_index
   
    puts "Your destination is #{first_leg_stops.abs + second_leg_stops.abs} stops away."
end

#binding.pry