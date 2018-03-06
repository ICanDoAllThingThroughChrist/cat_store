Rails.application.routes.draw do
  get 'sessions/new'

  resources :items
  resources :boxes
  resources :box_items
  resources :subscriptions
  resources :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
