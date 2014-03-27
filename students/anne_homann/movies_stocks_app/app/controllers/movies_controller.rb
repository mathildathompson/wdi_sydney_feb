class MoviesController < ApplicationController

  def search

   search = params[:search]

    if search != nil
        search = URI.escape(search)
        url = "http://www.omdbapi.com/?t=#{ search.downcase }"
        response = HTTParty.get(url)
        json = JSON(response)
        @movies = json
    else
      @blank_page = "Please enter a valid movie"

    end
  end
end