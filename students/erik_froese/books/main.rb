# author = butterfly
# book = plant

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
  :username => 'Froese', #your postgres.app username
  :password => "",
  :database => "books"
)
#ActiveRecord::Base.logger = Logger.new(STDOUT)

class Author < ActiveRecord::Base
  has_and_belongs_to_many :books
end

class Book < ActiveRecord::Base
  has_and_belongs_to_many :authors
end


get '/' do
  @books = Book.last(3)

  erb :home
end

get '/authors' do
  @authors = Author.order(:last_name)
  erb :authors
end

get '/authors/new' do
  @authors = Author.all
  erb :new_author
end

post '/authors/create' do
  author = Author.new
  author.first_name = params[:first_name]
  author.last_name = params[:last_name]
  author.photo  = params[:photo]

  author.save
  redirect to("/authors/#{ author.id }")
end

post '/authors/update' do
  author = Author.find params[:id]
  author.first_name = params[:first_name]
  author.last_name = params[:last_name]
  author.photo  = params[:photo]
  
  author.save
  redirect to("/authors/#{params[:id]}")
end

get '/authors/:id' do
  @author = Author.find params[:id]
  @books = @author.books.all
  erb :author
end

get '/authors/:id/edit' do
  @author = Author.find params[:id]
  @books = Book.all
  erb :edit_author
end

get '/authors/:id/delete' do
  author = Author.find params[:id]
  author.destroy
  redirect to('/authors')
end

get '/books' do
  @books = Book.all
  erb :books
end

get '/books/new' do
  @authors = Author.order(:last_name)
  erb :new_book
end

post '/books/create' do
 @book = Book.new

 params.each do |k, v|
  author_id = k.to_i
    if author_id != 0 
          author = Author.find(author_id)
          @book.authors << author
    end
  end

  @book.title = params[:title]
  @book.photo = params[:photo]
  @book.save

  redirect to("/books/#{@book.id}")
end

get '/books/:id/edit' do
  @book = Book.find params[:id]
  @authors = Author.order(:last_name)
  @author_ids = @book.authors.ids
  erb :edit_book
end

post '/books/update' do
  book = Book.find params[:id]
  book.title = params[:title]
  book.photo = params[:photo]
  params.each do |k, v|
  author_id = k.to_i
    if author_id != 0  
    
      author = Author.find (author_id)
      book.authors.delete_all
      book.authors << author
    end
  end

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
