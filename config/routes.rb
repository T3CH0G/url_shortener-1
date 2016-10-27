Rails.application.routes.draw do
  get 'urls/index'

  get 'urls/create'

  get 'urls/new'

  root 'urls#index'
  resources :urls, only: [:index, :new, :create]
end
