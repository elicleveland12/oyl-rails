Rails.application.routes.draw do
  resources :payments, except: [:index]
  resources :users, except: [:index]
  resources :vehicles, except: [:index]
  resources :appointments
  resources :mechanics, except: [:index]
  get '/', to: 'sessions#new'
  post '/', to: 'sessions#create'
  delete '/logout', to: 'sessions#destroy'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
