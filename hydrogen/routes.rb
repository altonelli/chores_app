Rails.application.routes.draw do

  root      "/",                                    to: "home#index"

  # unit routes
  get       "/units/:unit_id",                      to: "unit#show",      as: "unit"
  post      "/units",                               to: "unit#create",    as: "create_unit"
  get       "/units/:unit_id/edit",                 to: "unit#edit",      as: "edit_unit"
  patch     "/units/:unit_id",                      to: "unit#update",    as: "update_unit"
  delete    "/units/:unit_id",                      to: "unit#destroy",   as: "destroy_unit"

  # user routes
  get       "/units/:unit_id/users/new",            to: "user#new",       as: "new_user"
  get       "/units/:unit_id/users/:user_id",       to: "user#show",      as: "user"
  post      "/units/:unit_id/users",                to: "user#create",    as: "create_user"
  patch     "/units/:unit_id/users/:user_id",       to: "user#update",    as: "update_user"
  get       "/units/:unit_id/users/:user_id/edit",  to: "user#edit",      as: "edit_user"
  delete    "/units/:unit_id/users/:user_id",       to: "user#destroy",   as: "destroy_user"

  #chores routes
  get       "/units/:unit_id/chores",                       to: "chores#index",     as: "index_chores"
  get       "/units/:unit_id/chores/new",                   to: "chore#new",        as: "new_chore"
  post      "/units/:unit_id/chores",                       to: "chore#create",     as: "create_chores"
  get       "/units/:unit_id/chores/:chore_id",             to: "chore#edit",       as: "edit_chore"
  patch     "/units/:unit_id/chores/:chore_id",             to: "chore#update",     as: "update_chore"
  patch     "/units/:unit_id/chores/deadline",              to: "chore#deadline",   as: "deadline_chore"
  patch     "/units/:unit_id/chores/:chore_id/assignment",  to: "chore#assignment", as: "assign_chore"
  delete    "/units/:unit_id/chores/:chore_id",             to: "chore#destroy",    as: "destroy_chore"

  #signUp & LogIn
  get "/login",                                     to: "sessions#new",     as: "login"
  get "/logout",                                    to: "sessions#destroy", as: "destroy_session"
  post "/sessions",                                 to: "sessions#create",  as: "new_session"

end
