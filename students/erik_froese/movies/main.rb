require 'pry'
#require 'pry-debugger'
require 'sinatra'
require 'sinatra/reloader'
require 'httparty'
require 'json'

get '/movies' do
   #this creates an instance variable @stock_name from user input. params are a hash where the key "stock" from <input name="stock" type="text" placeholder="stocks should show here">. It never changes. The value is the user input, which changes.
    if params[:movie_name]
      url = "http://www.omdbapi.com/?t=#{params[:movie_name].gsub(' ', '+')}"
      response = HTTParty.get(url) #you only need @, if you want to use the variable elsewhere. The response variable will never exist anywhere else
      @movie = JSON(response)
      @awards = @movie["Awards"]
      @director = "Director: #{@movie["Director"]}"
      @movie_title = @movie["Title"]
      @plot_header = "Plot"
      @plot = @movie["Plot"]
      @poster = @movie['Poster'] 
      @released = "was released on #{@movie['Released']}."
      @writer = "Writers: #{@movie["Writer"]}"
    else
      @blank_page = "Please choose a movie above."

  end
  erb :movies
end
