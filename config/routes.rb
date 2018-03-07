Rails.application.routes.draw do
  devise_for :users
  get 'password_resets/new'

  get 'password_resets/edit'

  resources :user_subscriptions
  get '/login', to: 'sessions#new'
  get '/signup', to: 'users#new'
  resources :items
  resources :boxes
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
