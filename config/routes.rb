Rails.application.routes.draw do
  devise_for :managers, path: 'managers', controllers: {
    sessions: 'managers/sessions'
  }
  devise_for :users, path:  'users', controllers: {
    sessions: 'users/sessions'
  }

  root 'home#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
