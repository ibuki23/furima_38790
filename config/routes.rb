Rails.application.routes.draw do
  root to: 'users#index'
  resources :users, only: :index
  devise_for :users
end
