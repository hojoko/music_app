Rails.application.routes.draw do
  
  root "top#index"
  get "/login" => "users#login_form"
  post "/login" => "users#login"
  get "logout" => "users#logout"
  
  post "like/:id" => "likes#create"
  delete "like/:id" => "likes#destroy"
  
  resources :users
  resources :posts do
    resource :likes, only: [:create, :destroy]
  end
  
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
