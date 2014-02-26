#This exercise teaches you to define functions

# Displays a menu and lets user select calc mode
def menu
	puts "Please select your calculator."
	puts "1. Basic calculator"
	puts "2. Advanced calculator"
  puts "3. BMI calculator"
  puts "4. Mortgage calculator"
  puts "Q. Quit"
	
	choice = gets.chomp.to_i
	
	case choice
  when 0
    quit
  when 1
		basic_calculator
	when 2
		advanced_calculator
  when 3
    bmi_calc
  when 4
    mortgage_calc
  when 5
     puts "Please make a valid selection"
     choice = gets.chomp.to_i

  end
end

# Displays basic calc operations, and reads a choice and two numbers
def basic_calculator
	puts "Welcome to the basic calculator."
	puts "Please select your operation."
	puts "(a) is for addition"
	puts "(s) is for subtraction"
	puts "(d) is for division"
	puts "(m) is for multiplicaiton"

	operation = gets.chomp
	puts "Enter your first number"
	num1 = gets.chomp.to_f
	puts "Enter your second number"
	num2 = gets.chomp.to_f

	case operation
	when 'a'
		add num1, num2
	when 's'
		subract num1, num2
	when 'd'
		divide num1, num2
	when 'm'
		multiply num1, num2
	end
end

def advanced_calculator
	puts "Welcome to the advanced calculator."
	puts "Please select your operation"
  puts "(sq) for square root"
  puts "(ex) for exponentiation"

  operation = gets.chomp
  
  case operation
  when "sq"
    puts "Enter your a number"
    num1 = gets.chomp.to_f
    square num1
  when "ex"
     puts "Enter your first number"
    num1 = gets.chomp.to_f
    puts "Enter your second number"
    num2 = gets.chomp.to_f
    exponentiation num1, num2
  end

end

def bmi_calc
  puts "Welcome to the BMI calculator"
  puts "How much do you weigh in kilos?"
  weight = gets.chomp.to_f
  puts "How tall are you in meters?"
  height = gets.chomp.to_f
  bmi weight, height
end

def mortgage_calc
  puts "How much principal do you have to pay off?"
  principal = gets.chomp.to_f
  puts "What is the current interest rate, expressed as decimal?"
  interest_rate = gets.chomp.to_f / 12
  puts "Assuming you're paying monthly, how many months until you pay off your mortgage?"
  months = gets.chomp.to_f
  mortgage_monthly principal, interest_rate, months
end

def add(x, y)
	puts "#{x} + #{y} = #{x + y}"
end

def subtract(x, y)
	puts "#{x} - #{y} = #{x - y}"
end

def multiply(x, y)
	puts "#{x} * #{y} = #{x * y}"
end

def divide(x, y)
	puts "#{x} / #{y} = #{x / y}"
end

def square(x)
  puts "The square root of #{ x } is #{ Math.sqrt(x) }"
end

def exponentiation(x, y)
  puts "#{ x } to the power of #{ y } is #{ x**y }"
  end

def bmi (x, y)
  bmi_output = x / (y ** 2)
  puts "You weigh #{ x } kils and are #{ y } meters tall, making your body mass index #{ x / (y ** 2)}"
  
  case 
  when bmi_output < 18.5
    puts "You are considered underweight"
  when bmi_output < 25
    puts "You are considered normal weight"
  when bmi_output < 26
    puts "You are considered overweight"
  when bmi_output < 40
    puts "You are considered obese"
  when bmi_output >= 40
    puts "You are considered extremely obese"
  end
end

def mortgage_monthly (p, i, n)
  monthly_payment = p * (i * (1  +  i) ** n) / ((1 + i) ** n - 1)
  puts "Your monthly payment is #{ monthly_payment}"
  puts "Note: this calculator is not to be trusted"
end

def quit
  puts "Would you like to quit? Type y or n."
  quit_message = gets.chomp
  if quit_message == "y"
  exit
else
  menu()
end
end

#This calls the function over and over
while true
  menu()
end