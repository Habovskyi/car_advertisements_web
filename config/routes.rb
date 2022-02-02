Rails.application.routes.draw do
  devise_for :users

  root 'homes#index'

  resources :cars, only: %i[index show]
  resources :searches

  get '/help', to: 'homes#show'
  get '/search', to: 'searches#create'
end
