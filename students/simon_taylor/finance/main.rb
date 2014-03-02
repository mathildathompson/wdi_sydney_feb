require 'pry'
require 'YahooFinance'

require_relative 'clientbase'
require_relative 'client'
require_relative 'portfolio'
require_relative 'stock'

#instansiate the application
app = ClientBase.new

#to test extracting stock data via gem (use lastTrade for price and name for the name)
def get_stock_data(code)
  data = YahooFinance::get_quotes(YahooFinance::StandardQuote, code.upcase)[code]

  #check if this stock code actually exists
  if (data.name == "" || data.name == code) && data.price == 0
    puts "This is an invalid stock code"
  end

  data
end

#-=-=-=- TEST DATA -=-=-=-
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

c1.buy_stock('MQG.AX',99,'Good Stocks')
#-=-=-=- END OF TEST -=-=-=-

#used to print horizontal lines when needed
hline = "-------------------------------------------------"

#start main program
exit = false

until exit
  puts hline
  puts "1 - Add a client"
  puts "2 - Create a new portfolio for a client"
  puts "3 - Purchase stock for a client"
  puts "4 - Sell stock for a client"
  puts "5 - Print Snapshot"
  puts "6 - Exit the program"
  puts hline
  print "Please select an option (1 - 6): "
  
  response = gets.to_i
  puts hline

  case response

  #------------------------------------------------------------
  #Add a client
  when 1
    #instantiate variables so they are not lost after loop exit
    name = ""
    balance = 0.0

    #prompt for client name input and check name does NOT already exist
    loop do
      puts "Please enter the client's name"
      name = gets.chomp

      if app.clients.has_key? name
        puts "This name already exists in the database"
        puts hline
      else
        break
      end
    end

    #prompt for opening balance and check balance is > 0 (and therefore is also not a string)
    loop do
      puts "Please enter the client's opening deposit (must be greater than $0)"
      balance = gets.to_f

      #exit if a valid balance is input
      if balance > 0.0
        break
      else
        puts "Please input a valid balance"
        puts hline
      end
    end

    #create the client object
    client = Client.new(name, balance)

    #add the client to the application
    app.clients[name] = client

  #------------------------------------------------------------
  #Create a new portfolio for a client
  when 2

    portfolio_name = 0.0

    #prompt user to select a client and provide list to select from. Error check for a valid name
    name = app.select_client

    #prompt user for portfolio name, check this name does not already exist
    loop do
      puts "Please enter a name for this new portfolio"
      portfolio_name = gets.chomp

      if app.clients[name].portfolios.has_key? portfolio_name
        puts "This portfolio already exists for client #{name}, please re-enter"
        puts hline
      else
        break
      end
    end

    #create the portfolio object
    portfolio = Portfolio.new(portfolio_name)

    #add the portoflio to the client within the app
    app.clients[name].portfolios[portfolio_name] = portfolio    

  #------------------------------------------------------------
  #Purchase stock for a client
  when 3
    portfolio_name = ""
    #code = ""

    #prompt user to select a client and provide list to select from. Error check for a valid name
    name = app.select_client

    #prompt user for portfolio name, check this name does not already exist
    loop do
      puts "Please enter a portfolio name to store this stock purchase (this is case sensitive)"
      puts "Existing portfolios for #{name} are: \"#{ app.clients[name].portfolios.keys.sort.join("\", \"") }\""
      portfolio_name = gets.chomp

      if app.clients[name].portfolios.has_key? portfolio_name
        break
      else
        puts "Please input a valid portfolio name"
        puts hline
      end
    end

    #get stock code
    puts "Please input the code of the stock you wish to buy"
    code = gets.chomp

    #get quantity
    puts "Please input the quantity you wish to purchase"
    quantity = gets.to_i

    #attempt to purchase stock, invalid stock code or insufficient funds will error
    app.clients[name].buy_stock(code,quantity,portfolio_name)

  #------------------------------------------------------------
  #Sell stock for a client
  when 4
  #------------------------------------------------------------
  #Print Snapshot
  when 5
    #loop through clients
    app.clients.each_value do |c|
      #print client name
      puts c.to_s
      #loop through client's portfolios
      c.portfolios.each_value do |p|
        #print portfolio name
        puts "└── #{ p.to_s }"
        #loop through this portfolio's stock
        p.stocks.each_value do |s|
          #print stock details
          puts "    └── #{ s.to_s }"
        end

      end

      #puts hline
    end

  #------------------------------------------------------------
  #Exit the program
  when 6
    #tell the user we're exiting
    puts "Exiting the program..."
    #set program to exit
    exit = true
  #------------------------------------------------------------
  #ERROR: When the user inputs a string or 0
  when 0
    puts "Invalid input, please re-enter"
  #------------------------------------------------------------
  #ERROR: When the user inputs a number that doesn't exist in the menu
  else
    puts "Invalid input, please re-enter"
  end
end

binding.pry