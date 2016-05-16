Rails.application.routes.draw do

  root to: "application#index"

  get "/signup",        to: "users#new"
  get "/login",         to: "sessions#new"
  get "/logout",        to: "sessions#destroy"
  post "/sessions",     to: "sessions#create", as: "sessions"

  # get "/users", to: "users#create", as: "users"
  post "/users", to: "users#create", as: "users"

  patch "/unit/:unit_id/user/:user_id/state", to: "unit_users#update", as: "state"

  patch "/chores/:chore_id/user_chores", to: "user_chores#update", as: "user_chores"

  resources :units do
    resources :users, shallow: true
    resources :chores, shallow: true
    resources :user_chores, only: [:edit,:update]
  end


end
