Rails.application.routes.draw do
  root "sessions#index"
  get 'sessions/index'
  get 'sessions/show'
  resources :users
  resources :sessions
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
