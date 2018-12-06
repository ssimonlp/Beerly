Rails.application.routes.draw do
  
  
  get 'mentionlegale/index'
  get 'apropos/index'
  

 

  devise_for :managers, path: 'managers', controllers: {
    sessions: 'managers/sessions'
  }
  devise_for :users, path:  'users', controllers: {
    sessions: 'users/sessions'
  }

  resources :bars, only: [:show]

  resource :managers do 
    resources :bars, only: [:edit, :destroy, :create, :update, :new]
  end 

  get 'resultpage/index' , to: "resultpage#index"
  get 'contact', to: "contact#index"
  get 'apropos', to: "apropos#index"
  get 'mentions-legales', to: "mentionlegale#index"
  root 'home#index'

  resources :map, only: [:index]

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end


