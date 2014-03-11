require 'pry'
require 'yahoofinance'
require_relative 'client' #clients
require_relative 'portfolio' #animals
require_relative 'gase' #shelter

# initialize exchange instance, test clients and their portfolios
exchange = Gase.new
exchange.clients["Harry"] = Client.new("Harry", 50_000)
exchange.clients["Harry"].portfolios["tech"] =  Portfolio.new("tech")
exchange.clients["Harry"].portfolios["energy"] =  Portfolio.new("energy")
exchange.clients["Felix"] = Client.new("Felix", 100_000)
exchange.clients["Felix"].portfolios["environment"] =  Portfolio.new("environment")

# welcome - thanks for flying
puts "--------------"
puts "KKKKK    KKKKK"
puts " KKK    KKK"
puts " KKK   KK"
puts " KKK  K"
puts " KKK   KK"
puts " KKK    KKK"
puts "KKKKK    KKKKK"
puts "--------------"
puts " KrapKode (TM)"
puts "--------------", " "
puts "Welcome to KrapTrade(TM)", " "

# main intro menu
puts "1. ADD a client account"
puts "2. EDIT a client"
puts "3. QUIT"
response = gets.chomp.to_i

while response != 3
  if response == 1
    
    # add client
    print "NEW client name : "
    name = gets.chomp 
    print "Opening balance : "
    cash_balance = gets.chomp
    
    # add input as new Client
    exchange.clients[name] = Client.new(name, cash_balance)
    puts "#{exchange.clients[name].name} added.", " "

  elsif response == 2
    puts "LIST Clients : "
    exchange.clients.each do |key, value|
      puts value.name
    end
    
    # edit client
    print "EDIT client name : "
    client_select = gets.chomp
    
    # show selected client and their status
    # will later need to add values of the portfolios and the client balance === FIXME
    puts "#{exchange.clients[client_select].name} has the following portfolios and stocks", " "
    exchange.clients[client_select].portfolios.each do |key, value|
      puts value.portfolio_name
      puts value.portfolio_stocks
    end
    
    # offer actions for portfolios
    puts "1. ADD a new portfolio"
    puts "2. EDIT a portfolio"
    response_portfolio = gets.chomp.to_i
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
    
      print "EDIT portfolio name : "
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
        puts "#{exchange.clients[client_select].name} has $ #{exchange.clients[client_select].portfolios} balance to work with."
      end

      # very sick of setting up menus all the time so I'm trying to combine them now... not so user friendly but that's not what we're learning right now!
      puts "Please add some details for the shares you'd like to buy or sell."
      print "Share code : "
      mod_share_name = gets.chomp
      print "Quantity : "
      mod_share_qty = gets.to_i
      print "Buy / Sell ? "
      mod_method = gets.chomp.downcase
      mod_share_value = YahooFinance::get_quotes(YahooFinance::StandardQuote, mod_share_name)[mod_share_name].ask * mod_share_qty

      # buy - check to see if shares are already owned, and add new, otherwsie just add new
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
          if exchange.clients[client_select].cash_balance -= mod_share_value
          puts "#{exchange.clients[client_select].name} has a total of #{exchange.clients[client_select].portfolios[portfolio_select].portfolio_stocks[mod_share_name]} #{mod_share_name} shares."         
        else
          puts "Insufficient funds for this transaction."
        end
      # sell - if you have enough, delete the amount selected. If not, sell the bloody lot!
      elsif mod_method == "sell"
        if exchange.clients[client_select].portfolios[portfolio_select].portfolio_stocks[mod_share_name] >= mod_share_qty
          exchange.clients[client_select].portfolios[portfolio_select].portfolio_stocks[mod_share_name] -= mod_share_qty
          puts "#{exchange.clients[client_select].name} has a total of #{exchange.clients[client_select].portfolios[portfolio_select].portfolio_stocks[mod_share_name]} #{mod_share_name} shares."         
        else
          puts "Sorry you can't sell that many - I'm just going to sell all of them instead."
          mod_share_qty = exchange.clients[client_select].portfolios[portfolio_select].portfolio_stocks[mod_share_name]
          exchange.clients[client_select].portfolios[portfolio_select].portfolio_stocks.delete(mod_share_name)
          puts "All #{mod_share_name} shares sold."
        end
      end
    end
      
    # editing a portfolio funciton will list shares and values, and give option to sell shares or buy shares
  end
  # at the end of it all - show menu again
  puts "1. Add a client account"
  puts "2. Edit a client"
  puts "3. Quit"
  response = gets.chomp.to_i

end
# if respose is 3, then so long, Kernel!
Kernel.exit(true) 