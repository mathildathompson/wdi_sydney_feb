class MoviesController < ApplicationController
  def movies
    if params[:movie_name]
      url = "http://www.omdbapi.com/?s=#{params[:movie_name].gsub(' ', '+')}" 
      response = HTTParty.get(url) #you only need @, if you want to use the variable elsewhere. The response variable will never exist anywhere else
      json = JSON(response)
      @movies = json["Search"]
    else
      @blank_page = "Please choose a movie above."
    end
  end

  def title
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
  end
end

