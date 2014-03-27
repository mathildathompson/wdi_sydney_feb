MountainsApp::Application.routes.draw do

  root :to => 'pages#index'

  get '/home' => 'pages#index' 

  get '/mountains' => 'mountains#index'
  get '/mountains/new' => 'mountains#new'
  get '/mountains/:id' => 'mountains#show', :as => :mountain_show
  get '/mountains/:id/edit' => 'mountains#edit', :as => :mountain_edit

  post '/mountains' => 'mountains#create'
  post '/mountains/:id/update' => 'mountains#update', :as => :mountain_update
  post '/mountains/:id/destroy' => 'mountains#destroy', :as => :mountain_destroy

end
