Rails.application.routes.draw do
  devise_for :users

  root to: 'home#index'

  # Esto indica la url y a que controlador#funcion hará referencia
  match '/usuarios', to: 'users#index', via: 'get'
  match '/usuarios/:id', to: 'users#show', via: 'get'
end
