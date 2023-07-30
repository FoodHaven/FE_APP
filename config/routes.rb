Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  root "sessions#landing"

  get "markets/search", to: "markets#search"

  resources :markets, only: [:index, :show] do
    patch 'add_to_favorites', to: 'users/favorites#create', on: :member
    delete 'remove_from_favorites', to: 'users/favorites#destroy', on: :member
    resources :users, only: [:show]
    resources :routes, only: [:index]
  end
  resources :users, only: [:new, :create]

  get "/login", to: "sessions#new"
  post "/login", to: "sessions#create"
  delete "/logout", to: "sessions#destroy"


  get "auth/:provider/callback", to: "sessions#omniauth"

end