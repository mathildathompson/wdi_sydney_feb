StockMoviesApp::Application.routes.draw do
  get '/' => 'pages#home'
  get '/home' => 'pages#home'
  get '/movies' => 'movies#movies'
  get '/titles/:title' => 'movies#title'
  get '/stocks' => 'stocks#stocks'
  get '/about' => 'pages#about'
  get '/faq' => 'pages#faq'
end
