require 'pry'
require 'sinatra'
require 'sinatra/reloader'

get '/' do
  "Welcome to the crappest website ever."
end

get '/hello' do
  "smy first web server"
end

get '/goodbye' do
  "so long and thanks for all the fish"
end

get '/name/:first' do
  "hello #{ params[:first] }"
end

get '/name/:first/:last' do
  "yo #{ params[:first]} #{ params[:last]}"
end

get '/name/:first/:last/:age' do
  "yo #{ params[:first]} #{ params[:last]} #{ params[:age]}"
end

get '/multiply/:x/:y' do
  result = params[:x].to_f * params[:y].to_f
  "#{result}"
end

# basic urls that sinatra will understand
# /
# /hello
# /goodbye

# dynamic
# /name/*