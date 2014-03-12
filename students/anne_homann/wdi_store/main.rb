require 'sinatra'
require 'sinatra/reloader'
require 'sqlite3'
require 'pry'
require 'uri'
require 'cgi'

# before do
#   @families = query_db('SELECT DISTINCT family FROM butterflies;')
# end

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
  sql = "INSERT INTO products (title, price, photo)
          VALUES ('#{params[:title]}', '#{params[:price]}', '#{params[:photo]}');"
  query_db(sql)
  redirect to('/products')
end

post '/products/update' do
  sql = "UPDATE products SET
    title='#{params[:title].gsub("'", "''")}',
    price='#{params[:price].gsub("'", "''")}',
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


def query_db(sql)
  db = SQLite3::Database.open('products.db')
  db.results_as_hash = true
  puts "SQL: #{ sql }"
  db.execute(sql)
end
