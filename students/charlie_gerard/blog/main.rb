require 'pry'
require 'sinatra'
require 'sinatra/reloader'
require 'active_record'
require 'protected_attributes'
require 'pg'
require 'sqlite3'

ActiveRecord::Base.establish_connection(
  :adapter => 'postgresql',
  :host => 'localhost',
  :pull => 8,
  :post => 5432,
  :username => 'charlieg',
  :password => "",
  :database => "blogs.db"
  )

ActiveRecord::Base.logger = Logger.new(STDOUT)

class Blog < ActiveRecord::Base
  attr_accessible :title, :copy, :author, :image
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
  post.image = params[:image]
  post.copy = params[:copy]
  post.author = params[:author]
  post.save
  redirect to('/')
end

post '/posts/update' do
  post = Blog.find params[:id]
  post.title = params[:title]
  post.copy = params[:copy]
  post.image = params[:image]
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


get'/contact' do
	erb :contact
end



def query_db(sql)
  db = PG.connect(:dbname => 'blogs.db', :host => 'localhost')
  result = db.exec(sql)
  db.close
  result
end