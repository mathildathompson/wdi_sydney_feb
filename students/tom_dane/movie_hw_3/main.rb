require 'pry'
require 'sinatra'
require 'sinatra/reloader'
require 'httparty'
require 'json'

#in this assignment, we will use sinatra's file.io to save our movie requests in a text file. 


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
      @poster_url = JSON(response)['Poster']
      @imdb_rating = JSON(response)['imdbRating']
      @imdb_id = JSON(response)['imdbID']   

      f = File.new("cache.csv", 'a+')
      f.puts("")
      f.puts("#{ params[:movie_name] },#{@imdb_rating},#{@poster_url}")
     
      f.close
     
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

#we now have the search field writing the movie name to the text file! 

# so the next step is to get the program to display the contents of the text file on the page

# using code like this: 



get '/cached' do
  f = File.open('cache.csv', 'r')
  @links = []
  f.each do |line|
    parts = line.split(',')
    @links.push({
      :movie_name => parts[0],
      :imdb_rating => parts[1],
      :poster => parts [2] 
    })
  end

  f.close
 

  erb :cached

end



get '/movies/:id' do

  @imdb_id = params[:id]
  url = "http://www.omdbapi.com/?i=#{@imdb_id}"
  response = HTTParty.get(url)
  @movie = JSON(response)



  erb :movies_by_id


end



