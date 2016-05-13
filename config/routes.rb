Rails.application.routes.draw do


  get "/signup",        to: "users#new"
  get "/login",         to: "sessions#new"
  get "/logout",        to: "sessions#destroy"
  post "/sessions",     to: "sessions#create", as: "sessions"

  # get "/users", to: "users#create", as: "users"
  post "/users", to: "users#create", as: "users"

  resources :units do
    resources :users, shallow: true
    resources :chores, shallow: true
    resources :user_chores, only: [:edit,:update]
  end


end
