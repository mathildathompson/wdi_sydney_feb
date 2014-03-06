require 'pry'
require 'sinatra'
require 'sinatra/reloader'
require 'httparty'
require 'json'
require 'uri'

require 'active_support/all'

get '/' do 
  search = params[:search]

  if search.present?
      search = URI.escape(search)
      url = "http://www.omdbapi.com/?s=#{ search.downcase }"
      response = HTTParty.get(url)
      json = JSON(response)
      @movies = json["Search"]    
  end

  erb :home
end

get '/title/:id' do
  id_numb = params[:id]

      url = "http://www.omdbapi.com/?i=#{ id_numb }"
      response = HTTParty.get(url)
      @movie = JSON(response)


      erb :title
end