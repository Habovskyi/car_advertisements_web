Rails.application.routes.draw do
  devise_for :users

  root 'homes#index'

  resources :cars, only: %i[index show]
  resources :searches, only: %i[index new create]

  get '/help', to: 'homes#help'
  get '/search', to: 'searches#create'
end
