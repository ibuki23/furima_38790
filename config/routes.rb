Rails.application.routes.draw do
  root to: 'items#index'
  
  devise_for :users
  devise_scope :user do
    get '/users/sign_out' => 'devise/sessions#destroy'
  end
  devise_scope :user do
    get '/users/sign_in' => 'devise/sessions#new'
  end
end
