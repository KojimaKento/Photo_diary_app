Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  root to: 'photos#index'

  resources :users do
    resource :relationships, only: [:create, :destroy]
    get :follows, on: :member
    get :followers, on: :member
  end

  resources :photos do 
    resources :comments, only: :create
    resource :favorites, only: [:create, :destroy]
  end

  # get 'talks', to: 'talks#index'
  resources :talks

end
