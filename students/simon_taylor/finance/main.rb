require 'pry'
require 'YahooFinance'

require_relative 'clientbase'
require_relative 'client'
require_relative 'portfolio'
require_relative 'stock'

#instansiate the application
app = ClientBase.new

#to test extracting stock data via gem (use lastTrade for price and name for the name)
def get_stock_data(stock)
  data = YahooFinance::get_quotes(YahooFinance::StandardQuote, stock.upcase)[stock]

  #check if this stock code actually exists
  if (data.name == "" || data.name == code) && data.price == 0
    puts "This is an invalid stock code"
  end

  data
end

#testing data
c1 = Client.new("Simon",1_000_000)
c2 = Client.new("Erik",10_000_000)

p1 = Portfolio.new("Good Stocks")
p2 = Portfolio.new("Junk Stocks")
p3 = Portfolio.new("The Best Stocks")

c1.portfolios[p1.name] = p1
c2.portfolios[p2.name] = p2
c2.portfolios[p3.name] = p3

app.add_client(c1.name,c1)
app.add_client(c2.name,c2)

s1 = Stock.new('GOOG',50)
s2 = Stock.new('AAPL',100)
s3 = Stock.new('AMZN',30)
s4 = Stock.new('BAC',30)

p1.stocks[s1.code] = s1
p1.stocks[s2.code] = s2
p2.stocks[s3.code] = s3
p3.stocks[s4.code] = s4
#end of test data

exit = false

until exit
  puts "1 - Add a client"
  puts "2 - Create a new portfolio for a client"
  puts "3 - Purchase stock for a client"
  puts "4 - Sell stock for a client - NOT YET IMPLEMENTED"
  puts "5 - Exit the program"
  puts "------------------------------------------------"
  print "Please select an option (1 - 5): "
  
  response = gets.to_i

  case response

  #------------------------------------------------------------
  #Add a client
  when 1
    #instantiate variables so they are not lost after loop exit
    name = ""
    balance = 0.0

    loop do
      puts "Please enter the client's name"
      name = gets.chomp

      if app.clients.has_key? name
        puts "This name already exists in the database"
      else
        break
      end
    end

    loop do
      puts "Please enter the client's opening deposit (must be greater than $0)"
      balance = gets.to_f

      #exit if a valid balance is input
      if balance > 0.0
        break
      else
        puts "Please input a valid balance"
      end
    end

    #create the client object
    client = Client.new(name, balance)

    #add the client to the application
    app.clients[name] = client

  #------------------------------------------------------------
  #Create a new portfolio for a client
  when 2

    # name = ""
    # portfolio_name = 0.0

    # loop do
    #   puts "Please enter the client's name"
    #   name = gets.chomp

    #   if app.clients.has_key? name
    #     puts "This name already exists in the database"
    #   else
    #     break
    #   end
    # end

  when 3
  when 4
  when 5
    #tell the user we're exiting
    puts "Exiting the program..."
    #set program to exit
    exit = true
  when 0
    puts "Invalid input, please re-enter"
  end
end

binding.pry