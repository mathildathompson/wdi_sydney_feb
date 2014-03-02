class Stock
  attr_accessor :name, :code, :quantity

  def initialize(name, code, quantity)
    #name should be pulled from the web
    @name = name
    @code = code
    @quantity = quantity
  end

  def to_s
    "#{code} - #{name} with a quantity of #{quantity}"
  end


  def get_price
    begin
      YahooFinance::get_quotes(YahooFinance::StandardQuote, @code.upcase)[@code].lastTrade
    rescue
      0
    end
  end

  def value
    begin
      value = YahooFinance::get_quotes(YahooFinance::StandardQuote, @code.upcase)[@code].lastTrade
      value * quantity
    rescue
      0
    end
  end

end