NkuProject::Application.routes.draw do

  resources :users
  resources :sessions
  
  get "sign_out", to: "sessions#destroy"
  get "profile", to: "students#edit"

  root to: "sessions#new"
end
