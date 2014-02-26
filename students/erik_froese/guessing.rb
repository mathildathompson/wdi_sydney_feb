# Display a prompt for the user
puts "I am thinking of an integer between 0 and 10... what number am I thinking of? "

nums = [0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10]
# Obtain the user's input and interpret it as an integer.
answer = gets.chomp.to_i
 
# Generate a random number between 0 and 10
secret = nums.sample
 
# Use a while loop to let the user guess again until he/she gets the answer right.
while answer != secret
  puts "Wrong. Guess again."
  answer = gets.chomp.to_i
end
 
# Display a congratulatory response
puts "that's it!  How'd you know?!" 