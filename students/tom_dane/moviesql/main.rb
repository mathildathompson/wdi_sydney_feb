require 'pry'
require 'sinatra'
require 'sinatra/reloader'
require 'httparty'
require 'json'
require 'sqlite3'

get '/' do


    erb :movies

end


get '/movies' do
  
 
     if params[:movie_name] && params[:movie_name] != ''

      @title = params[:movie_name]
      url = "http://www.omdbapi.com/?t=#{@title.gsub(' ', '+')}"
      response = HTTParty.get(url)
      @movie = JSON(response)
      @movie_error = @movie['Error']
      params[:poster] = JSON(response)['Poster']
      params[:imdb_rating] = JSON(response)['imdbRating']
      @imdb_id = JSON(response)['imdbID']


      sql = "INSERT INTO movies (name, imdb_rating, poster)
            VALUES ('#{params[:movie_name]}', '#{params[:imdb_rating]}', '#{params[:poster]}');"
      
      query_db(sql)

      @cached = query_db('SELECT name FROM movies;')
   
            
      end
       
      erb :movies

end


get '/contact' do

    erb :contact

end

get '/about' do

    erb :about

end

get '/search' do
  if params[:search_name] && params[:search_name] != ''
    @search = params[:search_name]
    url = "http://www.omdbapi.com/?s=#{@search}"
    response = HTTParty.get(url)
    @movie_list = JSON(response)['Search']
    @movie_list_error = JSON(response)['Error']
   
  end  

  erb :search

          
end


post '/save' do
  
end


get '/cached' do

  @films = query_db('SELECT * FROM movies;')

  erb :cached

end



get '/movies/:id' do

  @imdb_id = params[:id]
  url = "http://www.omdbapi.com/?i=#{@imdb_id}"
  response = HTTParty.get(url)
  @movie = JSON(response)



  erb :movies_by_id


end

def query_db(sql)
  db = SQLite3::Database.open('films.db')
  db.results_as_hash = true
  db.execute(sql)
end
