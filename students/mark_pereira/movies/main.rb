require 'pry'
require 'sinatra'
require 'sinatra/reloader'
require 'JSON'
require 'HTTParty'

get '/movie' do	
  if params[:movie_title]

	name =  params[:movie_title]
	url = "http://www.omdbapi.com/?t=#{name.gsub(' ', '+')}"
	response = HTTParty.get(url)
	@movie = JSON(response)
#binding.pry

	@movie_error = @movie["Error"]
		@movie_title = @movie["Title"]
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


#----------------
# binding.pry	

#   if response['Response'] == "False"
#     puts "Could not find your movie"

#   else

#    	@title = response['Title']
#    	@year = response['Year']
#    	@rated = response['Rated']
#     @released = response['Released']
#     @runtime = response['Runtime']
#     @genre = response['Genre']
#     @director = response['Director']
#     @actors = response['Actors']
#     @plot = response['Plot']
#     @poster = response['Poster']	

#   end

#   puts" title is #{@title}, year is #{@year} director is #{@director}"

# get '/movie' do
#   erb :movie
# end 
# end
