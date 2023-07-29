Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  root "sessions#landing"

  resources :markets, only: [:index, :show] do
    patch 'add_to_favorites', to: 'users/favorites#create', on: :member
    delete 'remove_from_favorites', to: 'users/favorites#destroy', on: :member
    get "search", on: :collection, to: "markets#search"
  end

  resources :users, only: [:show, :new, :create] do
    resources :favorites, only: [:create, :destroy], module: :users
  end

  get "/login", to: "sessions#new"
  post "/login", to: "sessions#create"
  delete "/logout", to: "sessions#destroy"

  get "auth/:provider/callback", to: "sessions#omniauth"
end
