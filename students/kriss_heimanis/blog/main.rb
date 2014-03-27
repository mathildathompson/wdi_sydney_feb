require 'sinatra'
require 'sinatra/reloader'
require 'sqlite3'
require 'pry'
require 'pg'
require 'active_record'
require 'protected_attributes'

ActiveRecord::Base.establish_connection(
  :adapter => "postgresql",
  :host => "localhost",
  :pool => 8,
  :username => 'kriss', #your postgres.app username
  :password => "",
  :database => "blog"
)

class Blog < ActiveRecord::Base
  attr_accessible :title, :copy, :mood, :current_plaything, :author, :image
end

before do
  @moods = Blog.uniq.pluck(:mood)
end

get '/' do
  @blogs = Blog.all
  erb :home
end

get '/post/new' do
  erb :blog_new
end

get '/post/:id' do
  @blog = Blog.find params[:id]
  erb :blog
end

get '/post/:id/edit' do
  @blog = Blog.find params[:id]
  erb :blog_edit
end

post '/post/update' do
  blog = Blog.find params[:id]
  blog.title = params[:title]
  blog.copy = params[:copy]
  blog.mood = params[:mood]
  blog.current_plaything = params[:current_plaything]
  blog.author = params[:author]
  blog.image = params[:image]
  blog.save
  redirect to("/post/#{ blog.id }")
end

post '/post/create' do
  blog = Blog.new
  blog.title = params[:title]
  blog.copy = params[:copy]
  blog.mood = params[:mood]
  blog.current_plaything = params[:current_plaything]
  blog.author = params[:author]
  blog.image = params[:image]
  blog.save
  redirect to("/post/#{ blog.id }")
end

get '/post/:id/delete' do
  @blog = Blog.find params[:id]
  @blog.destroy
  redirect to('/')
end

get '/post/moods/:mood' do
  @blog = Blog.where(:mood => params[:mood])
  erb :mood
end

def query_db(sql)
  db = PG.connect(:dbname => "blog", :host => "localhost" )
  puts "SQL: #{ sql }"
  results = db.exec(sql)
  db.close
  results
end