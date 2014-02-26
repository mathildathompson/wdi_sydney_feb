
# 3 subway line in Hash.
subway = {
    "n_line" => ['times_square','34th', '28th', '23rd', 'union_square', '8th'],
    "l_line" => ['8th', '6th', 'union_square', '3rd', '1st'],
    "six_line" => ['grand_central', '33th', '28th_street_stop', '23rd', 'union_square', 'astor_place']
    }


# required user's input
puts "Please enter your current subway line. #{subway.keys}"
start_line = gets.chomp.to_s

puts "Which station are you going to get on? #{subway[start_line]}"
start_station = gets.chomp.to_s

puts "What line you gonna get off? #{subway.keys}"
end_line = gets.chomp.to_s

puts "Which station please? #{subway[end_line]}"
end_station = gets.chomp.to_s


# Define
num1 = subway[start_line].index(start_station)
num2 = subway[end_line].index(end_station)
union_start = subway[start_line].index("union_square")
union_end = subway[end_line].index("union_square")


# if condition
if start_line == end_line
    same_line_result = num2 - num1
    puts "Hey, your destination #{end_station} is #{same_line_result.abs} station away from #{start_station}. Enjoy your trip!"

else start_line != end_line
    diff_line_result = (num1 - union_start).abs + (union_end - num2).abs
    puts "Hey, #{end_station} is #{diff_line_result.abs} station away from #{start_station}. Keep that in mind, you got to change your train to #{end_line} when you arrive on Union Square Station. Wish you good journey!"
end
