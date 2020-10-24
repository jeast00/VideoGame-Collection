Rails.application.routes.draw do
  
  
  
  resources :genres


  resources :games do
    resource :genres
  end


  resources :users do
    resources :genres
  end



  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
