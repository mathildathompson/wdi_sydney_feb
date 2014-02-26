#lets user selct calculator mode
def menu
	puts "Please select your calculator"
	puts "1. Basic"
	puts "2. Advanced"
  puts "3. Body Mass Index"
  puts "4. Mortgage calculator"
  puts "5. Quit"

	choice = gets.chomp.to_i
	while (choice != 1 && choice != 2 && choice != 3 && choice != 4 && choice != 5)
		puts "Please select 1, 2, 3, 4 or 5."
		choice = gets.chomp.to_i
	end

	case choice 
	when 1 
		basic_calculator
	when 2
		advanced_calculator
  when 3
    bmi
  when 4
    mortgage
  when 5
    quit
	end
end

def mortgage
  puts "Welcome to the Mortgage Calculator."
  puts "How much money would you like to borrow?"
  num_1 = gets.chomp.to_f
  puts "Over how many years do you want to repay the loan?"
  num_2 = gets.chomp.to_f
  mortgage_calc(num_1, num_2)
end

def bmi
  puts "Welcome to the BMI calculator."
  puts "To measure your BMI I'll first need your height in metres, e.g. 1.65:"
  num_1 = gets.chomp.to_f
  puts "Now please tell me your weight in kgs:"
  num_2 = gets.chomp.to_f
  bmi_calc(num_2, num_1)
end

def quit
  puts "You have exited the calculator."
  Process.exit
end 

#Displays basic calc operation, reads a choice and two numbers.
def basic_calculator 
	puts "Welcome to the basic calculator."
	puts "Please select your operation:"
	puts "(a) - addition"
	puts "(s) - subtraction"
	puts "(d) - division"
	puts "(m) - multiplication"

	operation = gets.chomp
	puts "Enter your first number"
	num_1 = gets.chomp.to_f
	puts "Enter your second number"
	num_2 = gets.chomp.to_f

	case operation
	when 'a'
		add num_1, num_2
	when 's'
		subtract num_1, num_2
	when 'd'
		divide num_1, num_2
	when 'm'
		multiply num_1, num_2
	end
end

def advanced_calculator 
	puts "Welcome to the advanced calculator."
	puts "Please select your operation:"
	puts "(sq) - square root"
	puts "(e) - exponentiation"

	operation = gets.chomp

	case operation
	when 'sq'
    puts "Enter the number you would like the sqaure root of:"
    num_1 = gets.chomp.to_f
		square_root num_1
	when 'e'
    puts "Enter the number you want to know the power of:"
    num_1 = gets.chomp.to_f
    puts "What should it be to the power to?"
    num_2 = gets.chomp.to_f
		exponential num_1, num_2
  end
end

def mortgage_calc(num_1, num_2)
  n = num_2 * 12 # number of payments for loan term
  i = 0.05 / 12 # compound interest rate 5%

  term = 1 + i * n # compound interest * number of payments

  x = i * term #e.g.0.00088.... compound interest * term
  y = x / (term - 1) 

  puts "Your monthly repayment will be: $#{y * num_1}"
  puts "Your total repayment will be: $#{n * y * num_1}"
end 


def bmi_calc(weight, height)
  puts "Your BMI is: #{weight/(height * height).to_i}%"
end

def square_root(x)
  puts "The square root of #{x} is: #{Math.sqrt(x)}"
end

def exponential(x, y)
  puts "#{x} to the power of #{y} is: #{x ** y}"
end

def add(x, y)
	puts "#{x} + #{y} = #{x + y}"
end

def subract(x, y)
	puts "#{x} - #{y} = #{x - y}"
end

def multiply(x, y)
	puts "#{x} * #{y} = #{x * y}"
end

def divide(x, y)
	puts "#{x} / #{y} = #{x / y}"
end

while true
	menu()
end

menu()

