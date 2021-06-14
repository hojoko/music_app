Rails.application.routes.draw do
  
  root "users#index"
  get "/login" => "users#login_form"
  post "/login" => "users#login"
  get "logout" => "users#logout"
  
  resources :users
  resources :posts
  
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
