Rails.application.routes.draw do
  root "users#new"
  resources :users
  resources :sessions
  resources :games
  resources :tweets
end
