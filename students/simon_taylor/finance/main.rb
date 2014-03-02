require 'pry'
require 'YahooFinance'

require_relative 'clientbase'
require_relative 'client'
require_relative 'portfolio'
require_relative 'stock'

app = ClientBase.new

def check_price(stock)
  YahooFinance::get_quotes(YahooFinance::StandardQuote, stock.upcase)[stock].lastTrade
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

s1 = Stock.new('Google','GOOG',50)
s2 = Stock.new('Apple','AAPL',100)
s3 = Stock.new('Amazon','AMZN',30)
s4 = Stock.new('Bank of America','BAC',30)

p1.stocks[s1.code] = s1
p1.stocks[s2.code] = s2
p2.stocks[s3.code] = s3
p3.stocks[s4.code] = s4



binding.pry