OceansApp::Application.routes.draw do

  root 'oceans#index'

  resources :oceans

end
