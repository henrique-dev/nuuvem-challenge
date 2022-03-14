Rails.application.routes.draw do
  mount ActionCable.server => '/cable'

  resources :merchants, only: %i[index]
  resources :addresses, only: %i[index]
  resources :purchases, only: %i[]
  resources :items, only: %i[index]
  resources :clients, only: %i[index]

  get 'home', action: :index, controller: 'home'
  put 'home/import_file', action: :import_file, controller: 'home'

  root 'home#index'
end
