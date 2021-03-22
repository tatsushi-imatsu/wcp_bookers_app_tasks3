Rails.application.routes.draw do
  root to: 'homes#top'
  devise_for :users
  get "/home/about" => "homes#about"
  resources :books, only: [:index, :show, :create, :edit, :update, :destroy] 
  resources :users, only: [:update, :create, :index, :show, :edit]
end