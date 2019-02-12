Rails.application.routes.draw do
  resources :payments
  resources :users
  resources :vehicles
  resources :appointments
  resources :mechanics
  get '/', to: 'sessions#new'
  post '/', to: 'sessions#create'
  delete '/logout', to: 'sessions#destroy'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
