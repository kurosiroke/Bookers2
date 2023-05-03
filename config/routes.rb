Rails.application.routes.draw do
  devise_for :users
  root to: "homes#top"
  get '/home/about' =>'homes#about', as: "about"
   resources :books, only: [:new, :create, :index, :show, :edit, :update, :destroy] do
    resource :favorites, only: [:create, :login, :destroy]
  end
   resources :users, only: [:index, :show, :edit, :update, :update]
end
