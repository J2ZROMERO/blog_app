Rails.application.routes.draw do
  root to: 'user#index'
  get 'user/:id', to: 'user#show'
  get 'user/:id', to: 'user#show' do 
  get 'post', to: 'post#index'
end
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
