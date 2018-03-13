Rails.application.routes.draw do
  root "boxes#index"
  
  resources :boxes do
    resources :items
  end 
  resources :subscriptions do 
    resources :visitors 
  end
  # devise_for :users
  namespace :admin do
    root "application#index"
  end
  get 'password_resets/new'
  get 'password_resets/edit'
  resources :user_subscriptions
  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  get '/logout', to: 'sessions#destroy'
  get '/signup', to: 'users#new'
  resources :box_items
  resources :subscriptions
  resources :users
  resources :password_resets,     only: [:new, :create, :edit, :update]
  resources :account_activations, only: [:edit]
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
