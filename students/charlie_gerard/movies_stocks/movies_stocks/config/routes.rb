MoviesStocks::Application.routes.draw do
  get '/home' => 'pages#home'

  get '/about' => 'pages#about'

  get '/faq' => 'pages#faq'

  get'/stock' => 'pages#stock'

  get'/movie' => 'pages#movie'

  get'/movie/:id' => 'pages#movie_id'

end
