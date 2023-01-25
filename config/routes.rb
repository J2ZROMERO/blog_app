Rails.application.routes.draw do
  resources :comments
  resources :posts
  resources :likes
  resources :users
  resources :personita
  resources :create_likes
  resources :create_posts
  resources :create_comments
  resources :create_users
  resources :products
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
