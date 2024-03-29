Rails.application.routes.draw do
  devise_for :students

  root "books#index"
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  resources :students
  resources :books
  resources :authors
  resources :fines
  resources :categories

  resources :issue_returns do
    collection do
      get 'search'
    end
  end
  
  scope module: :admin do
    resources :students
  end
end
