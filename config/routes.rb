Rails.application.routes.draw do
  root "boxes#index"
  namespace :admin do
    root "application#index"
    resources :boxes, only: [:new, :create, :destroy]
  end

  devise_for :users
  get 'password_resets/new'

  get 'password_resets/edit'

  resources :user_subscriptions
  get '/login', to: 'sessions#new'
  get '/signup', to: 'users#new'
  resources :boxes, only: [:index, :show, :edit, :update] do
    resources :items
  end 
  resources :box_items
  resources :subscriptions
  resources :users
  resources :password_resets,     only: [:new, :create, :edit, :update]
  resources :account_activations, only: [:edit]
  #  resources :users, only: [:show] do 
  #     post :generate_new_password_email 
  #   end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
