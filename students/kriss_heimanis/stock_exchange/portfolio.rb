class Portfolio
  attr_accessor :portfolio_name, :portfolio_stocks

  def initialize(portfolio_name)
    @portfolio_name = portfolio_name
    @portfolio_stocks = {}
    # portfolio stocks will be a hash of Stock code and Stock Qty

  end
end