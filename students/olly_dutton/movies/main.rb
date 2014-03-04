require 'pry'
require 'sinatra'
require 'sinatra/reloader'
require 'httparty'
require 'json'


get '/movie' do

   # @title = params[:title]
    
    if params[:title]
        url = "http://www.omdbapi.com/?t=#{params[:title].gsub(' ', '+')}"
   
        response = HTTParty.get(url)
        @movie = JSON(response)
        @movie_title = @movie['Title']
        @movie_poster = @movie['Poster']
        @movie_plot = @movie['Plot']
        @director = @movie['Director']
        @year = @movie['Year']
        @rating = @movie['imdbRating']
        @votes = @movie['imdbVotes']
        @actors = @movie['Actors']
      binding.pry
    end

    erb :movie

end