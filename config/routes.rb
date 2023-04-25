Rails.application.routes.draw do
  devise_for :users
  root to: "homes#top"
  get '/home/about' =>'homes#about', as: "about"
  resources :books, only: [:new, :index, :show]
  resources :users, only: [:show, :edit]
end
