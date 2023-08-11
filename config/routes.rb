Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  namespace :api do
    namespace :v1 do
      resources :markets, only: [:index, :show] do
        resources :transit_routes, only: [:index], to: 'markets/transit_routes#index'
      end
      get "/route_details", to: "markets/transit_routes#show"
      get "/favorites", to: "markets/favorites#index"
    end
  end

  root "sessions#landing"

  get "markets/search", to: "markets#search"

  resources :markets, only: [:index, :show] do
    patch 'add_to_favorites', to: 'users/favorites#create', on: :member
    delete 'remove_from_favorites', to: 'users/favorites#destroy', on: :member
    resources :users, only: [:show]
    resources :routes, only: [:index, :show]
  end
  resources :users, only: [:new, :create]

  namespace :users do
    resources :favorites, only: [:index]
  end

  get "/login", to: "sessions#new"
  post "/login", to: "sessions#create"
  delete "/logout", to: "sessions#destroy"

  get "auth/:provider/callback", to: "sessions#omniauth"

  #farmers market db controller routes
  get 'search', to: 'farmers_markets/search#index', as: 'farmers_market_db_search'
  get 'favorites', to: 'farmers_markets/favorites#index', as: 'farmers_market_db_favorites'
end