Rails.application.routes.draw do
 
  #resources :subscriptions 
  # resources :visitorsubscription 
  # #   get 'visitorsubscriptions', to: 'visitorssubscriptions#new'
  # #   post 'visitorsubscriptions', to: 'visitorsubscriptions#create'
  # # end

  namespace :visitor do
    get 'subscriptions/index',  to: 'visitorsubscriptions#index'
    get '/subscriptions/:id/show', to: 'visitorsubscriptions#show'
    post '/subscriptions/create', to: 'visitorsubscriptions#create'
    get 'subscriptions/delete', to: 'visitorsubscriptions#delete'
  end
  
 
  namespace :subscriber do
    get 'boxes/index'
    get 'boxes/:id/show', to: 'boxes#show'
  end

  namespace :admin do
    get 'boxes/new'
    post 'boxes/create'
    get 'boxes/update'
    get 'boxes/manual_ship'
  end

  root "boxes#index"
  
  resources :boxes do 
    resources :items 
  end
  # devise_for :users
  namespace :admin do
    root "application#index"
    get '/boxes/:id/items/new', to: 'index#new'
  end
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
