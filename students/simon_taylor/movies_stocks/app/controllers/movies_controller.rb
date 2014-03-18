class MoviesController < ApplicationController

  require 'uri'

  def index
  
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
      
    end #end of if search.present? 

    render 'index'

  end #end of index route

  def title

    #set movie id as a variable
    movie_id = params[:id]

    #generate our url to fetch the movie data from OMDbAPI
    url = "http://www.omdbapi.com/?i=#{ movie_id }" 

    #reformat to JSON format
    response = HTTParty.get(url)
    @movie = JSON(response)

    render 'title'

  end #end of title route

end #end of MoviesController