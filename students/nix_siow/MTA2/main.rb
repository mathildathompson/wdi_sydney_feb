require 'pry'
require 'sinatra'
require 'sinatra/reloader'

before do
    @subway = {
        "n_line" => ['times_square','34th', '28th', '23rd', 'union_square', '8th'],
        "l_line" => ['8th', '6th', 'union_square', '3rd', '1st'],
        "six_line" => ['grand_central', '33th', '28th_street_stop', '23rd', 'union_square', 'astor_place']
    }
end

get '/' do
    erb :home
end

post '/search' do
    num1 = @subway[params[:origin_line]].index(params[:origin_station])
    num2 = @subway[params[:des_line]].index(params[:des_station])
    union_start = @subway[params[:origin_line]].index("union_square")
    union_end = @subway[params[:des_line]].index("union_square")

    @origin_line = params[:origin_line]
    @origin_station = params[:origin_station]
    @des_line = params[:des_line]
    @des_station = params[:des_station]


    if @origin_line == @des_line
        @same_line_result = (num2 - num1).abs
    
    else @origin_line != @des_line
        @diff_line_result = (num1 - union_start).abs + (union_end - num2).abs
    end

    erb :result
end

