StockMovie::Application.routes.draw do
 get '/start' => 'pages#start'
 get '/about' => 'pages#about'
 get '/faq' => 'pages#faq'
 
 get '/movies' => 'movies#movie'
 get '/movies/search' => 'movies#search'
 get '/movies/title' => 'movies#title'
 get '/movies/:name' => 'movies#name'

 get '/stocks' => 'stocks#stock'
 get '/stocks/search' => 'stocks#search'

end
