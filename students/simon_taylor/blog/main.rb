# To fix:
# Vertically align text on form page
# View Posts page element slightly too large (white at bottom)

require 'pry'

require 'sinatra'
require 'sinatra/reloader'

require 'pg'

#code to allow sinatra to interact with ActiveRecord
require 'active_record'
require 'protected_attributes'

ActiveRecord::Base.establish_connection(
  :adapter => "postgresql",
  :host => "localhost",
  # :pool => 8,
  :username => 'Nizmox', #your postgres.app username
  :password => "",
  :database => "blog"
)

ActiveRecord::Base.logger = Logger.new(STDOUT)

#object to interact with the database (butterflies)
class Post < ActiveRecord::Base
  attr_accessible :title, :copy, :mood, :author, :photo
end

#routes
after { ActiveRecord::Base.connection.close }

get '/' do
  erb :home
end

get '/posts' do
  @posts = Post.all

  erb :posts
end

get '/posts/new' do
  erb :new_post
end

get '/posts/:id/edit' do
  @post = Post.find(params[:id])
  erb :edit_post
end

get '/posts/:id/delete' do
  @post = Post.find(params[:id])
  @post.destroy

  redirect to('/posts')
end

get '/posts/:id' do
  @post = Post.find(params[:id])

  erb :post
end

post '/posts/create' do
  post = Post.new

  post.title = params[:title]
  post.copy = params[:copy]
  post.mood = params[:mood]
  post.author = params[:author]
  post.photo = params[:photo]

  post.save

  redirect to("/posts/#{post.id}")
end

post '/posts/:id/update' do
  post = Post.find(params[:id])

  post.title = params[:title]
  post.copy = params[:copy]
  post.mood = params[:mood]
  post.author = params[:author]
  post.photo = params[:photo]

  post.save

  redirect to("/posts/#{post.id}")

end