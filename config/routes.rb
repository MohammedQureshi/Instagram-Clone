Rails.application.routes.draw do
  devise_for :users
  root to: "main#index"

  get "main", to: "main#index"
  get "settings", to: "settings#index"
  patch "settings", to: "settings#update"
  get "settings/edit", to: "settings#edit"
  get "posts/new", to: "posts#new"
  post "posts/create", to: "posts#create"

  resources :profiles

  resources :friendships, only: [:create, :destroy]

  resources :posts do
    resources :comments
    resources :likes
  end
end
