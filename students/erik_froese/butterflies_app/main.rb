require 'sinatra'
require 'sinatra/reloader'
require 'sqlite3'
require 'pry'

before do
  @families = query_db('SELECT DISTINCT family FROM butterflies;')
end

get '/' do
  erb :home
end

get '/butterflies' do
  @butterflies = query_db('SELECT * FROM butterflies;')
  erb :butterflies
end

get '/butterflies/new' do
  erb :new_butterfly
end

post '/butterflies/create' do
  sql = "INSERT INTO butterflies (name, family, photo)
          VALUES ('#{params[:name]}', '#{params[:family]}', '#{params[:photo]}');"
  query_db(sql)
  redirect to('/butterflies')
end

post '/butterflies/update' do
  sql = "UPDATE butterflies SET
    name='#{params[:name].gsub("'", "''")}',
    family='#{params[:family].gsub("'", "''")}',
    photo='#{params[:photo].gsub("'", "''")}' WHERE id=#{params[:id]}"
  query_db(sql)
  redirect to("/butterflies/#{params[:id]}")
end

get '/butterflies/:id' do
  results = query_db("SELECT * FROM butterflies WHERE id=#{ params[:id] }")
  @butterfly = results.first
  erb :butterfly
end

get '/butterflies/:id/edit' do
  results = query_db("SELECT * FROM butterflies WHERE id=#{ params[:id] }")
  @butterfly = results.first
  erb :edit_butterfly
end

get '/butterflies/:id/delete' do
  query_db("DELETE FROM butterflies WHERE id=#{ params[:id] }")
  redirect to('/butterflies')
end

get '/butterflies/family/:family' do
  @butterflies = query_db("SELECT * FROM butterflies WHERE family LIKE '#{params[:family]}'")
  erb :butterflies
end

def query_db(sql)
  db = SQLite3::Database.open('butterflies.db')
  db.results_as_hash = true
  puts "SQL: #{ sql }"
  db.execute(sql)
end
