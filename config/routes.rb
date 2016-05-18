Rails.application.routes.draw do

  root  to: "application#index"
  get "/about",        to: "about#show"

  get "/signup",        to: "users#new"
  get "/login",         to: "sessions#new"
  get "/logout",        to: "sessions#destroy"
  post "/sessions",     to: "sessions#create", as: "sessions"

  post "/users", to: "users#create", as: "users"

  post "/unit/:unit_id/chore/:chore_id/reassign", to: "user_chores#reassign", as: "reassign", :collection => { :user_id => :put }

  post "/unit/:unit_id/user/:user_id/state", to: "unit_users#create", as: "state"
  delete "/unit/:unit_id/user/:user_id/state", to: "unit_users#destroy"
  patch "/unit/:unit_id/user/:user_id/state", to: "unit_users#update"

  patch "/units/:unit_id/chores/:chore_id/user_chores", to: "user_chores#update", as: "user_chores"
  post "/units/:unit_id/chores/:chore_id/user_chores", to: "user_chores#update"


  resources :units do
    resources :users, shallow: true
    resources :chores, shallow: true
    resources :user_chores, only: [:edit,:update]
  end


end
