require 'pry'
require 'sinatra'
require 'sinatra/reloader'
require 'httparty'
require 'json'


#first we ask them to input the name of the move
#then we take that as the param, 
#and put it into a variable called title. 

#then we set the value of url to be the query
#address  with the title subbed in. 



get '/movies' do
 if params[:movie_name] && params[:movie_name] != ''

  @title = params[:movie_name]
  url = "http://www.omdbapi.com/?t=#{@title.gsub(' ', '+')}"
  response = HTTParty.get(url)
  @movie = JSON(response)
  @movie_error = @movie['Error']
 
  end

  
    erb :movies

end


#if the user types gibberish, how do i check for that?
#Use pry to check for what it returns when user enters gibberish. 



