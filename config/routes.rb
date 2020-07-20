Rails.application.routes.draw do
  root 'pages#home'
  get 'about', to: 'pages#about'

  #resources :articles, only: [:show, :index, :new, :create, :edit, :update, :destroy]
  # removing 'only' because (a) all methods are exposed and (b) exposes RESTful transfers
  resources :articles
end
