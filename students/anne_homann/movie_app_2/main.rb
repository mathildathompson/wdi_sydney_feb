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
  f=File.open("movies.csv", 'r')
  movies = {}
  f.each do |line|
    result = JSON(line)
    movies[result["imdbID"]] = result
  end

  @film = movies[params["id"]]
    if @film == nil
      url = "http://www.omdbapi.com/?i=#{ id_numb }"
      response = HTTParty.get(url)
      @film = JSON(response)
      f=File.open("movies.csv", 'a+')
      f.puts(response)
      f.close
    end

      erb :title
end
