Rails.application.routes.draw do
  
  resources :beers, only: [:create, :new]

  resources :beer_lists, only: [:update]

  patch '/managers/beer_lists/:id/archive', to: "beer_lists#archive", as: 'archive_managers_beer_list'
  post '/managers/beer_lists/:id/archive', to: "beer_lists#archive"

  resources :bars, only: [:show]

  devise_for :managers, path: 'managers', controllers: {
    sessions: 'managers/sessions', registrations: 'managers/registrations', confirmations: 'managers/confirmations' 
  }

  resource :managers do 
    resources :bars, only: [:edit, :new] 
    resources :beer_lists, only: [:index, :destroy, :create, :edit]
    resources :beers, only: [:index]
  end 

  resources :bars, only: [:destroy, :create, :update]


  devise_for :users, path:  'users', controllers: {
    sessions: 'users/sessions'
  }

  get 'resultpage/index' , to: "resultpage#index"
  get 'contact', to: "contact#index"
  root 'home#index'

  get "/static_pages/:page", to: "static_pages#show"

  resources :map, only: [:index]

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end


