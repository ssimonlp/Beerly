Rails.application.routes.draw do
  
  resources :beers, only: [:create, :new, :index]

  resources :beer_lists, only: [:update]

  patch '/managers/beer_lists/:id/archive', to: "beer_lists#archive", as: 'archive_managers_beer_list'
  post '/managers/beer_lists/:id/archive', to: "beer_lists#archive"


  devise_for :managers, path: 'managers', controllers: {
    sessions: 'managers/sessions', registrations: 'managers/registrations', confirmations: 'managers/confirmations' 
  }

  resource :managers do 
    resources :bars, only: [:edit, :new] 
    resources :beer_lists, only: [:index, :destroy, :create, :edit]
  end 

  resources :bars, only: [:show, :create, :update]

  devise_for :users, path:  'users', controllers: {
    sessions: 'users/sessions',
    omniauth_callbacks: 'callbacks' }

  resource :users do 
    resources :bar_wishlists, only: [:index, :destroy, :create, :edit]
    resources :fav_beer, only: [:index, :destroy, :create]
  end 


  patch '/users/bar_wishlists/:id/visit', to: "bar_wishlists#visit", as: 'visit_users_bar_wishlist'
  post '/users/bar_wishlists/:id/visit', to: "bar_wishlists#visit"


  resources :autocomplete, only: [:index], format: "json"
  get 'resultpage/index' , to: "resultpage#index"
  resources :contact, only: [:index, :create]
  root 'home#index'

  get "/static_pages/:page", to: "static_pages#show"

  resources :map, only: [:index]

  get '/location', to: 'application#location'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  get 'auth/:provider/callback', to: 'user/sessions#create'
  get 'auth/failure', to: redirect('/')
end


