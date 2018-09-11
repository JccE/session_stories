Rails.application.routes.draw do


  get "/login" => "user_sessions#new", as: :login
  get "/logout" => "user_sessions#destroy", as: :logout

  resources :users
  resources :user_sessions, only: [:new, :create]

  resources :password_resets, only: [:new, :create, :edit]

  resources :products

  resources :sessions

  root "sessions#index"
end
