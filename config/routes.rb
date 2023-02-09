Rails.application.routes.draw do
  devise_for :users, controllers: { registrations: 'users/registrations', sessions: 'users/sessions' }

  devise_scope :user do
    root to: "users/sessions#new"
  end
  
  

  resources :users,only: [:index, :show, :new] do 
    resources :posts, only: [:index, :show,:new, :create] do    
      post :like, on: :member
      resources :comments, only: [:new, :create] 
      
  
    end
end





  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html


  # Defines the root path route ("/")
  # root "articles#index"
end
