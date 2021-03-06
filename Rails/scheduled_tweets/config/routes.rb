# Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

Rails.application.routes.draw do
  get "about", to:"about#index"
  # Defines the root path route ("/")
  get "password", to: "passwords#edit", as: :edit_password
  patch "password", to: "passwords#update"


  get "sign_up", to: "registrations#new"
  post "sign_up", to: "registrations#create"
  
  get "sign_in", to: "sessions#new"
  post "sign_in", to: "sessions#create"

  delete "logout", to: "session#destroy"

  get "password/reset", to: "password_resets#new"
  post "password/reset", to: "password_resets#create"
  get "password/reset/edit", to: "password_resets#edit"
  patch "password/reset/edit", to: "password_resets#update"

  get "/auth/twitter", to: "omniauth_callbacks#twitter"

  resources :twitter_accounts
  resources :tweets
  root to: "main#index"

  namespace :api do
    namespace :v1 do
      resources :twitter_accounts
    end
  end
end
