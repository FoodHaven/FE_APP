Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  root "sessions#landing"

  resources :sessions, only: [:new, :create]
  resources :markets, only: [:index]

  get "/login", to: "sessions#login_form"
  post "/login", to: "sessions#login"
end
