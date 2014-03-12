class Stock
  attr_accessor :code, :quantity, :name

  def initialize(code, quantity)
    #name should be pulled from the web
    @code = code
    @quantity = quantity

    #attempt to fetch name from the web
    begin
      @name = YahooFinance::get_quotes(YahooFinance::StandardQuote, code.upcase)[code].name
    rescue
      @name = "Unknown"
    end
  end

  def to_s
    "#{code} - #{name} with a quantity of #{quantity}"
  end


  def get_price
    begin
      YahooFinance::get_quotes(YahooFinance::StandardQuote, @code.upcase)[@code].lastTrade.round(2)
    rescue
      0
    end
  end

  def value
    begin
      value = YahooFinance::get_quotes(YahooFinance::StandardQuote, @code.upcase)[@code].lastTrade.round(2)
      value * quantity
    rescue
      0
    end
  end

end