NkuProject::Application.routes.draw do
  resources :users do
    resources :games
    resources :friendships
  end
  resources :sessions
  resources :games
  resources :friendships
  
  get "sign_out", to: "sessions#destroy"
  get "profile", to: "users#edit"

  root to: "sessions#new"
end
