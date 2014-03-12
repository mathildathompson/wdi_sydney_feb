# Display a prompt for the user
puts "I am thinking of an integer between 0 and 10... what number am I thinking of? "
 
# Obtain the user's input and interpret it as an integer.
answer = gets.chomp.to_i
 
# Generate a random number between 0 and 10
secret = rand(9) + 1
 
# Use a while loop to let the user guess again until he/she gets the answer right.
while 
  answer != secret
  if answer > secret
    puts "Lower  (try again)"
  else 
    puts "Higher  (try again)"
  end
  answer = gets.chomp.to_i
end
if answer == secret  
  puts "that's it! #{secret} is the magic number!" 
end
 
# Display a congratulatory response
