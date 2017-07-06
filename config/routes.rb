Rails.application.routes.draw do
  devise_for :users

  root to: "pages#home"

  resources :users do
    # get :show, on: :member
    resources :images

  end

  # routes for user auth
  get '/signup' => 'users#new'
  post '/users' => 'users#create'

  get '/signin' => 'sessions#new'
  post '/signin' => 'sessions#create'
  get '/signout' => 'sessions#destroy'
end
