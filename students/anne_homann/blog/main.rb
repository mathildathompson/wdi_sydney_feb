require 'sinatra'
require 'sinatra/reloader'
require 'pg'
require 'active_record'
require 'protected_attributes'
require 'pry'

ActiveRecord::Base.establish_connection(
  :adapter => "postgresql",
  :host => "localhost",
  :username => 'annehomann', #your postgres.app username
  :password => "",
  :database => "blog"
)

ActiveRecord::Base.logger = Logger.new(STDOUT)

class Blog <ActiveRecord::Base
  attr_accessible :title, :copy, :author
end

before do
  @authors = Blog.uniq.pluck(:author)
end

get '/' do
  erb :home
end

get '/blogs' do
  @blogs = Blog.all
  erb :blogs
end

get '/blogs/new' do
  erb :new_blog
end

post '/blogs/create' do
  blog = Blog.new
  blog.title = params[:title]
  blog.copy = params[:copy]
  blog.author = params[:author]
  blog.save
  redirect to('/blogs')
end

post '/blogs/update' do
  blog = Blog.find params[:id]
  blog.title = params[:title]
  blog.copy = params[:copy]
  blog.author = params[:author]
  blog.save
  redirect to("/blogs/#{ blog.id }")
end

get '/blogs/:id' do
  results = query_db("SELECT * FROM blogs WHERE id=#{ params[:id] }")
  @blog = results.first
  erb :blog
end

get '/blogs/:id/edit' do
  @blog = Blog.find params[:id]
  erb :edit_blog
end

get '/blogs/:id/delete' do
  blog = Blog.find params[:id]
  blog.destroy
  redirect to('/blogs')
end

get '/blogs/title/:title' do
  @blogs = Blog.where(:title=>params[:title])
  erb :blogs
end

