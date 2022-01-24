Rails.application.routes.draw do
  devise_for :users
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  resources :cars, only: %i[index show]
  resources :searches
  root 'homes#index'

  get '/help', to: 'homes#show'

  get '/search', to: 'searches#create'
end
