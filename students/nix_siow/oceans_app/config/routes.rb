OceansApp::Application.routes.draw do
  
  get "/oceans" => 'oceans#index'
  get "/oceans/new" => 'oceans#new'
  post "/oceans" => 'oceans#create'
  get "/oceans/:id" => 'oceans#show', :as => :ocean
  get "/oceans/:id/edit" => 'oceans#edit', :as => :ocean_edit
  post "/oceans/:id/destroy" => 'oceans#destroy', :as => :ocean_delete
  post "/oceans/:id" => 'oceans#update'

  root :to => 'oceans#index'
end
