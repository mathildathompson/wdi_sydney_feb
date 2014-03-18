class StocksController < ApplicationController

  def search
  @symbol = params[:symbol]
  if @symbol.present? # Via active_support/all, this saves us comparing @symbol != ''
    @symbol.upcase!
    @price = YahooFinance::get_quotes(YahooFinance::StandardQuote, @symbol)[@symbol].lastTrade
  end

  end
end