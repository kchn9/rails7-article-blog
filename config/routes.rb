Rails.application.routes.draw do
  root "articles#index"
  get "signup", to: "users#new"
  resources :users, except: [:new]
  resources :articles
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
end
