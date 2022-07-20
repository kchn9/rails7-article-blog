Rails.application.routes.draw do
  root "articles#index"
  # users
  match "signup", :to => 'users#create', :via => 'post'
  get "signup", to: "users#new"
  # session
  get "login", to: "sessions#new"
  post "login", to: "sessions#create"
  delete "login", to: "sessions#destroy"
  # resources
  resources :users, except: [:new]
  resources :articles
  resources :categories, except: [:destroy, :edit]
end
