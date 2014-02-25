# Startup Screen
def menu
	puts "Please select your calculator:" 
	puts "1. Basic calculator"
	puts "2. Advanced calculator"
    puts "3. Exit"

	choice = gets.chomp.to_i
	while (choice != 1 && choice != 2 && choice != 3)
		puts "Please select 1 or 2 or 3."
		choice = gets.chomp.to_i
	end

	case choice
	when 1
		basic_calculator
	when 2
		advanced_calculator
    when 3
        quit
	end
end


# Display basic calculator operaiton, reads a choice and two number
def basic_calculator
	puts "Welcome to the basic calculator"
	puts "Please select your operation"
	puts "(a) - addition"
	puts "(s) - substraction"
	puts "(d) - division"
	puts "(m) - multiplication"

	operation = gets.chomp
	puts "Enter your first number"
	num1 = gets.chomp.to_f
	puts "Enter your second number"
	num2 = gets.chomp.to_f

	case operation 
	when 'a'
		add num1, num2
	when 's'
		substract num1, num2
	when 'd'
		divide num1, num2
	when 'm'
		multiply num1, num2
	end
end

def advanced_calculator
	puts "Welcome to the advanced calculator"
    puts "Please select your operation"
    puts "(e) - exponentiation"
    puts "(r) - square_root"
    puts "(b) - BMI"
    puts "(h) - Mortgage"

    operation = gets.chomp

    case operation
    when 'e'
        puts "Enter your first number"
        num1 = gets.chomp.to_f
        puts "Enter your second number"
        num2 = gets.chomp.to_f
        exponentiation num1, num2

    when 'r'
        puts "Enter your first number"
        num1 = gets.chomp.to_f
        square_root(num1)
    
    when 'b'
        puts "Please enter your weight(kg) number"
        num3= gets.chomp.to_f
        puts "Please enter your height(m) number"
        num4 = gets.chomp.to_f
        bmi num3, num4

    when 'h'
        puts "Please enter your loan amount."
        loan_amt = gets.chomp.to_f
        puts "Please enter the interest rate."
        rate = gets.chomp.to_f / 12
        puts "Please enter the desired loan term(months)."
        loan_term = gets.chomp
        mortgage p_value, loan_amt, rate, loan_term   
    end
end


## Algorithm for Basic Calculator
def add(x, y)
	puts "#{ x } + #{ y } = #{ x + y }"
end

def substract(x, y)
	puts "#{ x } - #{ y } = #{ x - y }"
end

def multiply(x, y)
	puts "#{ x } * #{ y } = #{ x * y }"
end

def divide(x, y)
	puts "#{ x } / #{ y } = #{ x / y }"
end


## Algorithm for Advanced Calculator
def exponentiation(x, y)
    puts "#{ x } ** #{ y } = #{ x ** y }"
end

def square_root(x)
    puts "#{Math.sqrt(x)}" 
end


# BMI Calculator
def bmi(x, y)
    puts "#{ x } / (#{ y } * #{ y }) = #{ x / (y * y) }"
    if bmi <= 18.5
        puts "You are underweight. Eat more!"
    elsif bmi >= 25
        puts "You are overweight. Do more exercise"
    else
        puts "Great! You are in normal weight. Keep on!"
    end
end


# Mortgage Calculator
def mortgage(x, y, z)
    puts "Your monthly payment is #{  }"
end


# to Quit
def quit
    Kernel.exit(true)
end

# Repeat by go back to menu
while true
	menu()
end