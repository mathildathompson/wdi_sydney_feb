require 'sinatra'
require 'sinatra/reloader'
require 'sqlite3'
require 'pry'

# refactor the db - whatever that means!
def get_product_by_id(id)
  results = query_db("SELECT * FROM products WHERE id=#{ id }")
  @products = results.first
end

get '/' do
  erb :home
end

get '/products' do
  @products = query_db('SELECT * FROM products;')
  @onsale = false
  erb :products
end

get '/products/onsale' do
  @products = query_db("SELECT * FROM products WHERE salestatus=='on'")
  @onsale = true
  erb :products
end

get '/products/new' do
  erb :product_new
end

post '/products/create' do
  sql = "INSERT INTO products (name, price, salestatus, image)
          VALUES ('#{params[:name]}', '#{params[:price]}', '#{params[:salestatus]}', '#{params[:image]}'); "
  query_db(sql)
  redirect to("/products")
end

post '/products/update' do
  sql = "UPDATE products SET
    name='#{params[:name].gsub("'", "''")}',
    price='#{params[:price].gsub("'", "''")}',
    salestatus='#{params[:salestatus]}',
    image='#{params[:image].gsub("'", "''")}' WHERE id=#{ params[:id] }"
  query_db(sql)
  redirect to("/products")
end

get '/products/:id' do
  # these two lines replaced with one line below and a function above - is that refactoring..?
  # results = query_db("SELECT * FROM products WHERE id=#{ params[:id] }")
  # @products = @results.first
  get_product_by_id(params[:id])
  erb :product
end

get '/products/:id/destroy' do
  get_product_by_id(params[:id])
  @product_destroy_options = true
  erb :product
end

get '/products/:id/delete' do
  query_db("DELETE FROM products WHERE id=#{ params[:id] }")
  redirect to('/products')
end

get '/products/:id/edit' do
  get_product_by_id(params[:id])
  erb :product_edit
end




def query_db(sql)
  db = SQLite3::Database.open('wdi_store.db')
  db.results_as_hash = true
  puts "SQL: #{ sql }"
  db.execute(sql)
end