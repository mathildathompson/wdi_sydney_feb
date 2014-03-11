require 'pry'

require_relative 'movie'

class MovieDatabase
  attr_accessor :movies

  def initialize
    @movies = {}
    #load our database from the text file
    self.load
  end

  def load
    #to store movie object parameters
    movie_params = {}

    #reads the movies text file
    File.open("movies.txt","r") do |f|
      #loop through each line in our file
      f.each_line do |l|

        #remove line break
        line = l.chomp

        #we've reached the end of a movie in our file, so create the object and add it to movies
        if line == "--end of movie--"

          #create a new movie object passing in our params
          movie = Movie.new(movie_params)

          #add our movie to the movies hash in our movie database
          @movies[movie.imdb_id] = movie
          
          #clear the movie params hash
          movie_params = {}

        #we've found more parameters for an existing movie, so add these to movie_params
        else
          #find position of " || "
          split = line.index(" || ")

          #set key 
          key = line[0..(split - 1)].to_sym

          #set value
          value = line[(split + 4)..line.length]

          #add it to movie_params
          movie_params[key] = value
        end #end of if

      end #end of file - line loop
    end #end of file loop

  end

  #checks to see if this movie has already been saved (requires database to be loaded)
  def saved?(imdb_id)
    @movies.has_key? imdb_id
  end #end of method

end