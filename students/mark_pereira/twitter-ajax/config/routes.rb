TwitterAjax::Application.routes.draw do
  get '/posts/:id/comments' => 'posts#comments'
  post '/posts/:id/comments' => 'posts#add_comment'
  resources :posts
  root :to => 'posts#landing'
end
