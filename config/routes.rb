Rails.application.routes.draw do

  root 'sessions#new'
  
  get '/login' => 'sessions#new'
  get '/signup' => 'users#new'
  post '/signup' => 'users#create'
  post '/sessions' => 'sessions#create'
  delete '/sessions/' => 'sessions#destroy'
  get '/auth/:provider/callback' => 'sessions#create'
  
  resources :genres


  resources :games do
    resource :genres
  end


  resources :users do
    resources :genres
  end

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
