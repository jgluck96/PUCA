Rails.application.routes.draw do
  resources :collaborations
  resources :administrations
  resources :projects
  resources :users
  # get '/', to: 'application#home'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
