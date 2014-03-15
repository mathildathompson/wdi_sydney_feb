require 'pry'
require 'pry-debugger'
require 'sinatra'
require 'sinatra/reloader'
require 'httparty'
require 'json'
require 'active_support/all'

get '/movie' do 
	#Search for a list of movies with the :movie_title in it.
	if params[:movie_title] 
		url = "http://www.omdbapi.com/?s=#{params[:movie_title].gsub(' ','+')}"
		response = HTTParty.get url
		json = JSON(response)
		@movies = json["Search"]
		@movie_details = json
	end

	erb :movie
end

get '/:id' do
	if params[:id]
		#Look for info about movie
		url = "http://www.omdbapi.com?i=#{params[:id]}"
		response = HTTParty.get url
		@movie_details = JSON(response)

		#Add the movie details to the database.
		f = File.new("movie_database.csv", 'a+')
		f.puts(@movie_details)
		f.puts("")
		f.puts("----------------------------------------------")
		f.puts("")
		f.close

		#if movie doesn't exist in database, append to file
		if f.nil? == false
			f = File.open("movie_database.csv", 'r')
			@movies_info = {}

			f.each do |line|
				@movies_info.keys
			end
			f.close
		end

		@movie_title = @movie_details["Title"]
		@movie_plot = @movie_details["Plot"]
		@movie_poster = @movie_details["Poster"]
		@movie_director = @movie_details["Director"]
		@movie_actors = @movie_details["Actors"]
		@movie_runtime = @movie_details["Runtime"]
		@movie_genre = @movie_details["Genre"]
		@movie_awards = @movie_details["Awards"]

	end
	erb :title
end






