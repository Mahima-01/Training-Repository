Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root "users#index"
  get "users/sign_up"
  post "users/create"

  get 'home/index'
  get 'home/ajax', as: 'ajax'
  get 'users/search'

  resources :users do
    collection do
      get 'searching'
    end
  end
end
