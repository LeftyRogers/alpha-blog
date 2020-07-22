Rails.application.routes.draw do
  root 'pages#home'

  # clarify route to About page
  get 'about', to: 'pages#about'

  #resources :articles, only: [:show, :index, :new, :create, :edit, :update, :destroy]
  # removing 'only' because (a) all methods are exposed and (b) exposes RESTful transfers
  resources :articles

  # redirect route for signup to the new method
  get 'signup', to: 'users#new'
  post 'users', to: 'users#create'
  resource :users, except: [:new]
end
