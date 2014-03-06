require 'pry'
require 'sinatra'
require 'sinatra/reloader'
require 'HTTParty'
require 'json'

# get title from user and add it to URL
title = "Animal House" #get this from user input
url = "http://www.omdbapi.com/?t=#{title.gsub(' ', '+')}"

# use the URL to get the info you want and convert to a nice hash via json
response = HTTParty.get url
@movie = JSON(response)

# now you can play

puts @movie

puts "Rating = #{movie["Rated"]}"

# if rating is out of 10 create a graphoc using 10 stars and make a mask that covers up the unused percentage by width in CSS

