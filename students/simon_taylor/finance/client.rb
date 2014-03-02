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

  def buy_stock(code, quantity, portfolio)
    #check portfolio exists
    unless puts @portfolios.has_key? portfolio
      puts "Transaction Failed: Portfolio name is invalid for this client"
      #exit this method returning nil
      return
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
      return
    end

    #calculate total cost of purchase
    cost = price * quantity

    #STILL TO FIX
    #check the portfolio specified exists

    #check the client has sufficient funds
    if @balance > cost
      #TESTING ONLY
      puts "client has sufficient funds for this transaction"
      #reduce balance
      @balance -= cost
      #does the client already has this stock in this portfolio
      if portfolios[portfolio].stocks.has_key? code
        #TESTING ONLY
        puts "the client already has this stock so increase it's quantity"
        #increase their holding by the purchased amount
        @portfolios[portfolio].stocks[code].quantity += quantity
      else
        #TESTING ONLY
        puts "this is a new stock so add it"
        #create a new stock object
        stock = Stock.new(code, quantity)
        #add this stock to the specified portfolio in the stocks hash
        @portfolios[portfolio].stocks[code] = stock
      end
    else
      #transaction failed due to insufficient funds
      puts "Transaction Failed: Client has insufficient funds for this transaction"
    end
    #transaction was a success
    puts "Transaction Successful: This purchase is costed #{ cost } for #{ quantity } of #{ name } stock"
    puts "Client now has a balance of #{ @balance }"
  end
end
