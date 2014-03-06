require 'pry'
require 'sinatra'
require 'sinatra/reloader'
require 'HTTParty'
require 'json'

get "/movie" do

  @title = params[:title]
  if @title
    url = "http://www.omdbapi.com/?t=#{@title.gsub(' ', '+')}"
    # use the URL to get the info you want and convert to a nice hash via json
    response = HTTParty.get url
    @movie = JSON(response)
  end

  erb :movie
end