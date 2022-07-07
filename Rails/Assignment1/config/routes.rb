Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  root "users#index"
  get '/search',to: "users#search"
  resources :users
  
  namespace :api do
    namespace :v1 do
      resources :users
    end
  end
  # Defines the root path route ("/")
  # root "articles#index"
 # scope module: :admin do
  #  resources :users
  #end

end
