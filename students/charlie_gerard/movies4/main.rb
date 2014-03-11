require 'pry'
require 'pry-debugger'
require 'sinatra'
require 'sinatra/reloader'
require 'httparty'
require 'json'
require 'active_support/all'
require 'sqlite3'

#-------------------- HOMEPAGE AND SEARCH RESULT PAGE --------------------

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

#---------------------------- MOVIE PAGE ---------------------------------

get '/:id' do
	if params[:id]
		#Search in database for info related to the movie with the id #{params[:id]}.
		result = query_db("SELECT * FROM movies WHERE IMDBID='#{params[:id]}'")
		@movie_details = result[0]
		
		#If the database does not contain any info about this movie, add it.
		if @movie_details == nil
			#Look for info about movie
			url = "http://www.omdbapi.com?i=#{params[:id]}"
			response = HTTParty.get url
			@movie_details = JSON(response)

			@movie_details[1] = @movie_details["Title"]
			@movie_details["Plot"]
			@movie_details["Poster"]
			@movie_details["Director"]
			@movie_details["Actors"]
			@movie_details["Runtime"]
			@movie_details["Genre"]
			@movie_details["Awards"]

			#Put all the info we need into a database.
			sql = "INSERT INTO movies (title, actors, director, year, poster, plot, genre, awards, imdbid)
					VALUES ('#{@movie_details["Title"]}', 
							'#{@movie_details["Actors"]}', 
							'#{@movie_details["Director"]}', 
							'#{@movie_details["Runtime"]}', 
							'#{@movie_details["Poster"]}', 
							'#{@movie_details["Plot"]}', 
							'#{@movie_details["Genre"]}', 
							'#{@movie_details["Awards"]}',
							'#{@movie_details["imdbID"]}');"
			query_db(sql)
		end
	 end
	erb :title
end

def query_db(sql)
	db = SQLite3::Database.open('movies.db')
	db.results_as_hash = true
	puts "SQL: #{sql}"
	db.execute(sql)
end





