Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  resources :students do
    member do
      get :personal_details
    end

    collection do
      get :active
    end
  end
end
