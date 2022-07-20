Rails.application.routes.draw do
  root "articles#index"
  match "signup", :to => 'users#create', :via => 'post'
  get "signup", to: "users#new"
  get "login", to: "sessions#new"
  post "login", to: "sessions#create"
  delete "login", to: "sessions#destroy"
  resources :users, except: [:new]
  resources :articles
  resources :categories, except: [:destroy, :edit]
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
end
