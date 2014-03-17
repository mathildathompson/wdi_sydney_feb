class StocksController < ApplicationController

  def index

    if params.has_key? 'code'

      data = YahooFinance::get_quotes(YahooFinance::StandardQuote, params[:code].upcase)[params[:code]]

      #check if this stock code actually exists
      if data.nil?
        #(data.name == "" || data.name == params[:code]) && data.lastTrade == 0
        @status = "no results"
      else
        @status = "found results"
        @name = data.name
        @price = data.lastTrade
      end

    else
      @status = "no search"
    end

    render 'index'

  end

end