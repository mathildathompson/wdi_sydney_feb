require 'sinatra'
require 'sinatra/reloader'
require 'pg'
require 'pry'
require 'active_support/all'
require 'logger'
require 'active_record'
require 'protected_attributes'
require 'HTTParty'
require 'ISBNdb'

ActiveRecord::Base.establish_connection(
  :adapter => "postgresql",
  :host => "localhost",
  :port => 5432,
  :pool => 8,
  :username => 'annehomann', #your postgres.app username
  :password => "",
  :database => "books"
)

ActiveRecord::Base.logger = Logger.new(STDOUT)

require_relative './models/book.rb'
require_relative './models/author.rb'


get '/' do

 # search = params[:search]

#   if search != nil
#       search = URI.escape(search)
#       url = "http://isbndb.com//api/v2/json/1YH45CMH/?s=#{ search.downcase }"
#       response = ISBNdb::Query.find_books_by_title("Agile Development")
#       results.each do |result|
#       puts "title: #{result.title}"
#       puts "isbn10: #{result.isbn}"
#       puts "authors: #{result.authors_text}"
#       end   
#   end
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
  book.title = params[:title]
  book.price = params[:price]
  book.isbn = params[:isbn]
  book.photo = params[:photo]
  book.save

  Author.all.each do |author| 
    if author.id.to_s == params[author.first_name] 
      book.authors << author
    end
  end

  book.save
  redirect to('/books')
end

post '/books/update' do
  book = Book.find params[:id]
  book.title = params[:title]
  book.price = params[:price]
  book.isbn = params[:isbn]
  book.photo = params[:photo]
  book.save

 Author.all.each do |author| 
    if author.id.to_s == params[author.first_name] 
      book.authors << author
    end
  end

  book.save
  redirect to("/books/#{ book.id }")
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
  author.first_name = params[:first_name]
  author.last_name = params[:last_name]
  author.photo = params[:photo]
  author.save
  redirect to("authors/#{author.id}")
end  

get '/authors/:id/edit' do
  @author = Author.find params[:id]
  erb :edit_author
end  

post '/authors/:id/update' do
  author = Author.find params[:id]
  author.first_name = params[:first_name]
  author.last_name = params[:last_name]
  author.photo = params[:photo]
  author.save
  redirect to("authors/#{author.id}")
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

