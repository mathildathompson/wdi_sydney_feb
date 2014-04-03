MountainsApp::Application.routes.draw do
  root :to => 'mountains#index'
  get '/mountains' => 'mountains#index'
  get '/mountains/new' => 'mountains#new'
  post '/mountains' => 'mountains#create'
  get '/mountains/:id' => 'mountains#show', :as => :mountain
  post 'mountains/:id/delete' => 'mountains#destroy', :as => :mountain_delete
  get 'edit/:id' => 'mountains#edit', :as => :mountain_edit
  post 'mountains/:id' => 'mountains#update' 
end
