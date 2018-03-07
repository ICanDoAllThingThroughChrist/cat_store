Rails.application.routes.draw do
  resources :user_subscriptions
  get '/login', to: 'sessions#new'
  get '/signup', to: 'users#new'
  resources :items
  resources :boxes
  resources :box_items
  resources :subscriptions
  resources :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
