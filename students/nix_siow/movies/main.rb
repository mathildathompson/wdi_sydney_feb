require 'pry'
require 'sinatra'
require 'sinatra/reloader'
require 'httparty'


get '/movie_app' do
    @title = params[:title]
    if @title
        url = "http://www.omdbapi.com/?t=#{@title.gsub(' ', '+')}"
        response = HTTParty.get url
        @result = JSON(response)
        @movie_title = @result['Title']
        @movie_director = @result['Director']
        @movie_plot = @result['Plot']
        @movie_poster = @result['Poster']

        binding.pry
    end

    erb :query
end

