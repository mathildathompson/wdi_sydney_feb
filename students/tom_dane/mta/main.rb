require 'pry'

## the task is to rework this app into a sinatra app. so we'll need a home page. 
## this will display a selector of all the stations they can choose from. 
## then it will take them to a page called result or something that gives them to route. 


require 'sinatra'
require 'sinatra/reloader'


class Result

    
end






get '/' do
    erb :home

end

get '/home' do
    erb :home
end

get '/result' do
    @origin_station = params[:origin].split('_').first
    @origin_line = params[:origin].split('_').last    
    @destination_station = params[:destination].split('_').first
    @destination_line = params[:destination].split('_').last


    lines = {

              "N" => ["Times Square", "34th", "28th", "23rd", "Union Square", "8th"],
              "L" => ["8th", "6th", "Union Square", "3rd", "1st"],
              "6" => ["Grand Central", "33rd", "28th", "23rd", "Union Square", "Astor Place."]
            }


    if @origin_line == @destination_line 

        station_index = lines[@origin_line].index(@origin_station)
        destination_index = lines[@destination_line].index(@destination_station) 
        sum = station_index.to_i - destination_index.to_i
        @answer = sum.abs

        @trip = lines[@origin_line][station_index.to_i,destination_index.to_i]
       
    
    else @origin_line != @destination_line

        current_station_index = lines[@origin_line].index(@origin_station)
        union_square_current_line = lines[@origin_line].index("Union Square")

        half_answer = current_station_index.to_i - union_square_current_line.to_i
        first_leg = half_answer.abs
    
        destination_station_index = lines[@destination_line].index(@destination_station)
        union_square_destination_line = lines[@destination_line].index("Union Square")

        second_half_answer = destination_station_index.to_i - union_square_destination_line.to_i
        second_leg = second_half_answer.abs

        @answer = first_leg + second_leg
    end

    erb :result

    
end




