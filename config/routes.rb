Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  root "sessions#landing"

  resources :markets, only: [:index, :show]
  resources :users, only: [:show, :new, :create]

  get "/login", to: "sessions#new"
  post "/login", to: "sessions#create"
  delete "/logout", to: "sessions#destroy"
  
  get "markets/search", to: "markets#search"
  
  get "auth/:provider/callback", to: "sessions#omniauth"
  
end
