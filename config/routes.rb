Rails.application.routes.draw do
  get 'users/index'
  get 'users/show'
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  get 'posts/index', to: 'posts#index'
  get 'posts/show', to: 'posts#show'
  # Defines the root path route ("/")
  # root "articles#index"
end
