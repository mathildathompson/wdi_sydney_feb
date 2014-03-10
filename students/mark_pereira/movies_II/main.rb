require 'pry'
require 'sinatra'
require 'sinatra/reloader'
require 'httparty'
require 'JSON'
require 'active_support/all'
require 'uri' 

#----------------------

get '/' do
  
  @status = "no search"

  search = params[:search]

  if search.present?
    search = URI.escape(search)

    url = "http://www.omdbapi.com/?s=#{ search.downcase }"

    response = HTTParty.get(url)
    json = JSON(response)

    if json["Error"] == "Movie not found!"
      @status = "no results"
    else
      @status = "found results"
      @movies = json["Search"]
    end
    
  end

  erb :home
end

#----------------------

get '/contact_us' do
  erb :contact_us
end

#----------------------


get '/title/:id' do

  imdbID = params[:id]


  url = "http://www.omdbapi.com/?i=#{ imdbID }" 


  response = HTTParty.get(url)
  @movie = JSON(response)

  erb :title

end