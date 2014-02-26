require 'pry'

def menu
subway_lines = { 
	"line_N" => ["Time Square", "34th", "28th", "23rd", "Union Square", "8th"],
	"line_L" => ["8th", "6th", "Union Square", "3rd", "1st"],
	"line_6" => ["Grand Central", "33rd", "28th", "23rd", "Union Square", "Astor Place"]
	}

puts "Which line are you on?"
puts "#{subway_lines.keys}"

choice_line = gets.chomp

loop do
	if subway_lines.keys.include?choice_line 
		break
	else
		puts " This is not a valid train line. Please re-enter your choice"
		choice_line = gets.chomp
	end
end
		

puts "Please select the station you want to get on at:"
puts "#{subway_lines[choice_line]}"

choice_station = gets.chomp

loop do
	if subway_lines[choice_line].include?choice_station
		break
	else
		puts "This is not a valid station. Please re-enter your choice"
		choice_station = gets.chomp
	end
end

puts "Please select the final destination:"
puts "#{subway_lines.values}"

choice_destination = gets.chomp

# loop do
# 	if subway_lines.values.split.include?choice_destination
# 		break
# 	else
# 		puts "This is not a valid station. Please re-enter your choice"
# 		choice_destination = gets.chomp
# 	end
# end
# binding.pry

puts "Which line is your final destination on?"
puts "#{subway_lines.keys}"

choice_final_line = gets.chomp

loop do
	if subway_lines.keys.include?choice_final_line
		break
	else
		puts "This is not a valid destination. Please re-enter your choice"
		choice_final_line = gets.chomp
	end
end


if choice_line == choice_final_line
	
	stops = subway_lines[choice_final_line].index(choice_destination) - subway_lines[choice_line].index(choice_station) 
	puts "#{stops.abs}"
else
	stop1 = subway_lines[choice_line].index("Union Square")-subway_lines[choice_line].index(choice_station)
	
	stop2 = subway_lines[choice_final_line].index("Union Square") - subway_lines[choice_final_line].index(choice_destination)
	
	puts "You have #{stop1.abs + stop2.abs} stops from your start point: #{choice_station} Station (#{choice_line}) to your destination point: #{choice_destination} Station (#{choice_final_line})."
 end
end

menu()






