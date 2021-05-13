Rails.application.routes.draw do
  root to: "home#top"
  get 'home/top', to: "home#top", as: "home"
  
  #rooms
  get "/rooms/myrooms", to: "rooms#myrooms", as: "myrooms"
  # get "/rooms", to: "rooms#index"
  # post "/rooms", to: "rooms#create"
  # get "/rooms/new", to: "rooms#new", as: "new_room"
  # get "/rooms/:id/edit", to: "rooms#edit", as: "edit_room"
  # get "/rooms/:id", to: "rooms#show", as: "room"
  # patch "/rooms/:id", to: "rooms#update"
  # delete "/rooms/:id", to: "rooms#destroy"
  resources :rooms
  
  #reservations
  resources :reservations
  post "/reservations/confirm", to: "reservations#confirm", as: "confirm_reservation"
  
  #users
  get   "/signup", to: "users#new",   as: "signup"
  post  "/signup", to: "users#create"
  
  get   "/edit_account", to: "users#edit_account", as: "edit_account"
  patch "/update_account",  to: "users#update_account", as:"update_account"
  get   "/update_account",  to: "users#edit_account"
  
  # get   "/myprofile",  to: "users#myprofile", as: "myprofile"
  # patch "/myprofile",  to: "users#update_myprofile",
  # get   "/myprofile/edit", to: "user#edit_myprofile", as: "edit_myprofile"
  
  get   "/users/:id", to: "users#show", as: "user"
  get   "/edit_profile", to: "users#edit_profile", as: "edit_profile"
  patch "/update_profile",  to: "users#update_profile", as: "update_profile"
  get   "/update_profile",  to: "users#edit_profile"
  
  get "/settings", to: "users#settings", as:"settings"
  
  delete "/delete_account", to: "users#destroy", as: "delete_account"
  
  #session
  get  "/signin",  to: "session#new"
  post "/signin",  to: "session#create"
  get  "/signout", to: "session#destroy"
  
end
