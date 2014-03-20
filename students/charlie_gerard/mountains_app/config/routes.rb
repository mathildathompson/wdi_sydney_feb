MountainsApp::Application.routes.draw do
  get "/mountains" => 'mountains#index'
  get "/mountains/:id" => 'mountains#show', :as => :mountain
  get "/home" => 'mountains#home'
  get '/new' => 'mountains#new'
  post '/mountains' => 'mountains#create'
  get '/mountains/:id/delete' => 'mountains#destroy', :as => :mountain_destroy
  get '/mountains/:id/edit' => 'mountains#edit', :as => :mountain_edit
  post '/mountains/:id' => 'mountains#update'

  root :to =>'mountains#index'
end
