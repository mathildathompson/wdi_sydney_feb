#require 'YahooFinance'

class Client
  attr_accessor :name, :balance, :portfolios

  def initialize(name, balance)
    @name = name
    @balance = balance
    @portfolios = {}
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
    #check the stock code actually exists?

    #fetch the stock data
    data = YahooFinance::get_quotes(YahooFinance::StandardQuote, code.upcase)[code]
    #get the price
    name = data.name
    #get the stock name from the web
    price = data.lastTrade
    #total cost
    cost = price * quantity

    #still to fix
    #check the portfolio specified exists
    #stock code exists

    #check the client has sufficient funds
    if @balance > cost #&& @portfolios.has_key? portfolio
      #testing
      puts "client has sufficient funds for this transaction"
      #reduce balance
      @balance -= cost
      #does the client already has this stock in this portfolio
      if portfolios[portfolio].stocks.has_key? code
        #testing only
        puts "the client already has this stock so increase it's quantity"
        #increase their holding by the purchased amount
        @portfolios[portfolio].stocks[code].quantity += quantity
      else
        puts "this is a new stock so add it"
        #create a new stock object
        stock = Stock.new(name, code, quantity)
        #add this stock to the specified portfolio in the stocks hash
        @portfolios[portfolio].stocks[code] = stock
      end
    else
      puts "client has insufficient funds for this transaction"
    end

    puts "This purchase is worth #{cost} for #{quantity} of #{name} stock"
  end
end
