Rails.application.routes.draw do
  devise_for :users

  root to: "pages#home"

  # routes for user auth
  resources :users
  get '/signup' => 'users#new'
  post '/users' => 'users#create'

  get '/signin' => 'sessions#new'
  post '/signin' => 'sessions#create'
  get '/signout' => 'sessions#destroy'
end
