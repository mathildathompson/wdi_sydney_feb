require 'pry'

require 'sinatra'
require 'sinatra/reloader'

require 'active_support/all' #allows the .present? method

require 'httparty'
require 'JSON'

require 'uri' #allows conversion to url friendly string

get '/' do
  title = params[:title]

  if title.present?

    #convert to URL friend string
    title = URI.escape(title)

    #puts "TEST TITLE: #{title}"

    url = "http://www.omdbapi.com/?t=#{ title.downcase }"

    #puts "TEST URL: #{url}"

    response = HTTParty.get(url)
    @movie = JSON(response)

    #binding.pry
    
  end

  erb :movie
end

#binding.pry