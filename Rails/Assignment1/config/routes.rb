Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  root "users#index"
  
  resources :users
  # Defines the root path route ("/")
  # root "articles#index"
  scope module: :admin do
    resources :users
  end
end
