MoviesStocksLab::Application.routes.draw do
  root :to => 'pages#home'

  get '/home' => 'pages#home'
  get '/about' => 'pages#about'
  get '/faq' => 'pages#faq'


  get '/stockapp' => 'stock#stock_search'
  get '/stock' => 'stock#stock'


  get '/movieapp' => 'movie#movie_search'
  get '/movie' => 'movie#movie'
end
