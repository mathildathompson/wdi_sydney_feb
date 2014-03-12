require 'sinatra'
require 'sinatra/reloader'
require 'sqlite3'
require 'pry'

before do
  @categories = query_db('SELECT DISTINCT category FROM products;')
end

get '/' do
  erb :home
end

get '/products' do
  @products = query_db('SELECT * FROM products;')
  erb :products
end

get '/products/new' do
  erb :new_product
end

post '/products/create' do
  sql = "INSERT INTO products (name, category, photo, description, price, checkbox)
          VALUES ('#{params[:name]}', '#{params[:category]}', '#{params[:photo]}', '#{params[:description]}', '#{params[:price]}', '#{params[:checkbox]}');"
  query_db(sql)
  redirect to('/products')
end

post '/products/update' do
  sql = "UPDATE products SET
    name='#{params[:name].gsub("'", "''")}',
    category='#{params[:category].gsub("'", "''")}',
    description='#{params[:description].gsub("'", "''")}',
    price='#{params[:price].gsub("'", "''")}',
    checkbox='#{params[:checkbox]}',
    photo='#{params[:photo].gsub("'", "''")}' WHERE id=#{params[:id]}"
  query_db(sql)
  redirect to("/products/#{params[:id]}")
end

get '/products/:id' do
  results = query_db("SELECT * FROM products WHERE id=#{ params[:id] }")
  @product = results.first
  erb :product
end

get '/products/:id/edit' do
  results = query_db("SELECT * FROM products WHERE id=#{ params[:id] }")
  @product = results.first
  erb :edit_product
end

get '/products/:id/delete' do
  query_db("DELETE FROM products WHERE id=#{ params[:id] }")
  redirect to('/products')
end

get '/products/category/:category' do
  @products = query_db("SELECT * FROM products WHERE category LIKE '#{params[:category]}'")
  erb :products
end

def query_db(sql)
  db = SQLite3::Database.open('products.db')
  db.results_as_hash = true
  puts "SQL: #{ sql }"
  db.execute(sql)
end