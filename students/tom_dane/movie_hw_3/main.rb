require 'pry'
require 'sinatra'
require 'sinatra/reloader'
require 'httparty'
require 'json'

#in this assignment, we will use sinatra's file.io to save our movie requests in a text file. 

#the general case to this is: 


#joels code

# in this case, we'll create a text file blah. auto.

# then, we say f = File.new

# then we do something like puts.f "#{}"

# going to need joel's links.erb for the weekend lab.
# basically we use a .csv file, and loop through it to print links.
# for the receipts example, we put the file save logic into the post do section. using params to write to relevant data.
# we set a variable to the value File.new(name of file, method 'w' or 'r' or 'a' for append etc).
# then we do variabl.puts
# we use the plus sign to create file if doesnt exist. t

# and we set the file to have read and write files. 

# the next step is for it to display a custom page when there's a match.'

##if the user types gibberish, how do i check for that? 

get '/' do


  # f = File.open('cache.csv', 'a+')
  # @links = []
  # f.each do |line|
  #   parts = line.split(',')
  #   @links.push({
  #     :url => parts[0],
  #     :text => parts[1] || parts[0]
  #   })
  # end

  # f.close


    erb :movies

end


# f = File.new('database.txt', 'a+')

# print "Write name to file? (y/n) "
# response = gets.chomp.downcase

# while response == 'y'
#   print "Enter name, age, gender: "
#   f.puts(gets.chomp)

#   print "Write name to file? (y/n) "
#   response = gets.chomp.downcase
# end

# f.close



get '/movies' do
 
  # @checks_text_file = searches text file for a result. just like @url. 
  # @title = params[:movie_name]

  # if @title == @checks_text_file 

  # erb :cached



  # else

     if params[:movie_name] && params[:movie_name] != ''

      @title = params[:movie_name]
      url = "http://www.omdbapi.com/?t=#{@title.gsub(' ', '+')}"
      response = HTTParty.get(url)
      @movie = JSON(response)
      @movie_error = @movie['Error']
      @poster_url = JSON(response)['Poster']
      @imdb_rating = JSON(response)['imdbRating']   

      f = File.new("cache.csv", 'a+')
      f.puts("")
      f.puts("#{ params[:movie_name] },#{@imdb_rating},#{@poster_url}")
     
      f.close
     
      end
       
      erb :movies

end


get '/contact' do

    erb :contact

end

get '/about' do

    erb :about

end

get '/search' do
  if params[:search_name] && params[:search_name] != ''
    @search = params[:search_name]
    url = "http://www.omdbapi.com/?s=#{@search}"
    response = HTTParty.get(url)
    @movie_list = JSON(response)['Search']
    @movie_list_error = JSON(response)['Error']
   
  end  

  erb :search

          
end

## okay awesome! we now have the search field writing the movie name to the text file! That's awesome. 

# so the next step is to get the program to display the contents of the text file on the page

# using code like this: 



get '/cached' do
  f = File.open('cache.csv', 'r')
  @links = []
  f.each do |line|
    parts = line.split(',')
    @links.push({
      :movie_name => parts[0],
      :imdb_rating => parts[1],
      :poster => parts [2] 
    })
  end

  f.close

  erb :cached

end


#after this is working, user can search and add info to database. then, another user 
#can display taht info on page. then, there are only 2 more steps:
#enable checking: so if info is in database already, seerve from text doc.
#store poster in text file. or at least remember the url. 

# FYI to anyone who's having difficulty reading a file
# you need to use two blocks
# File.open("etc/SERVER_LIST") do |f|
#     f.each_line do |line|
#       # do something here
#     end
# end
# and also, when using each_line, you probably want to chomp the
#  'line' as it has a carriage return at the end 


get '/movies/:id' do

  @imdb_id = params[:id]
  url = "http://www.omdbapi.com/?i=#{@imdb_id}"
  response = HTTParty.get(url)
  @movie = JSON(response)



  erb :movies_by_id


end



#first we ask them to input the name of the move
#then we take that as the param, 
#and put it into a variable called title. 

#then we set the value of url to be the query
#address  with the title subbed in. 


