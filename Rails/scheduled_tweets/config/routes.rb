# Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

Rails.application.routes.draw do
  get "about", to:"about#index"
  # Defines the root path route ("/")
  root to: "main#index"
  get "sign_up", to: "registrations#new"
  post "sign_up", to: "registrations#create"
end
