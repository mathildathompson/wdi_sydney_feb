Integrated::Application.routes.draw do

  root :to => "home#index"
  get "/country/:id" => "home#country"
  get "/countries" => "home#countries"
  get "/countries/:number" => "home#x_countries"
  get "/countries/:number/:offset" => "home#x_from_y_countries"
end
