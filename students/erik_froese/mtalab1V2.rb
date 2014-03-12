subway = {
  "N" => ["Times Square", "34th", "28th_n", "23rd_n", "Union Square", "8th_n"],
  "6" => ["Astor", "Union", "23rd_6", "28th_6", "33rd", "Grand Central"],
  "L" => ["8th_L", "6th", "Union", "3rd", "1st"]
}
#To get the number of stops on one line, subtract index of current stop from desired stop. 
#If number is negative, .abs
#This is the way to the index within a hash: subway["N_Line"].index("34th")

#This gets the starting index
puts "What line are you currently at #{ subway.keys }?"

start_line = gets.chomp.upcase


puts "What station are you at #{ subway[start_line] }?"

start_station = gets.chomp.to_s

start_index = subway[start_line].index(start_station)

#This gets desitination index
puts "What line do you want to go to #{ subway.keys }?"

end_line = gets.chomp.upcase

puts "What station do you want to go to #{ subway[end_line] }?"

end_station = gets.chomp.to_s

end_index = subway[end_line].index(end_station)

#This is the index of union square on all lines
Union_N = 4
Union_6 = 1
Union_L = 2


if start_line == end_line
  #This tells them how far they are from the station, if they're on the same line
  puts "You are #{ (start_index - end_index).abs} stops away from your desitination"
else
  #This tells them how far they are from the station,if they're on a different line
  case 
  when ((start_line == "N") && (end_line == "6"))
    puts "You are #{ Union_6 + (start_index -  Union_N).abs } stops from your station"
   when ((start_line == "N") && (end_line == "L"))
    puts "You are #{ Union_L + (start_index -  Union_N).abs } stops from your station"
     when ((start_line == "6") && (end_line == "N"))
    puts "You are #{ Union_N + (start_index -  Union_6).abs } stops from your station."
     when ((start_line == "6") && (end_line == "L"))
    puts "You are #{ Union_L + (start_index -  Union_6).abs } stops from your station."
      when ((start_line == "L") && (end_line == "N"))
    puts "You are #{ Union_N + (start_index -  Union_L).abs } stops from your station."
      when ((start_line == "L") && (end_line == "6"))
    puts "You are #{ Union_6 + (start_index -  Union_L).abs } stops from your station."
  end
end

















