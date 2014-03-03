require 'pry'
require 'pry-debugger'
require 'sinatra'
require 'sinatra/reloader'
require 'httparty'
require 'json'
require 'active_support/all'

get '/movie' do 
	if params[:movie_title]
	
		url = "http://www.omdbapi.com/?t=#{params[:movie_title].gsub(' ','+')}"
		binding.pry
		response = HTTParty.get url

		@movie = JSON(response)
		@movie_title = @movie["Title"].upcase
		@movie_cast = @movie["Actors"]
		@movie_poster = @movie["Poster"]
		@movie_plot = @movie["Plot"]
		@movie_time = @movie["Runtime"]
		@movie_director = @movie["Director"]
		@movie_genre = @movie["Genre"]
		@movie_year = @movie["Year"]
		@movie_awards = @movie["Awards"]
	end

	erb :movie
	
end