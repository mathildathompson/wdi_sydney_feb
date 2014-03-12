require 'sinatra'
require 'sinatra/reloader'
require 'pg'
require 'active_record'
require 'protected_attributes'
require 'pry'

ActiveRecord::Base.establish_connection(
  :adapter => "postgresql",
  :host => "localhost",
  :pool => 8,
  :port => 5432,
  :username => 'NixSiow', #your postgres.app username
  :password => "",
  :database => "blogs.db"
)

ActiveRecord::Base.logger = Logger.new(STDOUT)  # to show sql in terminal

class Blog < ActiveRecord::Base
  attr_accessible :title, :content, :photo, :mood
end

get '/' do
  erb :home
end

get '/blog' do
  @blog = Blog.all
  erb :blog
end

get '/blog/new' do
  erb :new_post
end

post '/blog/create' do
  post = Blog.new
  post.title = params[:title]
  post.content = params[:content]
  post.photo = params[:photo]
  post.mood = params[:mood]
  post.save
  redirect to("/blog/#{ post.id }")
end

post '/blog/update' do
  post = Blog.find params[:id]
  post.title = params[:title]
  post.content = params[:content]
  post.photo = params[:photo]
  post.mood = params[:mood]
  post.save
  redirect to("/blog/#{params[:id]}")
end

get '/blog/:id' do
  @blog = Blog.find params[:id] 
  erb :post
end

get '/blog/:id/edit' do
  @post = Blog.find params[:id]
  erb :edit_post
end

get '/blog/:id/delete' do
  post = Blog.find params[:id]
  post.destroy
  redirect to('/blog')
end