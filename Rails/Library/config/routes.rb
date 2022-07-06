Rails.application.routes.draw do
  devise_for :users
  resources :issues_returns
  root "demo#index"

  get 'demo/index'

  get 'demo/hello'
  # Default route:
  #get ':controller(/:action(/:id))'
  get 'demo/about'
  get 'demo/contact_us'
  # Defines the root path route ("/")
  # root "articles#index"
  
end
