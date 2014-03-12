require 'pry'
require 'pry-debugger'
require 'sinatra'
require 'sinatra/reloader'
require 'httparty'
require 'json'
require 'active_support/all'

get '/movie' do 
	if params[:movie_title]
		url = "http://www.omdbapi.com/?s=#{params[:movie_title].gsub(' ','+')}"
		response = HTTParty.get url
		json = JSON(response)
		@movies = json["Search"]
	end
	erb :movie	
end

get '/title' do
	if params[:id]
		url = "http://www.omdbapi.com/?i=#{params[:id]}" #Searches each movie by ID.	
 		response = HTTParty.get url
 		json = JSON(response)
 		@movie = json
 		@movie_title = @movie["Title"]
 		@movie_id = @movie["imdbID"]

 		if @movie_id['Error']
			@movie_error = @movie["Error"]
	 	else
	  		@movie_title = @movie["Title"]
	 		@movie_cast = @movie["Actors"]
			@movie_poster = @movie["Poster"]
			@movie_plot = @movie["Plot"]
			@movie_time = @movie["Runtime"]
			@movie_director = @movie["Director"]
			@movie_genre = @movie["Genre"]
			@movie_year = @movie["Year"]
			@movie_awards = @movie["Awards"]
			@movie_error = @movie["Error"]
		end
	end
 	erb :title
end


