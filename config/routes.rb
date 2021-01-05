Rails.application.routes.draw do
  # Se establece un controlador para las invitaciones
  devise_for :users, controllers: { invitations: 'users/invitations' }

  root to: 'home#index'

  # Esto indica la url y a que controlador#funcion hará referencia
  match '/usuarios', to: 'users#index', via: 'get'
  match '/usuarios/:id', to: 'users#show', via: 'get'
end
