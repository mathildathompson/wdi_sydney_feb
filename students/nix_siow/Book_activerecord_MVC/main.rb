require 'sinatra'
require 'sinatra/reloader'
require 'pg'
require 'active_record'
require 'active_support/all'
require 'protected_attributes'
require 'pry'

ActiveRecord::Base.establish_connection(
  :adapter => "postgresql",
  :host => "localhost",
  :port => 5432,
  :pool => 8,
  :username => 'NixSiow', #your postgres.app username
  :password => "",
  :database => "books"
)

ActiveRecord::Base.logger = Logger.new(STDOUT)

require_relative './models/book.rb'
require_relative './models/author.rb'

after { ActiveRecord::Base.connection.close }

get '/' do
  erb :home
end

get '/books' do
  @books = Book.all
  erb :books
end

get '/books/new' do
  @authors = Author.all
  erb :new_book
end

post '/books/create' do
  book = Book.new
  book.title = params[:title].downcase
  book.photo = params[:photo]
  book.isbn = params[:isbn]
  book.save

  @authors = Author.all
  @authors.each do |author|
    if author.id.to_s == params[author.name]
      book.authors << author
    end
  end

  redirect to("/books/#{ book.id }")
end

post '/books/update' do
  book = Book.find params[:id]
  book.title = params[:title]
  book.photo = params[:photo]
  book.isbn = params[:isbn]

  @authors = Author.all
  book.authors = []
  book.save
  #Delete relationship between authors and book
  @authors.each do |author|
    if author.id.to_s == params[author.name]
      book.authors << author
    end
  end

  book.save
  redirect to("/books/#{params[:id]}")
end

get '/books/:id' do
  @book = Book.find params[:id]
  erb :book
end

get '/books/:id/edit' do
  @book = Book.find params[:id]
  @authors = Author.all
  erb :edit_book
end

get '/books/:id/delete' do
  book = Book.find params[:id]
  book.destroy
  redirect to('/books')
end

get '/authors' do
  @authors = Author.all
  erb :authors
end

get '/authors/new' do
  erb :new_author
end

post '/authors/create' do
  author = Author.new
  author.name = params[:name]

  author.save
  redirect to("/books/new")
end

get '/authors/:id/edit' do
  @author = Author.find params[:id]
  erb :edit_author
end

post '/authors/update' do
  author = Author.find params[:id]
  author.name = params[:name]

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
  erb :author
end

get '/search' do
  @book_query = Book.all(:conditions => ['title ILIKE ?', "%" + params[:query] + "%"])
  @author_query = Author.all(:conditions => ['name ILIKE ?', "%" + params[:query] + "%"])
  @isbn_query = Book.where(:isbn => params[:query]) 

  @results = @book_query | @author_query | @isbn_query
  
  erb :result
end

get '/redirect' do
  erb :redirect
end
