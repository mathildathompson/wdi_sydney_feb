require 'pry'
require 'sinatra'
require 'sinatra/reloader'
require 'httparty'
require 'json'
require 'sqlite3'

get '/movies' do
   #this creates an instance variable @stock_name from user input. params are a hash where the key "stock" from <input name="stock" type="text" placeholder="stocks should show here">. It never changes. The value is the user input, which changes.
  if params[:movie_name]
    url = "http://www.omdbapi.com/?s=#{params[:movie_name].gsub(' ', '+')}" 
    response = HTTParty.get(url) #you only need @, if you want to use the variable elsewhere. The response variable will never exist anywhere else
    json = JSON(response)
    @movies = json["Search"]
  else
    @blank_page = "Please choose a movie above."
  end

  erb :movies
end


get '/titles/:title' do

  db = SQLite3::Database.open('movies.db')
  @movie = db("SELECT * FROM movies WHERE movie_title=#{params[:title]}")
  #the below is what's returned for "Alien". Somehow, I have to manipulate it into useable variables.
  #2|Won 1 Oscar. Another 12 wins & 18 nominations.|Director: Ridley Scott|Alien|The commercial vessel Nostromo receives a distress call from an unexplored planet. After searching for survivors, the crew heads home only to realize that a deadly bioform has joined them.|http://ia.media-imdb.com/images/M/MV5BMTk3NzkwMjA3OV5BMl5BanBnXkFtZTYwMTIwOTk2._V1_SX300.jpg|was released on 22 Jun 1979.|Writers: Dan O Bannon (story), Ronald Shusett (story), Dan O Bannon (screenplay)
  @movie.split("|") do |x|
      movies = []
      movies.push(x)

      @awards = movies(1)
      @director = movies(2)
      @movie_title = movies(3)
      @plot_header = movies(4)
      @plot = movies(5)
      @poster = movies(6)
      @released = movies(7)
      @writer = movies(8)
    end
  


   @movie = @movies[ params[:title].downcase ]

   # this code only runs if it @movie = nil... in otherwords, it's not in file
   if @movie == nil
      url = "http://www.omdbapi.com/?t=#{params[:title].gsub(' ', '+')}"
      response = HTTParty.get(url)
      @movie = JSON(response)
      @awards = @movie["Awards"]
      @director = "Director: #{@movie["Director"]}"
      @movie_title = @movie["Title"]
      @plot_header = "Plot"
      @plot = @movie["Plot"]
      @poster = @movie['Poster'] 
      @released = "was released on #{@movie['Released']}."
      @writer = "Writers: #{@movie["Writer"]}" 
  
      db = SQLite3::Database.open('movies.db')
      db.results_as_hash = true
      sql = "INSERT INTO movies (awards, director, movie_title, plot, poster, released, writer) VALUES ('#{@awards.gsub("'", " ")}', '#{@director.gsub("'", " ")}', '#{@movie_title.gsub("'", " ")}', '#{@plot.gsub("'", " ")}', '#{@poster.gsub("'", " ")}', '#{@released.gsub("'", " ")}', '#{@writer.gsub("'", " ")}');"
      db.execute(sql)
    
    end
        
  
  erb :titles
end

get '/contact' do
  erb :contact
end

get '/useless' do
  erb :useless
end




