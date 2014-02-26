def menu
#Creates a hash including all lines and stations of the subway map.
	subway_lines = { 
		"line_N" => ["Time Square", "34th", "28th", "23rd", "Union Square", "8th"],
		"line_L" => ["8th", "6th", "Union Square", "3rd", "1st"],
		"line_6" => ["Grand Central", "33rd", "28th", "23rd", "Union Square", "Astor Place"]
	}	

#Prompts the user for input.
	puts "Which line are you on?"
	puts "#{subway_lines.keys}"

	choice_line = gets.chomp

#Loop checking if there is no spelling mistake in the user's input, 
#otherwise prompts the user to submit an answer again.
	loop do
  		if subway_lines.keys.include? choice_line
      		break
  		else 
    		puts 'Your input is invalid, please re-enter'
    		choice_line = gets.chomp
  		end
	end

#------------------------------------

#Same as above
	puts "Please select your initial station:"
	puts "#{subway_lines[choice_line]}"

	choice_station = gets.chomp

	loop do
  		if subway_lines[choice_line].include? choice_station
      		break
  		else 
    		puts 'Your input is invalid, please re-enter'
    		choice_station = gets.chomp
  		end
	end

#------------------------------------

#Same as above
	puts "Which line is your final destination on?"
	puts "#{subway_lines.keys}"

	choice_final_line = gets.chomp

	loop do
  		if subway_lines.keys.include? choice_final_line
      		break
  		else 
    		puts 'Your input is invalid, please re-enter'
    		choice_final_line = gets.chomp
  		end
	end

#------------------------------------

#Same as above
	puts "Please select your final destination:"
	puts "#{subway_lines[choice_final_line]}"

	choice_destination = gets.chomp

	loop do
  		if subway_lines[choice_final_line].include? choice_destination
      		break
  		else 
    		puts 'Your input is invalid, please re-enter'
    		choice_destination = gets.chomp
  		end
	end

#------------------------------------

#Checks if both stations entered are on the same or on different lines.
	if choice_line == choice_final_line
		stops = (subway_lines[choice_final_line].index(choice_destination)).abs - (subway_lines[choice_line].index(choice_station)).abs 
		puts "You have #{stops.abs} stops from your initial station: #{choice_station} to your final destination: #{choice_destination}"
	else
		stops2 = (subway_lines[choice_line].index("Union Square") - subway_lines[choice_line].index(choice_station)).abs + (subway_lines[choice_final_line].index("Union Square") - subway_lines[choice_final_line].index(choice_destination)).abs
		puts "You have #{stops2.abs} stops from your initial station: #{choice_station} to your final destination: #{choice_destination}."
	end
		
end

menu()





