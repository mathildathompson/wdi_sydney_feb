class Client
  attr_accessor :name, :cash_balance, :portfolios

  def initialize(name, cash_balance)
    @name = name
    @cash_balance = cash_balance
    @portfolios = {}

  end

  def to_s
    "#{@name} has a cash balance of #{@cash_balance} and shares in the portfolios: #{portfolios}"
  end
end