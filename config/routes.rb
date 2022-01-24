Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  resources :cars, only: %i[index show]
  root 'homes#index'

  get '/help', to: 'homes#show'
end
