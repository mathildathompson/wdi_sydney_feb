# gets the yahoo finance gem workign and connected?
require 'yahoofinance'

# this returns EVERYTHING for apple
YahooFinance::get_quotes(YahooFinance::StandardQuote, 'AAPL')

#this returns just the askign price
YahooFinance::get_quotes(YahooFinance::StandardQuote, 'AAPL')['AAPL'].ask

#returns the last price
YahooFinance::get_quotes(YahooFinance::StandardQuote, 'AAPL')['AAPL'].lastTrade
