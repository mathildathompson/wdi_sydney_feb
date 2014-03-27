class StocksController < ApplicationController

  include ActionView::Helpers::NumberHelper
  
  def stock
  end

  def search
    @share_code = params[:title]
    @share_price_raw = YahooFinance::get_quotes(YahooFinance::StandardQuote, @share_code)[@share_code].ask 
    @share_value = number_to_currency(@share_price_raw, locale: :au)

  end

end