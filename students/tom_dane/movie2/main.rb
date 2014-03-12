require 'pry'
require 'sinatra'
require 'sinatra/reloader'
require 'httparty'
require 'json'



##if the user types gibberish, how do i check for that? 

get '/' do

    erb :search

end


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


get '/contact' do

    erb :contact

end

get '/about' do

    erb :about

end

get '/search' do

  if params[:search_name] && params[:search_name] != ''

  @search = params[:search_name]
  url = "http://www.omdbapi.com/?s=#{@search}"
  response = HTTParty.get(url)
  @movie_list = JSON(response)['Search']
  @movie_list_error = JSON(response)['Error']

   
  end

  
     erb :search
     

end


get '/movies/:id' do

  @imdb_id = params[:id]
  url = "http://www.omdbapi.com/?i=#{@imdb_id}"
  response = HTTParty.get(url)
  @movie = JSON(response)



  erb :movies_by_id


end



#first we ask them to input the name of the move
#then we take that as the param, 
#and put it into a variable called title. 

#then we set the value of url to be the query
#address  with the title subbed in. 


