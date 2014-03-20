GamesOnRails::Application.routes.draw do
  root :to => 'games#index'
  get '/games' => 'games#index'
  get '/games/eightball' => 'games#eightball'
  get '/games/eightball/question' => 'games#question'
  get '/games/paper_rock_scissors' => 'games#paper_rock_scissors'
  get '/games/secret_number' => 'games#secret_number'

end


