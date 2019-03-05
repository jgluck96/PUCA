Rails.application.routes.draw do
  resources :collaborations
  resources :administrations
  resources :projects
  resources :users
  
  get '/', to: 'application#home'

  get '/showcase', to: 'projects#showcase'
  
end
