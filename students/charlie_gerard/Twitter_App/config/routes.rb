TwitterApp::Application.routes.draw do
  get '/tweets/:id/newteet' => 'tweets#newtweets'
  post '/tweets/:id/newtweets' => 'tweets#addtweet'	
  resources :tweets
  root :to => 'tweets#landing'
 
end
