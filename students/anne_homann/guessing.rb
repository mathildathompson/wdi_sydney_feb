# # Display a prompt for the user
# puts "I am thinking of an integer between 0 and 10... what number am I thinking of? "

# # Obtain the user's input and interpret it as an integer.
# answer = gets.chomp.to_i

# # Generate a random number between 0 and 10
# secret = rand(1..10)

# # Use a while loop to let the user guess again until he/she gets the answer right.
# while secret != answer
# 	# answer = gets.chomp.to_i
# if answer <= 10
# 	puts "That's it!  How'd you know?!"
# else
# 	puts "Wrong! Try again!"
# end


answer = 1 + rand(10)
num = 0

while num != answer
	print "I am thinking of an integer between 0 and 10... what number am I thinking of? "
	num = gets.chomp.to_i
    # num = Integer(gets.chomp) - another way to phrase it

    if num != answer
        puts "Wrong! Try again!"
	end
end

puts "That's it! How'd you know?!"