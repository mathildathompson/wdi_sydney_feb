require 'sinatra'
require 'sinatra/reloader'
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
  :database => "bookstore"
)

# after do 
#   ActiveRecord::Base.connection.close
# end

require_relative './models/book.rb'
require_relative './models/author.rb'
require_relative './models/borrower.rb'


get '/' do
  @books = Book.all
  erb :home
end

get '/search' do
  if params[:search_type] == "books"
    if params[:search_terms].blank?
      @books = Book.all
      erb :books
    else
      query = params[:search_terms].downcase
      # this SHOULD BE far more flexible ie. should match regardless of case and should also look for matches in the blurb
      @books = Book.all(:conditions => ['name ILIKE ?', "%" + query + "%"])
      erb :books
    end
  else
    if params[:search_terms].blank?
      @authors = Author.all
      erb :authors
    else
      query = params[:search_terms].downcase
      # this SHOULD BE far more flexible ie. should match regardless of case and should also look for matches in the first name
      @authors = Author.all(:conditions => ['last_name ILIKE ?', "%" + query + "%"])
      erb :authors
    end
  end
end

# authors
# functions
# from here

get '/authors/new' do
  erb :new_author
end
post '/authors/create' do
  author = Author.new
  author.first_name = params[:first_name]
  author.last_name = params[:last_name]
  author.yob = params[:yob]
  author.save
  redirect to('/authors')
end

get '/authors' do
  @authors = Author.all.order(:last_name)
  erb :authors
end

get '/authors/:id' do
  @author = Author.find params[:id]
  erb :author
end

get '/authors/:id/edit' do
  @author = Author.find params[:id]
  erb :edit_author
end
post '/authors/update' do
  author = Author.find params[:id]  
  author.first_name = params[:first_name]
  author.last_name = params[:last_name]
  author.yob = params[:yob]
  author.save
  redirect to('/authors')
end

get '/authors/:id/delete' do
  @author = Author.find params[:id]
  @author.destroy
  redirect to('/authors')
end

# books
# functions
# from here

get '/books' do
  @books = Book.all.order(:name)
  erb :books
end

get '/books/new' do
  @authors = Author.all
  erb :new_Book
end
post '/books/create' do
  book = Book.new
  book.name = params[:name]
  book.blurb = params[:blurb]
  book.image = params[:image]
  book.year = params[:year]
  book.rating = params[:rating]
  book.price = params[:price]

  authors = Author.find params[:author_id]
  book.authors = authors

  book.save
  redirect to('/books')
end

get '/books/:id' do
  @book = Book.find params[:id]
  @borrowers = Borrower.all
  erb :book
end

get '/books/:id/edit' do
  @book = Book.find params[:id]
  @authors = Author.all
  erb :edit_book
end
post '/books/update' do
  book = Book.find params[:id]
  book.name = params[:name]
  book.blurb = params[:blurb]
  book.image = params[:image]
  book.year = params[:year]
  book.rating = params[:rating]
  book.price = params[:price]
  
  authors = Author.find params[:author_id]
  book.authors = authors

  book.save
  redirect to("/books")
end

get '/books/:id/delete' do
  @book = Book.find params[:id]
  @book.destroy
  redirect to('/books')
end

# borrowers
# functions
# from here

get '/borrowers/new' do
  erb :new_borrower
end

get '/borrowers' do
  @borrowers = Borrower.all.order(:last_name)
  erb :borrowers
end

post '/borrowers/create' do
  borrower = Borrower.new
  borrower.first_name = params[:first_name]
  borrower.last_name = params[:last_name]
  borrower.save
  redirect to('/borrowers')
end

post '/books/borrow' do 
  # this works if I chnage the associations to 'has_and_belongs_to_many' but that's not right. Stupid associations.
  borrower = Borrower.find params[:lend_to]
  book = Book.find params[:id]
    
  binding.pry
  borrower.books = book

  borrower.save
end


