#require 'YahooFinance'

class Client
  attr_accessor :name, :balance, :portfolios

  def initialize(name, balance)
    @name = name
    @balance = balance
    @portfolios = {}
  end

  def to_s
    "#{ @name } has #{ @portfolios.size } portfolio(s) and has an account balance of #{ @balance }"
  end

  def value
    #set total variable
    total = 0
    #sum the value of all portfolios
    @portfolios.each_value do |port|
      total += port.value
    end
    #return total
    total
  end

  def select_portfolio
    #to store portfolio selected
    portfolio_name = ""

    loop do
      #prompt the user to select a portfolio
      puts "Existing portfolios for #{@name} are: \"#{ @portfolios.keys.sort.join("\", \"") }\""
      portfolio_name = gets.chomp

      if @portfolios.has_key? portfolio_name
        break
      else
        puts "Please input a valid portfolio name"
        puts "--------------------------------"
      end
    end

    #return the portfolio name
    portfolio_name
  end

  def buy_stock(code, quantity, portfolio)
    #check portfolio exists
    unless @portfolios.has_key? portfolio
      puts "Transaction Failed: Portfolio name is invalid for this client"
      #exit this method returning nil
      return "Error"
    end

    #fetch the stock data
    data = YahooFinance::get_quotes(YahooFinance::StandardQuote, code.upcase)[code]
    #get the price
    name = data.name
    #get the stock name from the web
    price = data.lastTrade

    #check this stock code is valid (GEM returns data regardless)
    if (name == "" || name == code) && price == 0
      #print error message
      puts "Transaction Failed: This stock code is invalid"
      #exit this method returning nil
      return "Error"
    end

    #calculate total cost of purchase
    cost = price * quantity

    #check the client has sufficient funds
    if @balance > cost
      #TESTING ONLY
      puts "TESTING: client has sufficient funds for this transaction"
      #reduce balance
      @balance -= cost
      #does the client already has this stock in this portfolio
      if portfolios[portfolio].stocks.has_key? code
        #TESTING ONLY
        puts "TESTING: the client already has this stock so increase it's quantity"
        #increase their holding by the purchased amount
        @portfolios[portfolio].stocks[code].quantity += quantity
      else
        #TESTING ONLY
        puts "TESTING: this is a new stock so create a new stock object it"
        #create a new stock object
        stock = Stock.new(code, quantity)
        #add this stock to the specified portfolio in the stocks hash
        @portfolios[portfolio].stocks[code] = stock
      end
    else
      #transaction failed due to insufficient funds
      puts "Transaction Failed: Client has insufficient funds for this transaction"
      return "Error"
    end
    #transaction was a success
    puts "Transaction Successful: This purchase is costed $#{ cost } for #{ quantity } of #{ name } stock"
    puts "Client now has a balance of #{ @balance }"
    return "Success"

  end

  def sell_stock(code, quantity, portfolio)

    #check portfolio exists
    unless @portfolios.has_key? portfolio
      #print error message
      puts "Transaction Failed: Portfolio name is invalid for this client"
      #exit this method returning nil
      return "Error"
    end

    #check the specified code exits in this portfolio
    unless @portfolios[portfolio].stocks.has_key? code
      #print error message
      puts "Transaction Failed: This stock code cannot be found in this portfolio"
      #exit this method returning nil
      return "Error"
    end

    #fetch the desired stock object
    stock = portfolios[portfolio].stocks[code]

    #check that the quantity <= the stock quantity
    if stock.quantity >= quantity
      #value the stock
      stock_value = stock.get_price * quantity
      #reduce clients stock holding
      stock.quantity -= quantity
      #increase the client's account balance accordingly
      @balance += stock_value
      #delete the stock if balance now = 0
      @portfolios[portfolio].stocks.delete(code) if stock.quantity == 0
      #print success message
      puts "Transaction Successful: This sale earned $#{ stock_value } for #{ quantity } of #{stock.name} stock"
      puts "Client now has a balance of #{ @balance }"
      #return success
      return "Success"
    else
      puts "Transaction Failed: Quantity exceeds clients holdings in this portfolio"
      return "Error"
    end
    #perform the sale
  end
end
