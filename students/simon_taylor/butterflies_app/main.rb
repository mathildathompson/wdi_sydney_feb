require 'pry'
require 'sqlite3'
require 'sinatra'
require 'sinatra/reloader'

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
  # params = {"name"=>"dasda", "family"=>"asdas", "photo"=>"http://www.google.com"}
  sql = "INSERT INTO butterflies (name, family, photo) VALUES ('#{ params[:name] }','#{ params[:family] }','#{ params[:photo] }');"

  query_db(sql)

  redirect to('butterflies')  
end

post '/butterflies/update' do
  params.each_value do |v|
    v.gsub!("'","''")
  end

  sql = "UPDATE butterflies SET
    name = '#{ params[:name] }',
    family = '#{ params[:family] }',
    photo = '#{ params[:photo] }'
    WHERE id = #{ params[:id] };"
  sql.gsub!("\n    "," ")

  query_db(sql)

  redirect to("/butterflies/#{ params[:id] }")
end

get '/butterflies/:id' do

  @butterfly = query_db("SELECT * FROM butterflies WHERE id=#{ params[:id] };").first

  erb :butterfly
end

get '/butterflies/family/:family' do
  @butterflies = query_db("SELECT * FROM butterflies WHERE family = '#{ params[:family] }';")

  erb :butterflies
end

get '/butterflies/:id/delete' do
  query_db("DELETE FROM butterflies WHERE id=#{params[:id]};")

  redirect to('butterflies')
end

get '/butterflies/:id/edit' do
  @butterfly = query_db("SELECT * FROM butterflies WHERE id=#{params[:id]};").first

  erb :edit_butterfly
end

def query_db(sql)
  db = SQLite3::Database.open('butterflies.db')
  db.results_as_hash = true
  puts "------------------------------------------------------------------"
  puts "- Query Executed: #{sql}"
  puts "------------------------------------------------------------------"
  db.execute(sql)

end