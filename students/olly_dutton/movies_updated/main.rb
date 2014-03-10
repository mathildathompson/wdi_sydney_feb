require 'pry'
require 'sinatra'
require 'sinatra/reloader'
require 'httparty'
require 'json'


get '/movie' do
    
    if params[:title]

        # Prepopulates a hash of every movie we've seen so far.
        f = File.open('movie_db.csv', 'r')         
        @movies = {}
        f.each do |line|
            movie = JSON(line)
        # The movie hash gets passed into the @movies hash with the movie title as the key
            @movies[ movie['Title'].downcase ] = movie
        end
 
        f.close

        #new variable @movie is equal to the movies hash which the user has searched for - get data from db
        @movie = @movies[ params[:title].downcase ]
        
        #if that movie doesnt exist in our db, then initiate JSON request and append data to file
        if @movie.nil?
            url = "http://www.omdbapi.com/?t=#{params[:title].gsub(' ', '+')}"
            response = HTTParty.get(url)
            @movie = JSON(response)
            f = File.new("movie_db.csv", 'a+')
            f.puts(response)
            f.close
        end

        #in either case the following values will be outputted from the movie.erb file
        @movie_title = @movie['Title']
        @movie_poster = @movie['Poster']
        @movie_plot = @movie['Plot']
        @director = @movie['Director']
        @year = @movie['Year']
        @rating = @movie['imdbRating']
        @votes = @movie['imdbVotes']
        @actors = @movie['Actors']

    end

    erb :movie

end