# frozen_string_literal: true

Rails.application.routes.draw do
  root 'home#index'

  resources :beers, only: %i[create new index]
  resources :beer_lists, only: [:update]
  resources :bars, only: %i[show create update]
  resources :autocomplete, only: [:index], format: 'json'
  resources :contact, only: %i[index create]
  resources :map, only: [:index]

  devise_for :managers, path: 'managers', controllers: {
    sessions: 'managers/sessions', registrations: 'managers/registrations', confirmations: 'managers/confirmations'
  }

  devise_for :users, path:  'users', controllers: {
    sessions: 'users/sessions',
    omniauth_callbacks: 'callbacks',
    registrations: 'users/registrations'
  }

  resource :managers do
    resources :bars, only: %i[edit new]
    resources :beer_lists, only: %i[index destroy create edit]
  end

  resource :users do
    resources :bar_wishlists, only: %i[index destroy create edit]
    resources :fav_beer, only: %i[index destroy create]
  end

  patch '/managers/beer_lists/:id/archive', to: 'beer_lists#archive', as: 'archive_managers_beer_list'
  post '/managers/beer_lists/:id/archive', to: 'beer_lists#archive'

  patch '/users/bar_wishlists/:id/visit', to: 'bar_wishlists#visit', as: 'visit_users_bar_wishlist'
  post '/users/bar_wishlists/:id/visit', to: 'bar_wishlists#visit'

  get '/static_pages/:page', to: 'static_pages#show'
  get '/instructions_barman', to: 'static_pages#show', as: 'instructions'

  get '/location', to: 'application#location'

  get 'auth/:provider/callback', to: 'user/sessions#create'
  get 'auth/failure', to: redirect('/')
end
