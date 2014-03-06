require 'pry'

require 'sinatra'
require 'sinatra/reloader'

require 'active_support/all' #allows the .present? method

require 'httparty'
require 'JSON'

require 'uri' #allows conversion to url friendly string

#----------------------
# HOME AND SEARCH PAGE
#----------------------

get '/' do
  
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

    #check if search performed OK
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
# CONTACT PAGE
#----------------------

get '/contact' do
  erb :contact
end

#----------------------
# SPECIFIC TITLE PAGE
#----------------------

get '/title/:id' do

  #set id as a variable
  imdbID = params[:id]

  #generate our entire url
  url = "http://www.omdbapi.com/?i=#{ imdbID }" 

  #set movies (is an array)
  response = HTTParty.get(url)
  @movie = JSON(response)

  # binding.pry

  erb :title
end