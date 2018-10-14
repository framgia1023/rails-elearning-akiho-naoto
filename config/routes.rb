Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :users
  resources :relationships, only: [:create, :destroy]
  resources :categories, only: [:index, :show]  
  namespace :admin do
  	resources :categories do
      resources :words
    end
  end

  root "static_pages#home"
  get "/about", to: "static_pages#about"
  get "/login", to: "sessions#new"
  post "/signin", to: "sessions#create"
  delete "/logout", to: "sessions#destroy"
  
end
