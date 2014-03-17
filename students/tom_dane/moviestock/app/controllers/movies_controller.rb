class MoviesController < ApplicationController

    def movies
    end

    def result

      @title = params[:movie_name]
      url = "http://www.omdbapi.com/?t=#{@title.gsub(' ', '+')}"
      response = HTTParty.get(url)
      @movie = JSON(response)

  end
  

end