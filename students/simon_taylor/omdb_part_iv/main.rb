require 'pry'

require 'sinatra'
require 'sinatra/reloader'

require 'active_support/all' #allows the .present? method

require 'httparty'
require 'JSON'

require 'uri' #allows conversion to url friendly string

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
  if @movie.nil?

        #puts a mesage that this movie is new, and API call must be made
    puts "--------------------------------------------------------------"
    puts "New Movie Detected, fetching data using OMDbAPI..."

    #generate our entire url
    url = "http://www.omdbapi.com/?i=#{ movie_id }" 

    #reformat to JSON format
    response = HTTParty.get(url)
    movie_json = JSON(response)

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

    #create a copy of @movie hash, so this can be altered to be SQL friendly to save in the database
    movie_save = @movie.clone

    movie_save.each_value do |v|
      v.gsub!("'","''")
    end

    sql = "INSERT INTO movies ('imdb_id','title','genre','imdb_rating','director','writer','actors','plot','awards','poster')
      VALUES('#{movie_save["imdb_id"]}','#{movie_save["title"]}','#{movie_save["genre"]}','#{movie_save["imdb_rating"]}','#{movie_save["director"]}',
      '#{movie_save["writer"]}','#{movie_save["actors"]}','#{movie_save["plot"]}','#{movie_save["awards"]}','#{movie_save["poster"]}');"
    sql.gsub!("\n",'')

    query_db(sql)

    # binding.pry

    #puts a message that this movie has now been saved in the database
    puts "Movie #{ @movie["title"] } has been saved in the database"
    puts "--------------------------------------------------------------"

  else

    #puts a mesage that this movie has been retrieved (for debugging)
    puts "--------------------------------------------------------------"
    puts "Movie #{ @movie["title"] } exists in Database, loading..."
    puts "--------------------------------------------------------------"

  end

  erb :title
end

def query_db(sql)
  db = SQLite3::Database.open('movies.db')
  db.results_as_hash = true
  puts "----------------------------------------------------------------"
  puts "Executing SQL: #{ sql }"
  puts "----------------------------------------------------------------"
  db.execute(sql)
end

# Features to add...
#Add 404 page
#tidy up styling
#Pass the previous search to the title page to enable a proper back button
#monkey patch hash so it can replace single quote with double quote