Rails.application.routes.draw do
devise_for :uders
root to: "homes#top"
end
