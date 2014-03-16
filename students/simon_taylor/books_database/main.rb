require 'sinatra'
require 'sinatra/reloader'

require 'pg'

#code to allow sinatra to interact with ActiveRecord
require 'active_record'
require 'protected_attributes'

require 'pry'

require_relative './models/author.rb'
require_relative './models/book.rb'

ActiveRecord::Base.establish_connection(
  :adapter => "postgresql",
  :host => "localhost",
  :username => 'Nizmox', #your postgres.app username
  :password => "",
  :database => "books_db"
)

ActiveRecord::Base.logger = Logger.new(STDOUT)

after { ActiveRecord::Base.connection.close }

get '/' do
  erb :home
end

get '/search' do
  erb :search
end

get '/results' do

  @authors = Author.where('name like ?',"%#{ params[:search] }%")

  @books = Book.where('title like ?',"%#{ params[:search] }%")

  erb :results
end

# ----- BOOKS ROUTES -----

get '/books' do
  @books = Book.all

  erb :books
end

get '/books/new' do
  @authors = Author.all

  erb :book_new
end

post '/books/create' do

  book = Book.new

  #add all authors to the book
  params[:authors].each do |author_id|
    author = Author.find author_id
    book.authors << author
  end

  book.title = params[:title]
  book.cover = params[:cover]
  book.save

  redirect to("/books/#{book.id}")
end

get '/books/:id/edit' do
  @book = Book.find params[:id]

  @authors = Author.all

  erb :book_edit
end

post '/books/:id/update' do
  book = Book.find params[:id]

  #remove any existing associations
  book.authors.delete_all

  #add all authors to the book
  params[:authors].each do |author_id|
    author = Author.find author_id
    book.authors << author
  end

  book.title = params[:title]
  book.cover = params[:cover]
  book.save

  redirect to("/books/#{book.id}")
end

get '/books/:id/delete' do
  book = Book.find params[:id]
  book.destroy

  redirect to('/books')
end

get '/books/:id' do
  @book = Book.find params[:id]
  @authors = @book.authors.all
  erb :book
end

# ----- AUTHORS ROUTES -----

get '/authors' do
  @authors = Author.all

  erb :authors
end

get '/authors/new' do
  erb :author_new
end

post '/authors/create' do
  author = Author.create
  author.name = params[:name]
  author.photo = params[:photo]
  author.save

  redirect to('/authors')
end

get '/authors/:id/edit' do
  @author = Author.find params[:id]
  erb :author_edit
end

post '/authors/:id/update' do
  author = Author.find params[:id]
  author.name = params[:name]
  author.photo = params[:photo]
  author.save

  redirect to("/authors/#{author.id}")
end

get '/authors/:id/delete' do
  author = Author.find params[:id]
  author.destroy

  redirect to('/authors')
end

get '/authors/:id' do
  @author = Author.find params[:id]
  @books = @author.books.all

  erb :author
end
