require 'pry'
require 'sinatra'
require 'sinatra/reloader'
require 'active_record'
require 'pg'

ActiveRecord::Base.establish_connection(
  :adapter => "postgresql",
  :host => 'localhost',
  :port => 5432,
  :pool => 8,
  :username => 'charlieg', #your postgres.app username
  :password => "",
  :database => "books"
)
ActiveRecord::Base.logger=Logger.new(STDOUT)

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
	# @book = Book.find params[:id]
	erb :books
end

get '/authors' do
	@authors = Author.all
	# @author = Author.find params[:id]
	erb :authors
end

get '/books/new' do
	@authors = Author.all
	@books = Book.all
	erb :new_book
end

get '/authors/new' do
	erb :new_author
end

post '/authors/create' do
	author = Author.new
	author.first_name = params[:first_name]
	author.last_name = params[:last_name]
	author.save
	redirect to("/authors/#{author.id}") 
end

post '/books/create' do
	book = Book.new
	book.title = params[:title]
	book.description = params[:description]
	book.cover = params[:cover]
	book.save
	Author.all.each do |author|
		if author.first_name == params[author.id.to_s]
			book.authors << author
		end
	end
	redirect to("/books/#{book.id}") 
end

post '/books/update' do
	book = Book.find params[:id]
	book.title = params[:title]
	book.description = params[:description]
	book.cover = params[:cover]
	book.save

	Author.all.each do |author|
		if author.first_name == params[author.id.to_s]
			book.authors << author
		end
	end
	
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

get '/authors/:id' do
	@author = Author.find params[:id]
	erb :author
end

get'/authors/:id/' do
	@author = Author.find params[:id]
	erb :author_book
end

get '/authors/:id/delete' do
	author = Author.find params[:id]
	author.destroy
	redirect to('/authors')
end

get'/?search=' do
	erb :search
end


def query_db(sql)
	puts "SQL: #{sql}"
	$db.exec(sql)
end


