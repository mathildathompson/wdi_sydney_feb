require 'pry'
require 'yahoofinance'
require_relative 'client' #clients
require_relative 'portfolio' #animals
require_relative 'gase' #shelter

# initialize exchange instance
exchange = Gase.new
# initialize test clients and their portfolios
exchange.clients["Harry"] = Client.new("Harry", 50_000)
exchange.clients["Harry"].portfolios["tech"] =  Portfolio.new("tech")
exchange.clients["Harry"].portfolios["energy"] =  Portfolio.new("energy")
exchange.clients["Felix"] = Client.new("Felix", 100_000)
exchange.clients["Felix"].portfolios["environment"] =  Portfolio.new("environment")

#{ "AXJO" => 200, "NZGI" => 50, "NZ50" => 1000 }
#{ "KS11" => 320 }

def options_mainmenu
  puts "1 to add a new client account"
  puts "2 to edit a client (list all clients, access portfolios, buy/sell shares)"
  puts "3 to save"
  puts "4 to quit"
end

def options_portfoliomenu
  puts "1 to add a new portfolio"
  puts "2 to edit a portfolio"
  puts "3 to exit this menu"
end


# welcome
puts "--------------"
puts "KkKkK    KkKkK"
puts " KkK    KkK"
puts " KkK   KK"
puts " KkK  K"
puts " KkK   KK"
puts " KkK    KkK"
puts "KkKkK    KkKkK"
puts "--------------"
puts " KrapKode (TM)"
puts "--------------", " "
puts "Welcome to KrapTrade(TM)", " "

begin
  puts "Testing connection to Yahoo!Finance server..."
  def queryyahoo(code)
    cshare_name = YahooFinance::get_quotes(YahooFinance::StandardQuote, code)[code].name
    cshare_price = YahooFinance::get_quotes(YahooFinance::StandardQuote, code)[code].ask
    puts cshare_name
    puts "Current price of #{cshare_name} (#{code}) shares is $#{cshare_price}"
  end
  code = "AAPL"
  queryyahoo(code)
  puts "Yahoo connection == SUCCESS!"
  yahoo_connect = true
rescue
  puts "!ALERT! Connection to Yahoo! server not possible at this time. No share buy/sell options will be available."
  yahoo_connect = false
end

# MENU main intro menu
options_mainmenu
response = gets.chomp.to_i

while response != 4
  if response == 1
    
    # add client
    print "New client name : "
    name = gets.chomp 
    print "Opening balance : "
    cash_balance = gets.to_i

    exchange.clients[name] = Client.new(name, cash_balance)
    puts "#{exchange.clients[name].name} added.", " "

  

  elsif response == 2

    puts "Current clients : "
    exchange.clients.each do |key, value|
      puts "#{value.name} has a cash balance of #{value.cash_balance}."
    end
    
    begin # enter name of client to enter

      print "Name of client : "
      client_select = gets.chomp
      puts "#{exchange.clients[client_select].name} has $ #{exchange.clients[client_select].cash_balance}"
      print "#{exchange.clients[client_select].name} has the following portfolios and stocks", " "
      exchange.clients[client_select].portfolios.each do |key, value|
        puts "#{value.portfolio_name} #{value.portfolio_stocks}"
      end
    rescue
      puts "Please try again."
      retry
    end

    # MENU actions for portfolios
    options_portfoliomenu
    response_portfolio = gets.to_i
 
    while response_portfolio != 3
      if response_portfolio == 1
        
        # add portfolio
        print "NEW portfolio name : "
        portfolio_name = gets.chomp 
        # add input as new Client
        exchange.clients[client_select].portfolios[portfolio_name] = Portfolio.new(portfolio_name)
        puts "#{exchange.clients[client_select].portfolios[portfolio_name].portfolio_name} added.", " "
      
      elsif response_portfolio == 2
        
        # list portfolios 
        exchange.clients[client_select].portfolios.each do |key, value|
          puts value.portfolio_name
          puts value.portfolio_stocks
        end
      
        
        begin # enter name of portfolio to edit
          print "Name of portfolio to edit : "
          portfolio_select = gets.chomp
          # list shares, qtys, values
          exchange.clients[client_select].portfolios[portfolio_select].portfolio_stocks.each do |key, value|
            # lets get some info from Yahoo!
            share_code = key.strip
            share_qty = value          
            share_name = YahooFinance::get_quotes(YahooFinance::StandardQuote, share_code)[share_code].name
            share_current_price = YahooFinance::get_quotes(YahooFinance::StandardQuote, share_code)[share_code].ask
            # if the above doesn't want to work for me, I'm just going to use the below values instead
            #share_name = "screw you Yahoo"
            #share_current_price = 526.20
            puts "#{share_qty} x #{share_name} @ #{share_current_price} = $ #{share_qty * share_current_price} "
          end
        rescue
          puts "Please try again."
          retry
        end

        if yahoo_connect == true

          puts "#{exchange.clients[client_select].name} has $ #{exchange.clients[client_select].cash_balance} balance to play with."
          # very sick of setting up menus all the time so I'm trying to combine them now... not so user friendly but that's not what we're learning right now!
          puts "Please add some details for the shares you'd like to buy or sell."
          print "Share code : "
          mod_share_name = gets.chomp
          print "Quantity : "
          mod_share_qty = gets.to_i
          print "Buy / Sell ? "
          mod_method = gets.chomp.downcase
          mod_share_value = YahooFinance::get_quotes(YahooFinance::StandardQuote, mod_share_name)[mod_share_name].ask * mod_share_qty


          # BUY BUY BUY - check to see if shares are already owned, and add new, otherwsie just add new
          if mod_method == "buy"
            # check for enough cash   
            if exchange.clients[client_select].cash_balance >= mod_share_value 
              # if exists already, add
              if exchange.clients[client_select].portfolios[portfolio_select].portfolio_stocks.key?(mod_share_name)
                exchange.clients[client_select].portfolios[portfolio_select].portfolio_stocks[mod_share_name] += mod_share_qty
              # else create new
              else
                exchange.clients[client_select].portfolios[portfolio_select].portfolio_stocks[mod_share_name] = mod_share_qty
              end
              puts "#{exchange.clients[client_select].name} has a total of #{exchange.clients[client_select].portfolios[portfolio_select].portfolio_stocks[mod_share_name]} #{mod_share_name} shares."         
              # last step is to update the cash balance
              exchange.clients[client_select].cash_balance -= mod_share_value
            else
              puts "Insufficient funds for this transaction."
            end
            


          # SELL SELL SELL - if you have enough, delete the amount selected. If not, sell the bloody lot!
          elsif mod_method == "sell"
            if exchange.clients[client_select].portfolios[portfolio_select].portfolio_stocks[mod_share_name] >= mod_share_qty
              exchange.clients[client_select].portfolios[portfolio_select].portfolio_stocks[mod_share_name] -= mod_share_qty
              puts "#{exchange.clients[client_select].name} has a total of #{exchange.clients[client_select].portfolios[portfolio_select].portfolio_stocks[mod_share_name]} #{mod_share_name} shares."         
            else
              puts "Sorry you can't sell that many - I'm just going to sell all of them instead. Serves you right."
              mod_share_qty = exchange.clients[client_select].portfolios[portfolio_select].portfolio_stocks[mod_share_name]
              exchange.clients[client_select].portfolios[portfolio_select].portfolio_stocks.delete(mod_share_name)
              puts "All #{mod_share_name} shares sold."
            end
            # last step is to update the cash balance
            exchange.clients[client_select].cash_balance += mod_share_value
          end
        else
          puts "Sorry we cannot connect to server for trasnactions at this time. Please try again later." 
        end    
      end
      options_portfoliomenu
      response_portfolio = gets.to_i
    end  
  elsif response == 3
    #create a new file database.txt or open if it exists
    f = File.new('stocks.txt', 'a+')
    exchange.clients.each do | key, value |
      f.puts key
      f.puts value
    end
  end
  # at the end of it all - show menu again
  options_mainmenu
  response = gets.chomp.to_i

end
# if respose is 3, then so long, Kernel!
Kernel.exit(true) 