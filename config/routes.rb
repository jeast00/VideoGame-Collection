Rails.application.routes.draw do

  root 'sessions#new'
  
  get '/login' => 'sessions#new'
  get '/signup' => 'users#new'
  post '/signup' => 'users#create'
  post '/sessions' => 'sessions#create'
  delete '/sessions/' => 'sessions#destroy'
  get '/auth/:provider/callback' => 'sessions#create'
  
  #Nested routes new, show, or index

  #'/users'

  #'/users/:id/genres'
  #'/users/:id/games'

  #'/genres'

  #'/genres/:id/games'


  resources :games
  resources :users do
    resources :games
  end

  resources :genres do
    resources :games
  end



  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
