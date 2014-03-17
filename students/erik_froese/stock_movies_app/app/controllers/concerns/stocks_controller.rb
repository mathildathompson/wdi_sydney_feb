class StocksController < ApplicationController
  def stocks
    if params[:stock_code] == ""
      @blank_page = "You did not enter a stock"
    elsif params[:stock_code]
      @stock_code = params[:stock_code]
      @stock_code.upcase!
      @price = YahooFinance::get_quotes(YahooFinance::StandardQuote, 
      @stock_code)[@stock_code].lastTrade
    else
      @blank_page = "Please enter a valid stock above."

    end
  end
end