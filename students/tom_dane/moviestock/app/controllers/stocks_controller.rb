class StocksController < ApplicationController

    def stocks      
    end

    def ticker
        @stock_code = params[:ticker] 
        @price = YahooFinance::get_quotes(YahooFinance::StandardQuote,@stock_code)[@stock_code].lastTrade
    end
end