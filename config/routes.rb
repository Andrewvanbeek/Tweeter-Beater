Rails.application.routes.draw do
  root "games#index"
  resources :users
  resources :sessions
  resources :games
end
