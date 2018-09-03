Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  get 'login', to: 'sessions#new', as: :login
  get 'signup', to: 'users#new', as: :signup
  get 'logout', to: 'sessions#destroy', as: :logout
  resources :users
  resources :sessions
  root 'users#new'
end
