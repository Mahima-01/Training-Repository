Rails.application.routes.draw do
  devise_for :users
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  resources :students
  resources :books
  resources :authors
  resources :issue_returns

  scope module: :admin do
    resources :students
  end
end
