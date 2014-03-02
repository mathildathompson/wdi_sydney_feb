#Displays a menu and lets the user select their calculator mode.
def menu
  puts "Please select your calculator:"
  puts "1. Basic calculator "
  puts "2. Advanced calculator "
  puts "3. Mortgage calculator "
  puts "4. Body Mass Index (BMI) calculator "
  puts "5. Quit"

  choice = gets.chomp.to_i
    while (choice != 1 && choice != 2 && choice !=3 && choice != 4 && choice !=5)
		  puts "Please select 1, 2, 3, 4 or 5."
		  choice = gets.chomp.to_i
    end
		
    case choice
    when 1
	  basic_calculator
    when 2
	  advanced_calculator
    when 3
	  mortgage_calculator	
	when 4
	  bmi_calculator    
    when 5
	  quit	
    end	
end

#---------------------------------------------------------------

#Displays basic calculator operations, 
#reads a choice and two numbers then calculates the input/s.
def basic_calculator
  puts "Welcome to the basic calculator"
  puts "Please select your operation"
  puts "(a) - Addition"
  puts "(s) - Subtraction"
  puts "(d) - Division"
  puts "(m) - Multiplication"

  operation = gets.chomp
	puts "Enter your first number"
	num1 = gets.chomp.to_f
	puts "Enter your second number"
	num2 = gets.chomp.to_f

	case operation
	when 'a'
		add num1, num2
	when 's'
		subtract num1, num2
	when 'd'
		divide num1, num2
	when 'm'
		multiply num1, num2	
	end			
end

#Basic calculator def's

def add(x, y)
	puts "#{ x } + #{ y } = #{ x + y }"
end

def subtract(x, y)
	puts "#{ x } - #{ y } = #{ x - y }"
end

def multiply(x, y)
	puts "#{ x } * #{ y } = #{ x * y }"
end

def divide(x, y)
	puts "#{ x } / #{ y } = #{ x / y }"
end


#---------------------------------------------------------------

#Displays the advanced calculator function,
#reads input for square root and exponentiation
def advanced_calculator
  puts "Welcome to the advanced calculator"
  puts "Please select your operation"
  puts "(s) - Square Root"
  puts "(e) - Exponentiation"

  operation = gets.chomp

  case operation
  when 's'
    puts "Enter your number"
	  x = gets.chomp.to_f
	  sqrt(x)
  when 'e'
	  puts "Enter your 1st number"
	  x = gets.chomp.to_f
	  puts "Enter your second number"
	  y = gets.chomp.to_f
	  exp(x, y)
  end	
end	

#Advanced calculator def's

def exp(x, y)
	puts "#{x ** y}"
end

def sqrt(x)
	puts " #{Math.sqrt(x)}"
end

#---------------------------------------------------------------

#Displays the mortgage calculator,
#reads input and calculates monthly repayments

def mortgage_calculator
  print "Enter Loan Amount: (for $100,000 enter 100000) "
  loan = gets.chomp.to_i

  print "Enter length of time in months: (for 48 months enter '48') "
  time = gets.chomp.to_i

  print "Enter interest rate: (i.e. 6.85%)"
  rate = gets.chomp.to_f/100

  i = (1+rate/12) ** (12/12) -1
  annuity = (1-(1/(1+i)) ** time)/i

  payment = loan/annuity

  puts "\nYour repayments will be $%.2f per month" % [payment]
end  

#---------------------------------------------------------------

#Displays the BMI calculator
#reads input for height and weight and calculates BMI

def bmi_calculator
  print "Enter you height (m): "
  height = gets.to_f

  print "Enter you weight (kgs): "
  weight = gets.to_f

  your_bmi = ((weight / (height * height)) * (10 ** 4)).round(2)
  print "Your BMI is #{your_bmi}\n"
end	


#---------------------------------------------------------------

#Quit def

def quit
	Kernel.exit(true)
end	

while true
	menu()
end	
