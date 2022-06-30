# Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

Rails.application.routes.draw do
  get "about", to:"about#index"
  # Defines the root path route ("/")
  
  get "sign_up", to: "registrations#new"
  post "sign_up", to: "registrations#create"
  
  get "sign_in", to: "sessions#new"
  post "sign_in", to: "sessions#create"

  delete "logout", to: "session#destroy"

  root to: "main#index"
end
