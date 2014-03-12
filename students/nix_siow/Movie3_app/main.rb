require 'pry'
require 'sinatra'
require 'sinatra/reloader'
require 'httparty'

# --------------------------------------------------------------
# to get movies result based on keyword search. And write it in .txt file as local database.
get '/movie_app' do

    @title = params[:title]
    if @title
        f = File.open('queryresult.txt', 'r')
        @movie = {}

        f.each do |line|
            movie = JSON(line)
            @movie[movie["Search"][0]["Title"]] = movie["Search"]
        end
        puts @movie

        @result = @movie[params['title']]
        # binding.pry
        if @result == nil
            url = "http://www.omdbapi.com/?i=&s=#{@title.gsub(' ', '+')}"
            response = HTTParty.get url
            result = JSON(response)
            @result = result['Search']
            f = File.open("queryresult.txt", 'a+')
            f.puts(response)
            f.close
        end
    end

    erb :query
end


# --------------------------------------------------------------
# to get individual movie details. And write it on .txt file as local database.
get '/movie' do
    f = File.open('movieresult.csv', 'r')
    @movie = {}

    f.each do |line|
        movie = JSON(line)
        @movie[movie["Title"].downcase] = movie
    end

    @result = @movie[params['title'].downcase]
    if @result == nil
        @title = params['title']
        if @title
            url = "http://www.omdbapi.com/?t=#{@title.gsub(' ', '+')}"
            response = HTTParty.get url
            @result = JSON(response)

            f = File.open("movieresult.csv", 'a+')
            f.puts(response)
            f.close
        end
    end
            
            @movie_title = @result['Title']
            @movie_director = @result['Director']
            @movie_plot = @result['Plot']
            @movie_poster = @result['Poster']

        erb :movie
end


# --------------------------------------------------------------
# others pages.

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
