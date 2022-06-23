Rails.application.routes.draw do
  resources :issues_returns
  root "demo#index"

  get 'demo/index'
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  
  get 'demo/hello'
  # Default route:
  #get ':controller(/:action(/:id))'

  # Defines the root path route ("/")
  # root "articles#index"
end
