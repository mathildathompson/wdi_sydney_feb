# Features to add...
# Add 404 page
# Pass the previous search to the title page to enable a proper back button
# Add Creation Date to the movies table and use this to show last ten movies viewed
# monkey patch hash so it can replace single quote with double quote

require 'pry'

#required to run the web server
require 'sinatra'
require 'sinatra/reloader'

require 'active_support/all' #allows the .present? method

#required to fetch data from OMDbAPI
require 'httparty'
require 'JSON'

require 'uri' #allows conversion to url friendly string

#required for database connection and executing SQL
require 'sqlite3'

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

  #set movie id as a variable
  movie_id = params[:id]

  #perform database query to retrieve movie record
  @movie = query_db("SELECT * FROM movies WHERE imdb_id = '#{movie_id}';").first

  #check if query result was found?
  if @movie.nil? #result was not found, so we need to fetch the data

    #puts a mesage that this movie is new, and API call must be made
    puts "--------------------------------------------------------------"
    puts "New Movie Detected, fetching data using OMDbAPI..."

    #generate our url to fetch the movie data from OMDbAPI
    url = "http://www.omdbapi.com/?i=#{ movie_id }" 

    #reformat to JSON format
    response = HTTParty.get(url)
    movie_json = JSON(response)

    #generate an @movie hash in the same format as retrieved from our database
    @movie = {
      "imdb_id" => movie_json["imdbID"],
      "title" => movie_json["Title"],
      "genre" => movie_json["Genre"],
      "imdb_rating" => movie_json["imdbRating"],
      "director" => movie_json["Director"],
      "writer" => movie_json["Writer"],
      "actors" => movie_json["Actors"],
      "plot" => movie_json["Plot"],
      "awards" => movie_json["Awards"],
      "poster" => movie_json["Poster"]
    }

    #create a copy of @movie hash to use to 'save' the movie in our database, this can be altered without affecting the view (.erb)
    movie_save = @movie.clone

    #swap out apostrophes with double apostrophe so SQL OK
    movie_save.each_value do |v|
      v.gsub!("'","''")
    end

    #generate the sql statement to insert this movie to the database
    sql = "INSERT INTO movies ('imdb_id','title','genre','imdb_rating','director','writer','actors','plot','awards','poster')
      VALUES('#{movie_save["imdb_id"]}','#{movie_save["title"]}','#{movie_save["genre"]}','#{movie_save["imdb_rating"]}','#{movie_save["director"]}',
      '#{movie_save["writer"]}','#{movie_save["actors"]}','#{movie_save["plot"]}','#{movie_save["awards"]}','#{movie_save["poster"]}');"

    #tidy up line breaks in the query
    sql.gsub!("\n",'')

    #execute the query to add this movie to our database
    query_db(sql)

    #puts a message that this movie has now been saved in the database
    puts "Movie #{ @movie["title"] } has been saved in the database"
    puts "--------------------------------------------------------------"

  else #result was found, so we can use the record already retrieved from the database (@movie)

    #puts a mesage that this movie has been retrieved (for debugging)
    puts "--------------------------------------------------------------"
    puts "Movie #{ @movie["title"] } exists in Database, loading..."
    puts "--------------------------------------------------------------"

  end

  erb :title
end

#code to connect to the database
def query_db(sql)
  #specifies the path of our database file
  db = SQLite3::Database.open('movies.db')

  #forces results returned to be hash format
  db.results_as_hash = true

  #puts a message showing the SQL statement to be executed
  puts "----------------------------------------------------------------"
  puts "Executing SQL: #{ sql }"
  puts "----------------------------------------------------------------"

  #execute the query and return the result
  db.execute(sql)
end

