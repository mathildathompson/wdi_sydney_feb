def calculator

  exit = false

  while exit == false 

    #prompts the user for which version of the calculator they want

    puts "Please select your calculator."
    puts "1. Basic Calculator"
    puts "2. Advanced Calculator"
    puts "3. Exit"
    choice = gets.chomp.to_i

    #define labels
    label1 = "first value"
    label2 = "second value"
    label3 = "third value"

    #forces the user to input 1 or 2 or keeps looping
    while choice != 1 && choice != 2 && choice != 3
      puts "Please select 1, 2 or 3" 
      choice = gets.chomp.to_i
    end

    if choice == 3
      puts "Exiting Calculator..."
      break
    end

    #prompts the user for which function they wish to use, dynamic based on if calculator basic / advanced

    options = "Please select (a)dd, (s)ubtract, (m)ultiply, (d)ivide"

    if choice == 1
      puts "Welcome to the basic calculator"
      puts "#{options}."
    else
      puts "Welcome to the advanced calculator"
      puts "#{options} \n s(q)uare root, (e)xponent, (o)dd or even, (b)ody mass index, mortgage (c)alculator"
    end

    function = gets.chomp.downcase

    if function == 'b'
      label1 = "weight (kg)"
      label2 = "height (m)"
    elsif function == 'c'
      label1 = "amount to finance ($)"
      label2 = "interest rate (as a decimal not a percentage!)"
      label3 = "loan term (in years)"
    end

    #prompts the user for their first number

    puts "please input your #{label1}"
    num1 = gets.chomp.to_f

    #prompts the user for their second number (IF the function requires it)

    if function != 'q' && function != 'o'
      puts "please input your #{label2}"
      num2 = gets.chomp.to_f
    end

    #prompts the user for their third number (IF the function requires it)

    if function == 'c'
      puts "please input your #{label3}"
      num3 = gets.chomp.to_f
    end

    #performs the appropriate function as specified by the user

    case function
      when 'a'
        result = add(num1,num2)
        puts "The result of #{num1} + #{num2} = #{result}"
      when 's'
        result = subtract(num1,num2)
        puts "Your result of #{num1} - #{num2} = #{result}"
      when 'm'
        result = multiply(num1,num2)
        puts "Your result of #{num1} x #{num2} = #{result}"
      when 'd'
        result = divide(num1,num2)
        puts "Your result of #{num1} / #{num2} =  #{result}"
      when 'q' #square root
        result = sqrt(num1)
        puts "The square root of #{num1} = #{result}"
      when 'e'
        result = exponent(num1, num2)
        puts "The exponential of #{num1} ^ #{num2} = #{result}"
      when 'o'
        result = odd_or_even(num1)
        puts "The number you input is #{result}"
      when 'b'
        result = bmi(num1,num2)
        puts "Your BMI is #{result}"
      when 'c'
        result = mortgage_calc(num1,num2,num3)
        puts "Your loan repayment will be $#{result} per month for #{num3} years"
    end

    puts "---------------------------------------"
  
  end # end of program loop

end

# functions required to perform calculations

def add (x,y)
  x + y
end

def subtract (x,y)
  x - y
end

def multiply (x,y)
  x * y
end

def divide (x,y)
  x / y
end

def sqrt (x)
  if x >= 0
    Math.sqrt(x)
  else
    -1 #error
  end
end

def exponent (x, y)
  x ** y
end

def odd_or_even(x)
  if x % 2 == 0
    'even'
  else
    'odd'
  end
end

def bmi(weight, height)
  weight / height ** 2
end

def mortgage_calc(interest, amount, no_yrs)
  #assume monthly repayments
  i = interest / 100 / 12
  no_pay = no_yrs * 12
  answer = i * amount / (1 - (1 + i) ** (no_pay * -1))
  answer.round(2)
end

# launch the calculator

calculator()
