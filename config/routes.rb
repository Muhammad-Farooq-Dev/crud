# frozen_string_literal: true

Rails.application.routes.draw do
  resources :users
  get '/about', to: 'users#about'
  resources :books
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
