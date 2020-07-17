Rails.application.routes.draw do
  root 'pages#home'
  get 'about', to: 'pages#about'
  # :articles provides everything; only restricts to a single route
  resources :articles, only: [:show]
end
