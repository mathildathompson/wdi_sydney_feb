require 'pry'
require 'sinatra'
require 'sinatra/reloader'
require 'active_support/all'
  
before do 
  @lines = {
  "N" => ["Times Square", "34th", "28th_n", "23rd_n", "Union Square", "8th_n"],
  "6" => ["Astor", "Union Square", "23rd_6", "28th_6", "33rd", "Grand Central"],
  "L" => ["8th_L", "6th", "Union Square", "3rd", "1st"]
  }
end

get '/' do
  @line_stop = []

  @lines.each do |line, stops|
    stops.each_with_index do |stop, index|
      @line_stop.push(["#{line}-#{stop}", index])
    end
  end
  
  erb :home
end

post '/' do
  if 
    params[:start_stop] == params[:end_stop]
    @result = "Your start stop and end stop are the same. Pull your socks up!"
  else
    start_array = params[:start_stop].split("-")
    end_array = params[:end_stop].split("-")
    if start_array.first == end_array.first
      same_line_result = start_array.last.to_i - end_array.last.to_i
      @result = "You are #{same_line_result.abs} stops away from your destination."
    else
      leg_one = start_array.last.to_i - @lines[start_array.first].index('Union Square')
      leg_two = end_array.last.to_i - @lines[end_array.first].index('Union Square')
      total_number_of_stops = leg_one.abs + leg_two.abs
      @result = "You are #{total_number_of_stops} from your station"
    end
    
  end
    
  erb :stops
end