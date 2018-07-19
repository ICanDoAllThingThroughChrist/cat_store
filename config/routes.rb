Rails.application.routes.draw do

  get 'admin' => 'admin#index'
  resources :subscriptions
 
  resources :orders
  get '/orders/:id' => 'orders#toggle_cancellation', :as => 'cancel_subscription'
  post '/orders/:id', to: 'orders#toggle_cancellation'
  get '/admin/manual_ship' => 'admin#manual_ship', :as => 'boxes_to_be_shipped'
  # end
  root 'sessions#new'
  resources :items 
  resources :boxes do 
    resources :items 
  end
 
  get 'password_resets/new'
  get 'password_resets/edit'
  get '/login' => 'sessions#new', :as => 'login'
  post '/login', to: 'sessions#create'
  get '/logout' => 'sessions#destroy', :as => 'logout'
  get '/signup' => 'users#new', :as => 'signup'
  get '/auth/facebook/callback' => 'sessions#facebook'

  resources :users
  get '/users/:id/box_count' => 'users#box_count', :as => 'box_count'
  resources :password_resets,     only: [:new, :create, :edit, :update]
  resources :account_activations, only: [:edit]
  get 'auth/:provider/callback', to: 'sessions#google_create'
  get 'auth/failure', to: redirect('/')
  get 'signout', to: 'sessions#destroy', as: 'signout'
end
