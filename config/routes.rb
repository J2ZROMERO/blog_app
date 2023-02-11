Rails.application.routes.draw do
  devise_for :users, controllers: { confirmations: 'users/confirmations', passwords: 'users/passwords',registrations: 'users/registrations', sessions: 'users/sessions' }

  devise_scope :user do
    root to: "users/sessions#new"
    get '/users/sign_out', to: 'devise/sessions#destroy'
    get '/users/password', to: 'users/passwords#create'
  end
  
  
  

  resources :users,only: [:index, :show, :new] do 
    resources :posts, only: [:index, :show,:new, :create, :destroy] do    
      post :like, on: :member
      resources :comments, only: [:new, :create, :destroy] 
      
  
    end
end





  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html


  # Defines the root path route ("/")
  # root "articles#index"
end
