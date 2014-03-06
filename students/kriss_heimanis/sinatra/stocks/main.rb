require 'pry'
require 'sinatra'
require 'sinatra/reloader'
require 'yahoofinance'

get "/query" do
  @first = params[:first].upcase
  if @first
    share_name = YahooFinance::get_quotes(YahooFinance::StandardQuote, @first)[@first].name
    share_price = YahooFinance::get_quotes(YahooFinance::StandardQuote, @first)[@first].ask
  end
  @result = "#{share_name} (#{@first}) is currently trading @ $ #{share_price} per share."

  erb :query
end