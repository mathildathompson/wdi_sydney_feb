require 'pry'
require 'sinatra'
require 'sinatra/reloader'
require 'pg'
require 'active_record'
require 'protected_attributes'

ActiveRecord::Base.establish_connection(
  :adapter => "postgresql",
  :host => "localhost",
  :port => 5432,
  :pool => 8,
  :username => 'markpereira', #your postgres.app username
  :password => "",
  :database => "blog"
  )

 ActiveRecord::Base.logger = Logger.new(STDOUT)

 class Blog < ActiveRecord::Base
 	attr_accessible :title, :copy, :mood, :currently_playing, :author
 end
 
 # before do
 # 	@mood = post.uniq.pluck(:mood)
 # end	

 get '/' do
 	erb :home
 end	

 get '/post_list' do
 	@post_list = Blog.all
 	erb :post_list
 end

 get '/post_list/new' do
 	erb :new_post
 end	

 post '/post_list/create' do
 #binding.pry	
   post = Blog.new
   post.title = params[:title]
   post.copy = params[:copy]
   post.mood = params[:mood]
   post.currently_playing = params[:currently_playing]
   post.author = params[:author]
   post.save
   redirect to("/post_list/#{ post.id }")
 end	

post '/post_list/update' do
  post = Blog.find params[:id]
  post.title = params[:title]
  post.copy = params[:copy]
  post.mood = params[:mood]
  post.currently_playing = params[:currently_playing]
  post.author = params[:author]
  post.save
  redirect to("/post_list/#{params[:id]}")
end

get '/post_list/:id' do
  @post = Blog.find params[:id]
  erb :post
end

get '/post_list/:id/edit' do
  @post = Blog.find params[:id]
  erb :edit_post
end

get '/post_list/:id/delete' do
  post = Blog.find params[:id]
  post.destroy
  redirect to('/post_list')
end

get '/post_list/mood/:mood' do
  @post_list = Blog.where(:mood => params[:mood])
  erb :post_list
end









