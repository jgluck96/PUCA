Rails.application.routes.draw do
  resources :collaborations
  resources :administrations
  resources :projects
  resources :users, only: [:show, :new, :create]

  get '/login', to: 'sessions#new', as: 'login'
  post '/login', to: 'sessions#create'
  delete '/logout', to: 'sessions#destroy', as: 'logout'

  # resources :users

  get '/', to: 'home#home', as: 'home'

  get '/showcase', to: 'projects#showcase'


end
