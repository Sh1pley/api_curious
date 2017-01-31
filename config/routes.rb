Rails.application.routes.draw do
  root "home#index"

  get "/auth/github", as: :github_login
  get "/auth/github/callback", to: "sessions#create"
  get "auth/github/logout", to: "sessions#destroy"
  resources :dashboard, only: [:index]
end
