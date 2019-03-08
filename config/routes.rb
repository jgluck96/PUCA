Rails.application.routes.draw do
  resources :collaborations
  resources :administrations
  resources :projects
  resources :users

  post '/collaborate', to:"collaborations#add_collaborator"
  get '/login', to: 'sessions#new', as: 'login'
  post '/login', to: 'sessions#create'
  delete '/logout', to: 'sessions#destroy', as: 'logout'

  get '/', to: 'home#home', as: 'home'

  get '/showcase', to: 'projects#showcase'

  get '/my-projects', to: 'users#personal_index', as: 'personal_projects'


end
