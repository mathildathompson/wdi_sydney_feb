require 'sinatra'
require 'sinatra/reloader'
require 'sqlite3'
require 'pry'

before do
  @store = query_db('SELECT DISTINCT type FROM store;')
end

get '/' do
  erb :home
end

get '/store' do
  @type = query_db('SELECT * FROM store;')
  erb :store
end

get '/store/new' do
  erb :new_product
end

post '/store/create' do
  sql = "INSERT INTO store (name, type, photo, price)
          VALUES ('#{params[:name]}', '#{params[:type]}', '#{params[:photo]}', '#{params[:price]}');"
  query_db(sql)
  redirect to('/store')
end

post '/store/update' do
  sql = "UPDATE store SET
    name='#{params[:name].gsub("'", "''")}',
    type='#{params[:type].gsub("'", "''")}',
    photo='#{params[:photo].gsub("'", "''")}',
    price='#{params[:price].gsub("'", "''")}' WHERE id=#{params[:id]}"
  query_db(sql)
  redirect to("/store/#{params[:id]}")
end

get '/store/:id' do
  results = query_db("SELECT * FROM store WHERE id=#{ params[:id] }")
  @product = results.first
  erb :product
end

get '/store/:id/edit' do
  results = query_db("SELECT * FROM store WHERE id=#{ params[:id] }")
  @product = results.first
  erb :edit_product
end

get '/store/:id/delete' do
  query_db("DELETE FROM store WHERE id=#{ params[:id] }")
  redirect to('/store')
end

get '/store/type/:type' do
  @type = query_db("SELECT * FROM store WHERE type LIKE '#{params[:type]}'")
  erb :store
end

def query_db(sql)
  db = SQLite3::Database.open('store.db')
  db.results_as_hash = true
  puts "SQL: #{ sql }"
  db.execute(sql)
end