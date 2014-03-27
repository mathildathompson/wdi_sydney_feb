class MovieController < ApplicationController

  def movie
    @title = params['title']
    if @title
        url = "http://www.omdbapi.com/?t=#{@title.gsub(' ', '+')}"
        response = HTTParty.get url
        @result = JSON(response)
        
        @movie_title = @result['Title']
        @movie_director = @result['Director']
        @movie_plot = @result['Plot']
        @movie_poster = @result['Poster']
    end
  end
end