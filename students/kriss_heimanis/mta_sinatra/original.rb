# hash of all stations and lines
subway = {
  :nline => ['Times Square','34th','28th','23rd','Union Square','8th'],
  :lline => ['8th','6th','Union Square','3rd','1st'],
  :sixline => ['Grand Central','33rd','28th','23rd','Union Square','Astor']
}

# print out all line names, with a number for selection


puts "What LINE are you starting at? "
hashindex = 1
subway.each do |line,station|
  print hashindex
  puts " #{line}"
  hashindex += 1
end
line_start = gets.chomp.to_i

case line_start
when 1
  line = :nline
when 2
  line = :lline
when 3
  line = :sixline
end

# print out all stations on the line chosen
puts ""
puts "What STATION are you starting at? "
subway[line].each_with_index do |station,i|
    puts "#{i + 1} #{station}"
end
station_start = (gets.chomp.to_i - 1)

# get the destination line
puts ""
puts "What LINE are you STOPPING at? "
hashindex = 1
subway.each do |line,station|
    print hashindex
    puts " #{line}"
    hashindex += 1
end
line_end = gets.chomp.to_i

case line_end
when 1
  eline = :nline
when 2
  eline = :lline
when 3
  eline = :sixline
end

# print out all stations on the line chosen
puts ""
puts "What STATION are you STOPPING at? "
subway[eline].each_with_index do |station,i|
    puts "#{i + 1} #{station}"
end
station_end = (gets.chomp.to_i - 1)


puts ""
puts "OK. So you're starting at #{subway[line][station_start]} on the #{line}..."
puts "...and you're stopping at #{subway[eline][station_end]} on the #{eline}..?"
puts ""

# if line == eline then just calculate number of stops between start and end stations
if line == eline
  stops_number = station_start - station_end
  puts "Hooray you wont need to change lines and you will be travelling #{stops_number.abs} stations."
else
# get index of connection station
  first_leg = subway[line].index("Union Square") - station_start
  second_leg = subway[eline].index("Union Square") - station_end
  if station_end == subway[eline].index("Union Square") 
    stops_number = station_start - station_end
    puts "If you are travelling to Union Square, you can get there on this line. It is only #{stops_number.abs} stations from here."
  else
    puts "You'll need to change at Union Square which will be in #{first_leg.abs} stops..."
    puts "Then change at Union Square to the #{eline} and then travel #{second_leg.abs} more stops."
  end
end