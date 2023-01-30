Rails.application.routes.draw do
  root to: 'user#index'
  get 'user/:id', to: 'user#show'
  
  resources :user,only: [:show] do 
    resources :post, only: [:index, :show]

end





  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html


  # Defines the root path route ("/")
  # root "articles#index"
end
