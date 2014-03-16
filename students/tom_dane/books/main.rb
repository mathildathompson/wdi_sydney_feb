require 'sinatra'
require 'sinatra/reloader'
require 'pg'
require 'pry'
#require 'active_support/all'
require 'logger'
require 'active_record'
require 'protected_attributes'

ActiveRecord::Base.establish_connection(
  :adapter => "postgresql",
  :host => "localhost",
  :port => 5432,
  :pool => 8,
  :username => 'tomdane', #your postgres.app username
  :password => "okayme",
  :database => "bookstore"
)

class Book < ActiveRecord::Base
  has_and_belongs_to_many :authors
end

class Author < ActiveRecord::Base
  has_and_belongs_to_many :books
end

get '/' do
  @books = Book.all
  @authors = Author.all
  erb :home
end

get '/books' do
  @books = Book.all
  erb :books
end

get '/authors' do
  @authors = Author.all
  erb :authors
end


get '/books/:id' do
  @book = Book.find params[:id]
  erb :book
end

get '/authors/:id' do
  @author = Author.find params[:id]
  erb :author
end

get '/book/new' do

  erb :new_book

  
end  

get '/author/new' do

  erb :new_author

  
end  


post '/books/create' do
  author = Author.find params[:author_id]
  book = author.books.create
  book.title = params[:title]
  book.save
  redirect to("/books/#{ book.id }")

end


post '/authors/create' do
  author = Author.new
  author.name = params[:name]
  author.save
  redirect to("/authors/#{author.id}")
end
