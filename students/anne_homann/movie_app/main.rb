require 'pry'
require 'sinatra'
require 'sinatra/reloader'
require 'httparty'
require 'json'



get '/movies' do
  # @title = params[:movie_title]
  # @poster = params[:poster_image]

if params[:movie_title]

  url = "http://www.omdbapi.com/?t=#{params[:movie_title].gsub(' ', '+')}"
  response = HTTParty.get(url)
  @movie = JSON(response)
  @movie_title = @movie["Title"]
  @movie_director = @movie['Director']
  @movie_poster = @movie['Poster']
  @movie_year = @movie["Year"]
  binding.pry
end

erb :films

end




