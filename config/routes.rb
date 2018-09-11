Rails.application.routes.draw do


  get "/login" => "user_sessions#new", as: :login
  delete "/logout" => "user_sessions#destroy", as: :logout

  resources :users
  resources :user_sessions, only: [:new, :create]
  resources :password_resets, only: [:new, :create, :edit, :update]


  resources :sessions do
    resources :products
  end

  root "sessions#index"
end
