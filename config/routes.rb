Rails.application.routes.draw do
  root to: 'users#index'

  resources :users,only: [:show, :new, :create] do 
    resources :posts, only: [:index, :show, :create]
end





  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html


  # Defines the root path route ("/")
  # root "articles#index"
end
