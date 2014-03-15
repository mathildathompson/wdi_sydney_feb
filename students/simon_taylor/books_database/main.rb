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

#NEED TO USE .CREATE AND NOT .NEW!!!!!!

get '/' do
  erb :home
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

get '/books/:id/edit' do
  @book = Book.find params[:id]

  #how to reset the authors on the form?
  @authors = Author.all

  erb :book_edit
end

post '/books/create' do
  author = Author.find(params[:author])

  book = author.books.create

  #add the co-author
  if params[:co_author] != "None"
    co_author = Author.find(params[:co_author])
    book.authors << co_author
  end

  book.title = params[:title]
  book.cover = params[:cover]
  book.save

  redirect to('/books')
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
