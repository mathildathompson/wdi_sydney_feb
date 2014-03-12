require 'pry'
require 'sinatra'
require 'sinatra/reloader'
require 'sqlite3'

get '/' do
  erb :home
end

get '/products' do
  sql = 'SELECT * FROM products;'

  @products = query_db(sql)

  erb :products
end


post '/products/create' do

  safe_params = sql_safe(params)

  safe_params['sale'] = 0 if safe_params['sale'].nil?

  sql = "INSERT INTO products (name, price, sale) 
  VALUES ('#{safe_params["name"]}','#{safe_params["price"]}',#{safe_params["sale"]});"

  query_db(sql)

  #find the ID of the newly created movie
  id = query_db('SELECT MAX(ID) FROM products;').first['MAX(ID)']

  redirect to("/products/#{id}")
end

post '/products/:id/update' do
  safe_params = sql_safe(params)

  safe_params['sale'] = 0 if safe_params['sale'].nil?

  sql = "UPDATE products SET
         name = '#{safe_params["name"]}',
         price = #{safe_params["price"]},
         sale = #{safe_params["sale"]}
         WHERE id=#{safe_params[:id]};"

  query_db(sql)

  redirect to("/products/#{safe_params[:id]}")
end


get '/products/new' do
  erb :new_product
end

get '/products/:id/edit' do
  sql = "SELECT * FROM products WHERE id=#{params[:id]};"
  
  @product = query_db(sql).first

  erb :edit_product
end

get '/products/:id/delete' do
  sql = "DELETE FROM products WHERE id=#{params[:id]};"

  query_db(sql)

  redirect to('/products')
end

get '/products/:id' do

  sql = "SELECT * FROM products WHERE id=#{params[:id]};"

  @product = query_db(sql).first

  #convert out integer to a string to display in .erb
  case @product['sale'] 
  when 0
    @product['sale'] = "No"
  when 1
    @product['sale'] = "Yes"
  else
    @product['sale'] = "ERROR"
  end

  erb :product

end

def query_db(sql)
  #specifies the path of our database file
  db = SQLite3::Database.open('store.db')

  #forces results returned to be hash format
  db.results_as_hash = true

  #puts a message showing the SQL statement to be executed
  puts "----------------------------------------------------------------"
  puts "Executing SQL: #{ sql }"
  puts "----------------------------------------------------------------"

  #execute the query and return the result
  db.execute(sql)

  #close the connection
  # db.close
end

def sql_safe(values)
  safe_values = {}
  
  values.each do |k,v|
    if v.class == String
      safe_values[k] = v.gsub("'","''") 
    else
      safe_values[k] = v
    end
  end

  safe_values
end