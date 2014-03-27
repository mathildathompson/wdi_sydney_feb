class StockController < ApplicationController
  def stock
    @code = params[:symbol]
    @price = YahooFinance::get_quotes(YahooFinance::StandardQuote, @code)[@code].lastTrade
  end
end