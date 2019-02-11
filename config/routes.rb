Rails.application.routes.draw do
  resources :payments
  resources :users
  resources :vehicles
  resources :appointments
  resources :mechanics
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
