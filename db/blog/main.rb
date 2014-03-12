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
  :username => 'tomdane',
  :password => 'okayme',
  :database => "posts"
)
#ActiveRecord::Base.logger = Logger.new(STDOUT)

class Post < ActiveRecord::Base
  attr_accessible :title, :content
end

before do
  @titles = Post.uniq.pluck(:title)
end

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

post '/posts/create' do
  post = Post.new
  post.title = params[:title]
  post.content = params[:content]
  post.save
  redirect to("/posts/#{ post.id }")
end

post '/posts/update' do
  post = Post.find params[:id]
  post.title = params[:title]
  post.content = params[:content]
  post.save
  redirect to("/posts/#{params[:id]}")
end

get '/posts/:id' do
  @post = Post.find params[:id]
  erb :post
end

get '/posts/:id/edit' do
  @post = Post.find params[:id]
  erb :edit_post
end

get '/posts/:id/delete' do
  post = Post.find params[:id]
  post.destroy
  redirect to('/posts')
end

get '/posts/title/:title' do
  @posts = Post.where(:title => params[:title])
  erb :posts
end

