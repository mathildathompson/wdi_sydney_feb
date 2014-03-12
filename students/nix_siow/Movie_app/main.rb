require 'pry'
require 'sinatra'
require 'sinatra/reloader'
require 'httparty'


get '/movie_app' do
    @title = params[:title]
    if @title
        url = "http://www.omdbapi.com/?i=&s=#{@title.gsub(' ', '+')}"
        response = HTTParty.get url

        binding.pry
        @result = JSON(response)
    end

    erb :query
end


get '/movie' do
    @title = params['title']
    if @title
        url = "http://www.omdbapi.com/?t=#{@title.gsub(' ', '+')}"
        response = HTTParty.get url
        @result = JSON(response)
        
        @movie_title = @result['Title']
        @movie_director = @result['Director']
        @movie_plot = @result['Plot']
        @movie_poster = @result['Poster']
        # binding.pry
    end

    erb :movie
end


get '/contact' do
  erb :contact
end

post '/contact' do
  "Thank you!"
end

get '/feature1' do
  # erb :feature1
    "Coming Soon! Stay tune."
end

get '/feature2' do
  # erb :feature2
    "Coming Soon! Stay tune."
end
