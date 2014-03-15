require 'pry'
require 'sinatra'
require 'sinatra/reloader'
require 'sqlite3'

get '/' do 
	erb :home
end

get '/products' do
	@products = query_db('SELECT * FROM products')
	erb :products
end

get '/product/new' do
	erb :new_product
end

post '/product/create' do
	sql = "INSERT INTO products (name, price, photo)
          VALUES ('#{params[:name]}', '#{params[:price]}', '#{params[:photo]}');"
  	query_db(sql)
	redirect to('/products')
end

post '/products/update' do
  sql = "UPDATE products SET
    name='#{params[:name].gsub("'", "''")}',
    price='#{params[:price]}' WHERE id=#{params[:id]}"
  query_db(sql)
  redirect to("/products/#{params[:id]}")
end

get '/products/:id' do
	result = query_db("SELECT * FROM products WHERE id='#{params[:id]}'")
	@product = result.first
	erb :product
end

get 'products/:id/view' do
	erb :product
end

get '/products/:id/edit' do
	results = query_db("SELECT * FROM products WHERE id='#{params[:id]}'")
	@product = results.first
	erb :edit_product
end

get '/products/:id/delete' do
	query_db("DELETE FROM products WHERE id=#{ params[:id] }")
	redirect to ('/products')
end


def query_db(sql)
  db = SQLite3::Database.open('products.db')
  db.results_as_hash = true
  puts "SQL: #{ sql }"
  db.execute(sql)
end