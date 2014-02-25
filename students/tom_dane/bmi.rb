def options

    puts "What do you want to do?"
    puts "1. Calculate your mortage?"
    puts "2. Calculate your BMI?"
    choice = gets.chomp.to_i

    while (choice !=1 && choice !=2)
        puts "Please type '1' or '2'"
        choice = gets.chomp.to_i
    end

    puts "You chose #{choice}"

    case choice
    when 1
        mortgage
    when 2
        bmi
    end


end

def bmi

    puts "Please enter your height in metres"
    height = gets.chomp.to_f
    puts "Plese enter your weight in kilograms"
    weight = gets.chomp.to_f

    puts "Your BMI is #{weight / (height ** 2)}"

    exit

end


def mortgage 

    puts "We will calculate your monthly repayments"
    puts "Please enter your loan amount in dollars"
    loan = gets.chomp.to_i
    puts "Please enter your interest rate"
    rate = gets.chomp.to_f/100/12
    puts "Please enter how long you have to pay it off in years"
    time = gets.chomp.to_i*12

    puts loan
    puts rate
    puts time

    payment = (loan*(rate*(1+rate)**time))/((1+rate)**time - 1)

    puts "You have to pay roughly $#{payment.round} per month to pay off your mortgage"

    exit
end


while true
options()
end