require 'pry'

require 'sinatra'
require 'sinatra/reloader'

require 'active_support/all' #allows the .present? method

require 'httparty'
require 'JSON'

require 'uri' #allows conversion to url friendly string

#include necessary files
require_relative 'movie_database'
require_relative 'movie'

#setup our database
@@database = MovieDatabase.new

#----------------------
# HOME AND SEARCH PAGE
#----------------------

get '/' do
  
  #default status (used in generating the .erb)
  @status = "no search"

  #set search param as a variable
  search = params[:search]

  #if a search was performed...
  if search.present?

    #convert to URL friend string
    search = URI.escape(search)

    #generate our entire url
    url = "http://www.omdbapi.com/?s=#{ search.downcase }"

    #set movies (is an array)
    response = HTTParty.get(url)
    json = JSON(response)

    #check if search performed OK, use status to alter view (erb)
    if json["Error"] == "Movie not found!"
      @status = "no results"
    else
      @status = "found results"
      @movies = json["Search"]
    end
    
  end

  erb :home
end

#----------------------
# CONTACT PAGE
#----------------------

get '/contact' do
  erb :contact
end

#----------------------
# SPECIFIC TITLE PAGE
#----------------------

get '/title/:id' do

  #set id as a variable
  imdbID = params[:id]

  #check if movie exists in our current database
  if @@database.saved? imdbID
    
    #fetch the movie from the database
    @movie = @@database.movies[imdbID]

    #puts a mesage that this movie has been retrieved (for debugging)
    puts "--------------------------------------------------------------"
    puts "Movie #{ @movie.title } exists in Database, loading..."
    puts "--------------------------------------------------------------"
    
  else

    #puts a mesage that this movie is new, and API call must be made
    puts "--------------------------------------------------------------"
    puts "New Movie Detected, fetching data using OMDbAPI..."

    #generate our entire url
    url = "http://www.omdbapi.com/?i=#{ imdbID }" 

    #reformat to JSON format
    response = HTTParty.get(url)
    movie_json = JSON(response)

    #build our parameters for our movie object from JSON
    movie_params = {
      :imdb_id => movie_json["imdbID"],
      :title => movie_json["Title"],
      :genre => movie_json["Genre"],
      :imdb_rating => movie_json["imdbRating"],
      :director => movie_json["Director"],
      :writer => movie_json["Writer"],
      :actors => movie_json["Actors"],
      :plot => movie_json["Plot"],
      :awards => movie_json["Awards"],
      :poster => movie_json["Poster"]
    }

    #create a new movie object with our movie params
    @movie = Movie.new(movie_params)

    # add this movie to the current loaded database (@@database)
    @@database.movies[@movie.imdb_id] = @movie

    # save this movie in the text file
    @movie.save

    #puts a message that this movie has now been saved in the database
    puts "Movie #{ @movie.title } has been saved in the database"
    puts "--------------------------------------------------------------"

  end

  erb :title
end

# Features to add...
#poster URL is not saved
#Add 404 page
#tidy up styling
#filter out some crappy movie titles