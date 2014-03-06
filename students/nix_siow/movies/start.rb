
# main.rb:
name = params[:title] # name = #params[:title]
url = "http://www.omdbapi.com/?t=#{name.gsub(' ', '+')}"
#require 'httparty'
response = HTTParty.get url
@movie = JSON(response)
 
# movie.erb:
<h1><%= @movie['Title'] %></h1>
<img src="<%= @movie['Poster'] %>">

@movie['Language']
@movie['Metascore']
@movie['imdbRating']
@movie['Plot']
@movie['Actors']
@movie['Awards']