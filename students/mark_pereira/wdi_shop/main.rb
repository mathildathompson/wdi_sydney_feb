require 'pry'
require 'sinatra'
require 'sinatra/reloader'
require 'pg'
require 'active_record'
require 'protected_attributes'

ActiveRecord::Base.establish_connection(
  :adapter => "postgresql",
  :host => "localhost",
  :port => 5432,
  :pool => 8,
  :username => 'markpereira', #your postgres.app username
  :password => "",
  :database => "wdi_shop_app"
  )

ActiveRecord::Base.logger = Logger.new(STDOUT)

 class Product < ActiveRecord::Base
 	attr_accessible :product, :name, :price, :description, :price_type, :photo
 end
 
 get '/' do
 	erb :home
 end	

 get '/product_list' do
 	@product_list = Product.all
 	erb :product_list
 end

 get '/product_list/new' do
 	erb :new_product
 end	

 post '/product_list/create' do
   product = Product.new
   product.product = params[:product]
   product.name = params[:name]
   product.price = params[:price]
   product.description = params[:description]
   product.price_type = params[:price_type]
   product.photo = params[:photo]
   product.save
     redirect to("/product_list/#{ product.id }")
 end	

 post '/product_list/update' do
   product = Product.find params[:id]
   product.product = params[:product]
   product.name = params[:name]
   product.price = params[:price]
   product.description = params[:description]
   product.price_type = params[:price_type]
   product.photo = params[:photo]
   product.save
     redirect to("/product_list/#{params[:id]}")
 end

 get '/product_list/:id' do
   @product = Product.find params[:id]
   erb :product
 end

 get '/product_list/:id/edit' do
   @product = Product.find params[:id]
   erb :edit_product
 end

 get '/product_list/:id/delete' do
   product = Product.find params[:id]
   product.destroy
     redirect to('/product_list')
 end










