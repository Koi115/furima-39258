Rails.application.routes.draw do
  devise_for :users
  root to: 'items#index'
  resources :items, only: [:new, :create ]



  # resources :users, only: [:show, :update]

end
