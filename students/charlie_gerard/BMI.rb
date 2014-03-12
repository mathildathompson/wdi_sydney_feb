puts "Welcome to your Body Mass Calculator"
puts "Please enter your weight in kg"

weight = gets.chomp.to_i

puts "Please enter your height in cm"

height = gets.chomp.to_i

height_bmi = ((height.to_f/100)**(height.to_f/100))

bmi = weight / height_bmi

puts "Your BMI is equal to #{bmi}"


if bmi < 18
	puts "Your BMI is too low!"
elsif bmi > 25
	puts "Your BMI is too high!"
else
	puts "You're healthy!"
end

