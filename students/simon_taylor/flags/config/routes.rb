Integrated::Application.routes.draw do

  root :to => "home#index"
  get "/countries/:step/:offset" => "home#countries"
  get "/country/:id" => "home#country"

  #accepts ajax request for countries
  get "/countries" => "home#countries"

end
