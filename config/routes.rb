Rails.application.routes.draw do

	root to: 'sessions#create'
  resources :users
  get '/signup' => 'users#new'
  post '/users' => 'users#create'


  get '/login' => 'sessions#new'
  post '/login' => 'sessions#create'
  get '/logout' => 'sessions#destroy'

  resources :posts

  resources :comments
end

