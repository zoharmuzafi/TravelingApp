Rails.application.routes.draw do

  get 'comments/index'

  get 'comments/new'

  get 'comments/create'

  get 'comments/edit'

  get 'comments/update'

  get 'comments/show'

  get 'comments/destroy'

	root to: 'sessions#create'
  resources :users
  get '/signup' => 'users#new'
  post '/users' => 'users#create'


  get '/login' => 'sessions#new'
  post '/login' => 'sessions#create'
  get '/logout' => 'sessions#destroy'

  resources :posts

end

