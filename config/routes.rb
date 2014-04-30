NkuProject::Application.routes.draw do
  resources :users do
    resources :games
    resources :friendships
    resources :comments
  end
  
  resources :games do
    resources :comments
  end
  
  resources :sessions
  resources :games
  resources :friendships
  resources :ratings
  resources :comments do
    member { post :vote }
  end
  
  get "sign_out", to: "sessions#destroy"
  get "profile", to: "users#edit"

  root to: "sessions#new"
end
