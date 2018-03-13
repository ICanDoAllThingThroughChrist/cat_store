Rails.application.routes.draw do
  namespace :visitor do
    get 'subscriptions/index'
    get 'subscriptions/show'
    get 'subscriptions/new'
    post 'subscriptions/create'
  end

  namespace :subscriber do
    get 'subscriptions/index'
    get 'subscriptions/show'
    get 'subscriptions/delete'
  end

  namespace :admin do
    get 'boxes/new'
    post 'boxes/create'
    get 'boxes/update'
    get 'boxes/manual_ship'
  end

  root "boxes#index"
  
  resource :boxes do 
    resources :items 
  end
  # devise_for :users
  namespace :admin do
    root "application#index"
    get '/boxes/:id/items/new', to: 'index#new'
  end
  get 'password_resets/new'
  get 'password_resets/edit'
  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  get '/logout', to: 'sessions#destroy'
  get '/signup', to: 'users#new'
  resources :users
  resources :password_resets,     only: [:new, :create, :edit, :update]
  resources :account_activations, only: [:edit]
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
