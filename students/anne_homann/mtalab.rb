
# nline: ['Times Square', '34th', '28th', '23rd', 'Union Square', '8th']
# is the new syntax used in Ruby
# old one is being used below

subway = {
  "N_line" => ['Times Square', '34th', '28th', '23rd', 'Union Square', '8th'], 
  "L_line" => ['8th', '6th', 'Union Square', '3rd', '1st'],
  "Six_line" => ['Grand Central', '33rd', '28th', '23rd', 'Union Square', 'Astor Place']
}


puts "Which line are you taking ? #{subway.keys}"
start_line = gets.chomp
puts "From which stop? #{subway[start_line]}"
start_station = gets.chomp
puts "Which line will you be getting off from? #{subway.keys}"
end_line = gets.chomp
puts "And which stop will you be hopping off? #{subway[end_line]}"
end_station = gets.chomp





puts "There will be a total of #{[]} stops before you reach #{subway[end_station]}"
