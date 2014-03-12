require 'sinatra'
require 'sinatra/reloader'
require 'pg'
require 'active_record'
require 'protected_attributes'
require 'pry'

ActiveRecord::Base.establish_connection(
  :adapter => "postgresql",
  :host => "localhost",
  :port => 5432,
  :pool => 8,
  :username => 'Froese',
  :password => "",
  :database => "blog"
)

class Blog < ActiveRecord::Base
  attr_accessible :title, :copy, :photo, :mood
end

get '/' do
  erb :home
end

get '/posts' do
  @posts = Blog.all
  erb :posts
end

get '/posts/new' do
  erb :new_post
end

post '/posts/create' do
  post = Blog.new
  post.title = params[:title]
  post.copy = params[:copy]
  post.photo = params[:photo]
  post.mood = params[:mood]
  post.save
  redirect to("/posts/#{ post.id }")
end

post '/posts/update' do
  post = Blog.find params[:id]
  post.title= params[:title]
  post.copy = params[:copy]
  post.photo = params[:photo]
  post.mood = params[:mood]
  post.save
  redirect to("/posts/#{params[:id]}")
end

get '/posts/:id' do
  @post = Blog.find params[:id]
  erb :post
end

get '/posts/:id/edit' do
  @post = Blog.find params[:id]
  erb :edit_post
end

get '/posts/:id/delete' do
  post = Blog.find params[:id]
  post.destroy
  redirect to('/posts')
end

get '/posts/title/:title' do
  @posts = Blog.where(:title => params[:title])
  erb :posts
end

