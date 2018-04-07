Rails.application.routes.draw do
  # resources :subscriber_boxes
  get 'admin' => 'admin#index'
  resources :subscriptions
  # resources :users, only: [:show, :index] do 
  resources :orders #:as => 'orders_of_subscription'
  get '/orders/:id' => 'orders#toggle_cancellation', :as => 'cancel_subscription'
  post '/orders/:id', to: 'orders#toggle_cancellation'
  get '/admin/manual_ship' => 'admin#manual_ship', :as => 'boxes_to_be_shipped'
  # end
  root 'sessions#new'
  resources :items
  resources :boxes do 
    resources :items 
  end
  # devise_for :users
  get 'password_resets/new'
  get 'password_resets/edit'
  get '/login' => 'sessions#new', :as => 'login'
  post '/login', to: 'sessions#create'
  get '/logout' => 'sessions#destroy', :as => 'logout'
  get '/signup' => 'users#new', :as => 'signup'

  resources :users
  resources :password_resets,     only: [:new, :create, :edit, :update]
  resources :account_activations, only: [:edit]
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
