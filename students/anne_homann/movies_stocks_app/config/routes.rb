MoviesStocksApp::Application.routes.draw do
  get '/home' => 'pages#home'
  get '/about' => 'pages#about'
  get '/faq' => 'pages#faq'
  get '/movie' => 'pages#movie'
  get '/stock' => 'pages#stock'
  get '/movie_search' => 'movies#search'
  get '/stock_search' => 'stocks#search'

end
