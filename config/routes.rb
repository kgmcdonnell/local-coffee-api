Rails.application.routes.draw do
  resources :coffee_shops
  resources :users
  resources :sessions
  resources :posts
end
