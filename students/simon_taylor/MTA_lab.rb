require 'pry'

lines = {'N' => ['Times Square','34th','28th','23rd','Union Square','8th'],
         'L' => ['8th','6th','Union Square','3rd','1st'],
         '6' => ['Grand Central','33rd','28th','23rd','Union Square','Astor Place']}

puts "-------------------------------------------------"
puts "These are the available stations on the NY Subway"
puts "- you can change lines at Union Square station --"
puts "-------------------------------------------------"

lines.each do |line,stops|
  stops.each do |stop|
    puts "#{line}-#{stop}"
  end
  puts "-----------"
end

puts "-------------------------------------------------"

#define an invalid input message
error_msg = 'That is not a valid input, please re-enter'

#get the user input for their current line
input_curr_line = ""

loop do 
  puts "Input your current line (#{ lines.keys.join(", ") })"
  input_curr_line = gets.chomp.upcase

  #check for errors on user input and re-loop if error!
  if lines.keys.include? input_curr_line
    break
  else
    puts error_msg
  end

end

#----------------------------------------------

#find the current line stops array
curr_line = lines[input_curr_line]

#get the user input for their current stop
input_curr_stop = ""

loop do
  puts "Input your current stop (#{ curr_line.join(", ") })"
  input_curr_stop = gets.chomp

  #check for errors on user input and re-loop if error!
  if curr_line.include? input_curr_stop
    break
  else
    puts error_msg
  end
end

#find the user's current stop number
curr_stop_no = curr_line.index(input_curr_stop)

#----------------------------------------------

#get the user input for their destination line
input_dest_line = ""

loop do 
  puts "Input your destination line (#{ lines.keys.join(", ") })"
  input_dest_line = gets.chomp.upcase

  #check for errors on user input and re-loop if error!
  if lines.keys.include? input_dest_line
    break
  else
    puts error_msg
  end

end

#find the destination line stops array
dest_line = lines[input_dest_line]

#----------------------------------------------

#find the stops in the destination line
stops = dest_line.join(", ")

#get the user input for their destination stop
input_dest_stop = ""

loop do
  puts "Input your destination stop (#{ dest_line.join(", ") })"
  input_dest_stop = gets.chomp

  #check for errors on user input and re-loop if error!
  if dest_line.include? input_dest_stop
    break
  else
    puts error_msg
  end
end

#find the user's destination stop number
dest_stop_no = dest_line.index(input_dest_stop)

#----------------------------------------------

#{"from_stop"=>"N-Times Square", "to_stop"=>"L-6th"}

puts "-------------------------------------------------"

#the current line and destination line are the same, so count how far apart the stations are
if input_curr_line == input_dest_line
  #calculate the distance to the destination
  distance = curr_stop_no - dest_stop_no

#the destination is not on the current line
else
  #find Union Square on the current line
  curr_union = curr_line.index("Union Square")
  #find Union Square on the destination line
  dest_union = dest_line.index("Union Square")

  #calculate distance on th current line to Union Square
  distance1 = curr_stop_no - curr_union
  #calculate distance on the destination line to Union Square
  distance2 = dest_stop_no - dest_union
  #calculate the total distance
  distance = distance1.abs + distance2.abs

end

#print out trip details to terminal
puts "Your trip is from #{ input_curr_line }-#{ input_curr_stop } to #{ input_dest_line }-#{ input_dest_stop }"
puts "The trip distance is #{ distance.abs } stops"

puts "-------------------------------------------------"

binding.pry

#FEATURES I COULD ADD
#convert to capital case when inputing station names (would this work with names like 34th?)
#remove the need to define blank variable (move the variable definition to inside the loop)