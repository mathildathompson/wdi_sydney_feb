class Portfolio
  attr_accessor :name, :stocks

  def initialize(name)
    @name = name
    @stocks = {}
  end

  def to_s
    "Portfolio - #{name}, contains #{ @stocks.size } distinct stocks"
  end

  def value
    #set total variable
    total = 0
    #sum the value of all stocks in the portfolio
    @stocks.each_value do |stock|
      total += stock.value
    end  
    #return total
    total
  end

end