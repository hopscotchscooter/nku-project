NkuProject::Application.routes.draw do
  resources :users do
    resources :games
  end
  resources :sessions
  resources :games
  
  get "sign_out", to: "sessions#destroy"
  get "profile", to: "users#edit"

  root to: "sessions#new"
end
