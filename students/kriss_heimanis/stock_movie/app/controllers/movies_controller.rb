class MoviesController < ApplicationController
  
  def movie
  end

  def search
    @title = params[:title]
    url = "http://www.omdbapi.com/?s=#{@title}"
    
    # connect to server via HTTParty and get result
    begin
      response = HTTParty.get url
    rescue
      redirect_to "/movies/search?connection=failed"   
    end
    
    # do somehting with the results from the server
    @movie = JSON(response)
    @movie_list = @movie["Search"]
  end

  def title
    @id = params[:id]
    url = "http://www.omdbapi.com/?i=#{@id}"
    
    # use the URL to get the info you want and convert to a nice hash via json
    begin
      response = HTTParty.get url
    rescue
      redirect_to "/movies/search?connection=failed"
    end
    @movie = JSON(response)
    name = @movie['Title'].gsub(' ','%20')

    redirect_to "/movies/#{name}"
  end

  def name
    @title = params[:name].gsub(' ','%20')
    url = "http://www.omdbapi.com/?t=#{@title}"
    
    # use the URL to get the info you want and convert to a nice hash via json
    begin
      response = HTTParty.get url
    rescue
      redirect_to "/movies/search?connection=failed"
    end
    
    @movie = JSON(response)
  end

end